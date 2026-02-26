-- DDL for History





-- NEPABPM.Project.DocumentFinalization definition

-- Drop table

-- DROP TABLE NEPABPM.Project.DocumentFinalization;

CREATE TABLE NEPABPM.Project.DocumentFinalization (
	DocumentFinalizationId int IDENTITY(1,1) NOT NULL,
	FkProjectId int NOT NULL,
	FkDocumentId int NOT NULL,
	FinalizedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FinalizationDate datetime NOT NULL,
	AssignmentId int NOT NULL,
	IsWorkflowCompletedSuccessfully bit NOT NULL CONSTRAINT DF_DocumentFinalization_IsWorkflowCompletedSuccessfully DEFAULT (0),

	IsUnfinalized bit NOT NULL CONSTRAINT DF_DocumentFinalization_IsUnfinalized DEFAULT (0),
	UnFinalizedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UnFinalizationDate datetime NULL,

	CONSTRAINT PK__DocumentFinalization__DocumentFinalizationId PRIMARY KEY (DocumentFinalizationId)
);


-- NEPABPM.Project.DocumentFinalization foreign keys

ALTER TABLE NEPABPM.Project.DocumentFinalization ADD CONSTRAINT DocumentFinalization_Document_FK FOREIGN KEY (FkDocumentId) REFERENCES NEPABPM.Project.Document(DocumentId);
ALTER TABLE NEPABPM.Project.DocumentFinalization ADD CONSTRAINT DocumentFinalization_Project_FK FOREIGN KEY (FkProjectId) REFERENCES NEPABPM.Project.Project(ProjectId);

CREATE NONCLUSTERED INDEX IX_DocumentFinalization_FinalizationDate
ON NEPABPM.Project.DocumentFinalization (FinalizationDate);

CREATE NONCLUSTERED INDEX IX_DocumentFinalization_AssignmentId
ON NEPABPM.Project.DocumentFinalization (AssignmentId);





-- NEPABPM.Project.FormQuestionAnswersHistory definition

-- Drop table

-- DROP TABLE NEPABPM.Project.FormQuestionAnswersHistory;

CREATE TABLE NEPABPM.Project.FormQuestionAnswersHistory (
	FormQuestionAnswersHistoryId int IDENTITY(1,1) NOT NULL,
	FkDocumentFinalizationId int NOT NULL,
	FormQuestionAnswersId int NOT NULL,
	FkFormQuestionId int NOT NULL,
	IsSkipped bit NULL,
	YesNoAnswer bit NULL,
	TextAnswer varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CreatedDate datetime NOT NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	UpdatedDate datetime NOT NULL,
	TextAnswerUnformatted varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__FormQuestionAnswersHistory__FormQuestionAnswersHistoryId PRIMARY KEY (FormQuestionAnswersHistoryId)
);


-- NEPABPM.Project.FormQuestionAnswersHistory foreign keys

ALTER TABLE NEPABPM.Project.FormQuestionAnswersHistory ADD CONSTRAINT FK_FormQuestionAnswersHistory_DocumentFinalization FOREIGN KEY (FkDocumentFinalizationId) REFERENCES NEPABPM.Project.DocumentFinalization(DocumentFinalizationId);

CREATE NONCLUSTERED INDEX IX_FormQuestionAnswersHistory_FormQuestionAnswersId
ON NEPABPM.Project.FormQuestionAnswersHistory (FormQuestionAnswersId);

CREATE NONCLUSTERED INDEX IX_FormQuestionAnswersHistory_FkFormQuestionId
ON NEPABPM.Project.FormQuestionAnswersHistory (FkFormQuestionId);





-- NEPABPM.Project.FormDropdownAnswersHistory definition

-- Drop table

-- DROP TABLE NEPABPM.Project.FormDropdownAnswersHistory;

CREATE TABLE NEPABPM.Project.FormDropdownAnswersHistory (
	FormDropdownAnswersHistoryId int IDENTITY(1,1) NOT NULL,
	FkFormQuestionAnswersHistoryId int NOT NULL,
	FormDropdownAnswersId int NOT NULL,
	FkFormQuestionAnswersId int NOT NULL,
	FkFormDropdownOptionId int NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NOT NULL,
	CONSTRAINT PK__FormDropdownAnswersHistory__FormDropdownAnswersHistoryId PRIMARY KEY (FormDropdownAnswersHistoryId)
);


-- NEPABPM.Project.FormDropdownAnswersHistory foreign keys

ALTER TABLE NEPABPM.Project.FormDropdownAnswersHistory ADD CONSTRAINT FK_FormDropdownAnswersHistory_FormQuestionAnswersHistory FOREIGN KEY (FkFormQuestionAnswersHistoryId) REFERENCES NEPABPM.Project.FormQuestionAnswersHistory(FormQuestionAnswersHistoryId);

CREATE NONCLUSTERED INDEX IX_FormDropdownAnswersHistory_FormDropdownAnswersId
ON NEPABPM.Project.FormDropdownAnswersHistory (FormDropdownAnswersId);

CREATE NONCLUSTERED INDEX IX_FormDropdownAnswersHistory_FkFormQuestionAnswersId
ON NEPABPM.Project.FormDropdownAnswersHistory (FkFormQuestionAnswersId);

CREATE NONCLUSTERED INDEX IX_FormDropdownAnswersHistory_FkFormDropdownOptionId
ON NEPABPM.Project.FormDropdownAnswersHistory (FkFormDropdownOptionId);





-- NEPABPM.Project.FormSubSectionAnswersHistory definition

-- Drop table

-- DROP TABLE NEPABPM.Project.FormSubSectionAnswersHistory;

CREATE TABLE NEPABPM.Project.FormSubSectionAnswersHistory (
	FormSubSectionAnswersHistoryId int IDENTITY(1,1) NOT NULL,
	FkDocumentFinalizationId int NOT NULL,
	FormSubSectionAnswersId int NOT NULL,
	FkFormSubSectionId int NOT NULL,
	SummaryAnswer varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UpdatedDate datetime NULL,
	SummaryTableImage varbinary(MAX) NULL,
	SummaryAnswerUnformatted varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__FormSubSectionAnswersHistory__FormSubSectionAnswersHistoryId PRIMARY KEY (FormSubSectionAnswersHistoryId)
);


-- NEPABPM.Project.FormSubSectionAnswersHistory foreign keys

ALTER TABLE NEPABPM.Project.FormSubSectionAnswersHistory ADD CONSTRAINT FK_FormSubSectionAnswersHistory_DocumentFinalization FOREIGN KEY (FkDocumentFinalizationId) REFERENCES NEPABPM.Project.DocumentFinalization(DocumentFinalizationId);

CREATE NONCLUSTERED INDEX IX_FormSubSectionAnswersHistory_FormSubSectionAnswersId
ON NEPABPM.Project.FormSubSectionAnswersHistory (FormSubSectionAnswersId);

CREATE NONCLUSTERED INDEX IX_FormSubSectionAnswersHistory_FkFormSubSectionId
ON NEPABPM.Project.FormSubSectionAnswersHistory (FkFormSubSectionId);




