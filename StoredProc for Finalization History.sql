CREATE OR ALTER PROCEDURE Project.usp_FinalizeDocument
    @DocumentId INT,
    @FinalizedBy VARCHAR(50),
    @AssignmentId INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TranStarted BIT = 0;
    
    BEGIN TRY
        IF @@TRANCOUNT = 0
        BEGIN
            BEGIN TRANSACTION;
            SET @TranStarted = 1;
        END
        ELSE
            SAVE TRANSACTION SP_FinalizeDocument;

        -- Read ProjectId from Document
        DECLARE @ProjectId INT;

        SELECT @ProjectId = FkProjectId
        FROM NEPABPM.Project.Document
        WHERE DocumentId = @DocumentId;

        IF @ProjectId IS NULL
        BEGIN
            RAISERROR('Document not found: %d', 16, 1, @DocumentId);
            RETURN;
        END

        -- 1) Create DocumentFinalization
        DECLARE @DocumentFinalizationId INT;

        INSERT INTO NEPABPM.Project.DocumentFinalization (FkProjectId, FkDocumentId, FinalizedBy, FinalizationDate, AssignmentId)
        VALUES (@ProjectId, @DocumentId, @FinalizedBy, GETDATE(), @AssignmentId);

        SET @DocumentFinalizationId = SCOPE_IDENTITY();

        -- 2) Copy FormQuestionAnswers -> FormQuestionAnswersHistory
        DECLARE @QuestionAnswersMap TABLE (
            OriginalFormQuestionAnswersId INT,
            NewFormQuestionAnswersHistoryId INT
        );

        MERGE INTO NEPABPM.Project.FormQuestionAnswersHistory AS target
        USING (
            SELECT
                fqa.FormQuestionAnswersId,
                fqa.FkFormQuestionId,
                fqa.IsSkipped,
                fqa.YesNoAnswer,
                fqa.TextAnswer,
                fqa.CreatedBy,
                fqa.CreatedDate,
                fqa.UpdatedBy,
                fqa.UpdatedDate,
                fqa.TextAnswerUnformatted
            FROM NEPABPM.Project.FormQuestionAnswers fqa
            WHERE fqa.FkProjectId = @ProjectId
        ) AS source
        ON 1 = 0
        WHEN NOT MATCHED THEN
            INSERT (
                FkDocumentFinalizationId,
                FormQuestionAnswersId,
                FkFormQuestionId,
                IsSkipped,
                YesNoAnswer,
                TextAnswer,
                CreatedBy,
                CreatedDate,
                UpdatedBy,
                UpdatedDate,
                TextAnswerUnformatted
            )
            VALUES (
                @DocumentFinalizationId,
                source.FormQuestionAnswersId,
                source.FkFormQuestionId,
                source.IsSkipped,
                source.YesNoAnswer,
                source.TextAnswer,
                source.CreatedBy,
                source.CreatedDate,
                source.UpdatedBy,
                source.UpdatedDate,
                source.TextAnswerUnformatted
            )
        OUTPUT source.FormQuestionAnswersId, inserted.FormQuestionAnswersHistoryId
        INTO @QuestionAnswersMap (OriginalFormQuestionAnswersId, NewFormQuestionAnswersHistoryId);

        -- 3) Copy FormDropdownAnswers -> FormDropdownAnswersHistory
        INSERT INTO NEPABPM.Project.FormDropdownAnswersHistory (
            FkFormQuestionAnswersHistoryId,
            FormDropdownAnswersId,
            FkFormQuestionAnswersId,
            FkFormDropdownOptionId,
            CreatedBy,
            CreatedDate
        )
        SELECT
            qam.NewFormQuestionAnswersHistoryId,
            fda.FormDropdownAnswersId,
            fda.FkFormQuestionAnswersId,
            fda.FkFormDropdownOptionId,
            fda.CreatedBy,
            fda.CreatedDate
        FROM NEPABPM.Project.FormDropdownAnswers fda
        INNER JOIN @QuestionAnswersMap qam
            ON qam.OriginalFormQuestionAnswersId = fda.FkFormQuestionAnswersId;

        -- 4) Copy FormSubSectionAnswers -> FormSubSectionAnswersHistory
        INSERT INTO NEPABPM.Project.FormSubSectionAnswersHistory (
            FkDocumentFinalizationId,
            FkFormSubSectionId,
            SummaryAnswer,
            CreatedBy,
            CreatedDate,
            UpdatedBy,
            UpdatedDate,
            SummaryTableImage,
            SummaryAnswerUnformatted
        )
        SELECT
            @DocumentFinalizationId,
            fssa.FkFormSubSectionId,
            fssa.SummaryAnswer,
            fssa.CreatedBy,
            fssa.CreatedDate,
            fssa.UpdatedBy,
            fssa.UpdatedDate,
            fssa.SummaryTableImage,
            fssa.SummaryAnswerUnformatted
        FROM NEPABPM.Project.FormSubSectionAnswers fssa
        WHERE fssa.FkProjectId = @ProjectId;

        IF @TranStarted = 1
            COMMIT TRANSACTION;

        SELECT @DocumentFinalizationId AS DocumentFinalizationId;

    END TRY
    BEGIN CATCH
        IF @TranStarted = 1 AND @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        ELSE IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION SP_FinalizeDocument;

        THROW;
    END CATCH
END;