CREATE PROCEDURE NEPABPM.App.usp_InsertFormDropdownOptionHistory
    @FormDropdownOptionId int
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Now datetime = GETDATE();

    -- Close out the previous history record by setting its end date
    UPDATE NEPABPM.App.FormDropdownOptionHistory
    SET HistoryDateTo = @Now
    WHERE FormDropdownOptionId = @FormDropdownOptionId
      AND HistoryDateTo IS NULL;

    -- Insert the new history record
    INSERT INTO NEPABPM.App.FormDropdownOptionHistory (
        HistoryDateFrom,
        HistoryDateTo,
        FormDropdownOptionId,
        FkFormQuestionId,
        Display,
        ShortName,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate,
        OrderNumber,
        AlertMessage,
        IsActive
    )
    SELECT
        @Now,
        NULL,
        FormDropdownOptionId,
        FkFormQuestionId,
        Display,
        ShortName,
        CreatedBy,
        CreatedDate,
        UpdatedBy,
        UpdatedDate,
        OrderNumber,
        AlertMessage,
        IsActive
    FROM NEPABPM.App.FormDropdownOption
    WHERE FormDropdownOptionId = @FormDropdownOptionId;
END;





CREATE PROCEDURE NEPABPM.App.usp_InsertFormQuestionHistory
    @FormQuestionId int
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Now datetime = GETDATE();

    -- Close out the previous history record
    UPDATE NEPABPM.App.FormQuestionHistory
    SET HistoryDateTo = @Now
    WHERE FormQuestionId = @FormQuestionId
      AND HistoryDateTo IS NULL;

    -- Insert the new history record
    INSERT INTO NEPABPM.App.FormQuestionHistory (
        HistoryDateFrom,
        HistoryDateTo,
        FormQuestionId,
        QuestionText,
        InstructionsText,
        IsYesNo,
        IsCheckbox,
        TextRequiredIf,
        DropdownRequiredIf,
        HasAttachment,
        CreatedBy,
        CreatedDate,
        FkSelectionModeId,
        FkTextboxTypeId,
        UpdatedBy,
        UpdatedDate,
        ShowAlertIfAnswerIs,
        AlertMessage,
        ProcessFlowKey,
        NeedsBusinessReview,
        IsReEval,
        NotRequired
    )
    SELECT
        @Now,
        NULL,
        FormQuestionId,
        QuestionText,
        InstructionsText,
        IsYesNo,
        IsCheckbox,
        TextRequiredIf,
        DropdownRequiredIf,
        HasAttachment,
        CreatedBy,
        CreatedDate,
        FkSelectionModeId,
        FkTextboxTypeId,
        UpdatedBy,
        UpdatedDate,
        ShowAlertIfAnswerIs,
        AlertMessage,
        ProcessFlowKey,
        NeedsBusinessReview,
        IsReEval,
        NotRequired
    FROM NEPABPM.App.FormQuestion
    WHERE FormQuestionId = @FormQuestionId;
END;





CREATE PROCEDURE NEPABPM.App.usp_InsertFormSubSectionHistory
    @FormSubSectionId int
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Now datetime = GETDATE();

    UPDATE NEPABPM.App.FormSubSectionHistory
    SET HistoryDateTo = @Now
    WHERE FormSubSectionId = @FormSubSectionId
      AND HistoryDateTo IS NULL;

    INSERT INTO NEPABPM.App.FormSubSectionHistory (
        HistoryDateFrom,
        HistoryDateTo,
        FormSubSectionId,
        FkFormSectionId,
        Heading,
        Instructions,
        OrderNumber,
        FkFormNumberingTypeId,
        IsSummaryRequired,
        SummaryTitleSuffix,
        SummaryHeading,
        SummaryInstructions,
        CreatedBy,
        CreatedDate,
        IsActive
    )
    SELECT
        @Now,
        NULL,
        FormSubSectionId,
        FkFormSectionId,
        Heading,
        Instructions,
        OrderNumber,
        FkFormNumberingTypeId,
        IsSummaryRequired,
        SummaryTitleSuffix,
        SummaryHeading,
        SummaryInstructions,
        CreatedBy,
        CreatedDate,
        IsActive
    FROM NEPABPM.App.FormSubSection
    WHERE FormSubSectionId = @FormSubSectionId;
END;





CREATE PROCEDURE NEPABPM.App.usp_InsertFormSectionHistory
    @FormSectionId int
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Now datetime = GETDATE();

    UPDATE NEPABPM.App.FormSectionHistory
    SET HistoryDateTo = @Now
    WHERE FormSectionId = @FormSectionId
      AND HistoryDateTo IS NULL;

    INSERT INTO NEPABPM.App.FormSectionHistory (
        HistoryDateFrom,
        HistoryDateTo,
        FormSectionId,
        Heading,
        OrderNumber,
        Instructions,
        CreatedBy,
        CreatedDate,
        IsActive,
        DocumentContext
    )
    SELECT
        @Now,
        NULL,
        FormSectionId,
        Heading,
        OrderNumber,
        Instructions,
        CreatedBy,
        CreatedDate,
        IsActive,
        DocumentContext
    FROM NEPABPM.App.FormSection
    WHERE FormSectionId = @FormSectionId;
END;





CREATE PROCEDURE NEPABPM.App.usp_InsertFormSubSectionQuestionHistory
    @FormSubSectionQuestionId int
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Now datetime = GETDATE();

    UPDATE NEPABPM.App.FormSubSectionQuestionHistory
    SET HistoryDateTo = @Now
    WHERE FormSubSectionQuestionId = @FormSubSectionQuestionId
      AND HistoryDateTo IS NULL;

    INSERT INTO NEPABPM.App.FormSubSectionQuestionHistory (
        HistoryDateFrom,
        HistoryDateTo,
        FormSubSectionQuestionId,
        FkFormSubSectionId,
        FkFormQuestionId,
        OrderNumber,
        FkFormNumberingTypeId,
        FkParentId,
        SkipToId,
        SkipToIfAnswerIs,
        RespectCheckboxFlag,
        DocumentContext,
        HideAllSectionsIfAnswerIs
    )
    SELECT
        @Now,
        NULL,
        FormSubSectionQuestionId,
        FkFormSubSectionId,
        FkFormQuestionId,
        OrderNumber,
        FkFormNumberingTypeId,
        FkParentId,
        SkipToId,
        SkipToIfAnswerIs,
        RespectCheckboxFlag,
        DocumentContext,
        HideAllSectionsIfAnswerIs
    FROM NEPABPM.App.FormSubSectionQuestion
    WHERE FormSubSectionQuestionId = @FormSubSectionQuestionId;
END;





