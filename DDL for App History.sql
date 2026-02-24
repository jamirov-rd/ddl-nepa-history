-- DDL for History





-- NEPABPM.App.FormDropdownOption definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormDropdownOption;

CREATE TABLE NEPABPM.App.FormDropdownOption (
	FormDropdownOptionId int IDENTITY(1,1) NOT NULL,
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
	CONSTRAINT PK__FormDrop__EFA06AC36313C176 PRIMARY KEY (FormDropdownOptionId)
);


-- NEPABPM.App.FormDropdownOption foreign keys

ALTER TABLE NEPABPM.App.FormDropdownOption ADD CONSTRAINT FK__FormDropd__FkFor__162F4418 FOREIGN KEY (FkFormQuestionId) REFERENCES NEPABPM.App.FormQuestion(FormQuestionId);





-- NEPABPM.App.FormQuestion definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormQuestion;

CREATE TABLE NEPABPM.App.FormQuestion (
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
	CONSTRAINT PK__FormQues__C751080734CA5622 PRIMARY KEY (FormQuestionId)
);


-- NEPABPM.App.FormQuestion foreign keys





-- NEPABPM.App.FormSubSection definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormSubSection;

CREATE TABLE NEPABPM.App.FormSubSection (
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
	CONSTRAINT PK__FormSubS__DF84181BA54202F4 PRIMARY KEY (FormSubSectionId)
);


-- NEPABPM.App.FormSubSection foreign keys





-- NEPABPM.App.FormSection definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormSection;

CREATE TABLE NEPABPM.App.FormSection (
	FormSectionId int IDENTITY(1,1) NOT NULL,
	Heading varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	OrderNumber int NOT NULL,
	Instructions varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NULL,
	IsActive bit NOT NULL,
	DocumentContext varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__FormSect__3887B20A32F1041C PRIMARY KEY (FormSectionId)
);


-- NEPABPM.App.FormSection foreign keys

ALTER TABLE NEPABPM.App.FormSection ADD CONSTRAINT FormSection_DocumentWorkflowFormMap_FK FOREIGN KEY (DocumentContext) REFERENCES NEPABPM.App.DocumentWorkflowFormMap(FormDocumentContext);





-- NEPABPM.App.FormSubSectionQuestion definition

-- Drop table

-- DROP TABLE NEPABPM.App.FormSubSectionQuestion;

CREATE TABLE NEPABPM.App.FormSubSectionQuestion (
	FormSubSectionQuestionId int IDENTITY(1,1) NOT NULL,
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
	CONSTRAINT PK__FormSubS__0B7A1654D6FBFB0A PRIMARY KEY (FormSubSectionQuestionId)
);


-- NEPABPM.App.FormSubSectionQuestion foreign keys

ALTER TABLE NEPABPM.App.FormSubSectionQuestion ADD CONSTRAINT FK_FormSubSectionQuestion_FormNumberingType FOREIGN KEY (FkFormNumberingTypeId) REFERENCES NEPABPM.App.FormNumberingType(FormNumberingTypeId);
ALTER TABLE NEPABPM.App.FormSubSectionQuestion ADD CONSTRAINT FK_FormSubSectionQuestion_FormQuesiton FOREIGN KEY (FkFormQuestionId) REFERENCES NEPABPM.App.FormQuestion(FormQuestionId);
ALTER TABLE NEPABPM.App.FormSubSectionQuestion ADD CONSTRAINT FK_FormSubSectionQuestion_FormSubSection FOREIGN KEY (FkFormSubSectionId) REFERENCES NEPABPM.App.FormSubSection(FormSubSectionId);
ALTER TABLE NEPABPM.App.FormSubSectionQuestion ADD CONSTRAINT FK_FormSubSectionQuestion_SELF_FkParentId FOREIGN KEY (FkParentId) REFERENCES NEPABPM.App.FormSubSectionQuestion(FormSubSectionQuestionId);




