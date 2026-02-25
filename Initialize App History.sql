--------------------------------------------------------
---- FormDropdownOption / FormDropdownOptionHistory ----
--------------------------------------------------------

DECLARE @Id INT;

DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT FormDropdownOptionId FROM NEPABPM.App.FormDropdownOption;

OPEN cur;
FETCH NEXT FROM cur INTO @Id;

WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC App.usp_InsertFormDropdownOptionHistory @FormDropdownOptionId = @Id;
    FETCH NEXT FROM cur INTO @Id;
END

CLOSE cur;
DEALLOCATE cur;

--------------------------------------------
---- FormQuestion / FormQuestionHistory ----
--------------------------------------------

DECLARE @Id INT;

DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT FormQuestionId FROM NEPABPM.App.FormQuestion;

OPEN cur;
FETCH NEXT FROM cur INTO @Id;

WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC App.usp_InsertFormQuestionHistory @FormQuestionId = @Id;
    FETCH NEXT FROM cur INTO @Id;
END

CLOSE cur;
DEALLOCATE cur;

------------------------------------------------
---- FormSubSection / FormSubSectionHistory ----
------------------------------------------------

DECLARE @Id INT;

DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT FormSubSectionId FROM NEPABPM.App.FormSubSection;

OPEN cur;
FETCH NEXT FROM cur INTO @Id;

WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC App.usp_InsertFormSubSectionHistory @FormSubSectionId = @Id;
    FETCH NEXT FROM cur INTO @Id;
END

CLOSE cur;
DEALLOCATE cur;

------------------------------------------
---- FormSection / FormSectionHistory ----
------------------------------------------

DECLARE @Id INT;

DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT FormSectionId FROM NEPABPM.App.FormSection;

OPEN cur;
FETCH NEXT FROM cur INTO @Id;

WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC App.usp_InsertFormSectionHistory @FormSectionId = @Id;
    FETCH NEXT FROM cur INTO @Id;
END

CLOSE cur;
DEALLOCATE cur;

----------------------------------------------------------------
---- FormSubSectionQuestion / FormSubSectionQuestionHistory ----
----------------------------------------------------------------

DECLARE @Id INT;

DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
    SELECT FormSubSectionQuestionId FROM NEPABPM.App.FormSubSectionQuestion;

OPEN cur;
FETCH NEXT FROM cur INTO @Id;

WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC App.usp_InsertFormSubSectionQuestionHistory @FormSubSectionQuestionId = @Id;
    FETCH NEXT FROM cur INTO @Id;
END

CLOSE cur;
DEALLOCATE cur;
