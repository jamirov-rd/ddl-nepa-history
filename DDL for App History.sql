-- DDL for History





-- NEPABPM.App.FormDropdownOptionHistory definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormDropdownOptionHistory;

CREATE TABLE NEPABPM.App.FormDropdownOptionHistory (
	FormDropdownOptionHistoryId int IDENTITY(1,1) NOT NULL,
	HistoryDateFrom datetime NOT NULL,
	HistoryDateTo datetime NULL,
	FormDropdownOptionId int NOT NULL,
	FkFormQuestionId int NOT NULL,
	Display varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ShortName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NOT NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UpdatedDate datetime NOT NULL,
	OrderNumber int NULL,
	AlertMessage nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IsActive bit NULL,
	CONSTRAINT PK__FormDropdownOptionHistory__FormDropdownOptionHistoryId PRIMARY KEY (FormDropdownOptionHistoryId)
);

CREATE NONCLUSTERED INDEX IX_FormDropdownOptionHistory_FormDropdownOptionId
ON NEPABPM.App.FormDropdownOptionHistory (FormDropdownOptionId);

CREATE NONCLUSTERED INDEX IX_FormDropdownOptionHistory_FkFormQuestionId
ON NEPABPM.App.FormDropdownOptionHistory (FkFormQuestionId);

CREATE NONCLUSTERED INDEX IX_FormDropdownOptionHistory_HistoryDates
ON NEPABPM.App.FormDropdownOptionHistory (HistoryDateFrom, HistoryDateTo);





-- NEPABPM.App.FormQuestionHistory definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormQuestionHistory;

CREATE TABLE NEPABPM.App.FormQuestionHistory (
	FormQuestionHistoryId int IDENTITY(1,1) NOT NULL,
	HistoryDateFrom datetime NOT NULL,
	HistoryDateTo datetime NULL,
	FormQuestionId int NOT NULL,
	QuestionText varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	InstructionsText varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IsYesNo bit NOT NULL,
	IsCheckbox bit NOT NULL,
	TextRequiredIf bit NULL,
	DropdownRequiredIf bit NULL,
	HasAttachment bit NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NULL,
	FkSelectionModeId int NULL,
	FkTextboxTypeId int NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UpdatedDate datetime NULL,
	ShowAlertIfAnswerIs bit NULL,
	AlertMessage varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProcessFlowKey varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	NeedsBusinessReview bit NULL,
	IsReEval bit NULL,
	NotRequired bit NULL,
	CONSTRAINT PK__FormQuestionHistory__FormQuestionHistoryId PRIMARY KEY (FormQuestionHistoryId)
);

CREATE NONCLUSTERED INDEX IX_FormQuestionHistory_FormQuestionId
ON NEPABPM.App.FormQuestionHistory (FormQuestionId);

CREATE NONCLUSTERED INDEX IX_FormQuestionHistory_HistoryDates
ON NEPABPM.App.FormQuestionHistory (HistoryDateFrom, HistoryDateTo);

-- NEPABPM.App.FormQuestionHistory foreign keys





-- NEPABPM.App.FormSubSectionHistory definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormSubSectionHistory;

CREATE TABLE NEPABPM.App.FormSubSectionHistory (
	FormSubSectionHistoryId int IDENTITY(1,1) NOT NULL,
	HistoryDateFrom datetime NOT NULL,
	HistoryDateTo datetime NULL,
	FormSubSectionId int NOT NULL,
	FkFormSectionId int NOT NULL,
	Heading varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Instructions varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	OrderNumber int NOT NULL,
	FkFormNumberingTypeId int NOT NULL,
	IsSummaryRequired bit NULL,
	SummaryTitleSuffix varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SummaryHeading varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SummaryInstructions varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NULL,
	IsActive bit NOT NULL,
	CONSTRAINT PK__FormSubSectionHistory__FormSubSectionHistoryId PRIMARY KEY (FormSubSectionHistoryId)
);

CREATE NONCLUSTERED INDEX IX_FormSubSectionHistory_FormSubSectionId
ON NEPABPM.App.FormSubSectionHistory (FormSubSectionId);

CREATE NONCLUSTERED INDEX IX_FormSubSectionHistory_FkFormSectionId
ON NEPABPM.App.FormSubSectionHistory (FkFormSectionId);

CREATE NONCLUSTERED INDEX IX_FormSubSectionHistory_HistoryDates
ON NEPABPM.App.FormSubSectionHistory (HistoryDateFrom, HistoryDateTo);

-- NEPABPM.App.FormSubSectionHistory foreign keys





-- NEPABPM.App.FormSectionHistory definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormSectionHistory;

CREATE TABLE NEPABPM.App.FormSectionHistory (
	FormSectionHistoryId int IDENTITY(1,1) NOT NULL,
	HistoryDateFrom datetime NOT NULL,
	HistoryDateTo datetime NULL,
	FormSectionId int NOT NULL,
	Heading varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	OrderNumber int NOT NULL,
	Instructions varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NULL,
	IsActive bit NOT NULL,
	DocumentContext varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__FormSectionHistory__FormSectionHistoryId PRIMARY KEY (FormSectionHistoryId)
);

CREATE NONCLUSTERED INDEX IX_FormSectionHistory_FormSectionId
ON NEPABPM.App.FormSectionHistory (FormSectionId);

CREATE NONCLUSTERED INDEX IX_FormSectionHistory_HistoryDates
ON NEPABPM.App.FormSectionHistory (HistoryDateFrom, HistoryDateTo);





-- NEPABPM.App.FormSubSectionQuestionHistory definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormSubSectionQuestionHistory;

CREATE TABLE NEPABPM.App.FormSubSectionQuestionHistory (
	FormSubSectionQuestionHistoryId int IDENTITY(1,1) NOT NULL,
	HistoryDateFrom datetime NOT NULL,
	HistoryDateTo datetime NULL,
	FormSubSectionQuestionId int NOT NULL,
	FkFormSubSectionId int NOT NULL,
	FkFormQuestionId int NOT NULL,
	OrderNumber int NOT NULL,
	FkFormNumberingTypeId int NOT NULL,
	FkParentId int NULL,
	SkipToId int NULL,
	SkipToIfAnswerIs bit NULL,
	RespectCheckboxFlag bit NULL,
	DocumentContext varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	HideAllSectionsIfAnswerIs bit NULL,
	CONSTRAINT PK__FormSubSectionQuestionHistory__FormSubSectionQuestionHistoryId PRIMARY KEY (FormSubSectionQuestionHistoryId)
);

CREATE NONCLUSTERED INDEX IX_FormSubSectionQuestionHistory_FormSubSectionQuestionId
ON NEPABPM.App.FormSubSectionQuestionHistory (FormSubSectionQuestionId);

CREATE NONCLUSTERED INDEX IX_FormSubSectionQuestionHistory_FkFormSubSectionId
ON NEPABPM.App.FormSubSectionQuestionHistory (FkFormSubSectionId);

CREATE NONCLUSTERED INDEX IX_FormSubSectionQuestionHistory_FkFormQuestionId
ON NEPABPM.App.FormSubSectionQuestionHistory (FkFormQuestionId);

CREATE NONCLUSTERED INDEX IX_FormSubSectionQuestionHistory_HistoryDates
ON NEPABPM.App.FormSubSectionQuestionHistory (HistoryDateFrom, HistoryDateTo);





