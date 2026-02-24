-- DDL for History





-- NEPABPM.Project.FormQuestionAnswers definition

-- Drop table

-- DROP TABLE NEPABPM.Project.FormQuestionAnswers;

CREATE TABLE NEPABPM.Project.FormQuestionAnswers (
	FormQuestionAnswersId int IDENTITY(1,1) NOT NULL,
	FkProjectId int NOT NULL,
	FkFormQuestionId int NOT NULL,
	IsSkipped bit NULL,
	YesNoAnswer bit NULL,
	TextAnswer varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CreatedDate datetime NOT NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	UpdatedDate datetime NOT NULL,
	TextAnswerUnformatted varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__FormQues__9346C68F6D85B52D PRIMARY KEY (FormQuestionAnswersId),
	CONSTRAINT UC_FormQuestionAnswer UNIQUE (FkProjectId,FkFormQuestionId)
);


-- NEPABPM.Project.FormQuestionAnswers foreign keys

ALTER TABLE NEPABPM.Project.FormQuestionAnswers ADD CONSTRAINT FK_FormQuestionAnswers_FormQuestion FOREIGN KEY (FkFormQuestionId) REFERENCES NEPABPM.App.FormQuestion(FormQuestionId);
ALTER TABLE NEPABPM.Project.FormQuestionAnswers ADD CONSTRAINT FK_FormQuestionAnswers_Project FOREIGN KEY (FkProjectId) REFERENCES NEPABPM.Project.Project(ProjectId);





-- NEPABPM.Project.FormDropdownAnswers definition

-- Drop table

-- DROP TABLE NEPABPM.Project.FormDropdownAnswers;

CREATE TABLE NEPABPM.Project.FormDropdownAnswers (
	FormDropdownAnswersId int IDENTITY(1,1) NOT NULL,
	FkFormQuestionAnswersId int NOT NULL,
	FkFormQuestionid int NOT NULL,
	FkFormDropdownOptionId int NOT NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NOT NULL,
	CONSTRAINT PK__FormDrop__5D87136E374359C0 PRIMARY KEY (FormDropdownAnswersId)
);





-- NEPABPM.Project.FormDropdownAnswers foreign keys

ALTER TABLE NEPABPM.Project.FormDropdownAnswers ADD CONSTRAINT FK__FormDropd__FkFor__70FDBF69 FOREIGN KEY (FkFormQuestionAnswersId) REFERENCES NEPABPM.Project.FormQuestionAnswers(FormQuestionAnswersId);
ALTER TABLE NEPABPM.Project.FormDropdownAnswers ADD CONSTRAINT FK__FormDropd__FkFor__71F1E3A2 FOREIGN KEY (FkFormQuestionid) REFERENCES NEPABPM.App.FormQuestion(FormQuestionId);
ALTER TABLE NEPABPM.Project.FormDropdownAnswers ADD CONSTRAINT FK__FormDropd__FkFor__72E607DB FOREIGN KEY (FkFormDropdownOptionId) REFERENCES NEPABPM.App.FormDropdownOption(FormDropdownOptionId);





-- NEPABPM.Project.FormSubSectionAnswers definition

-- Drop table

-- DROP TABLE NEPABPM.Project.FormSubSectionAnswers;

CREATE TABLE NEPABPM.Project.FormSubSectionAnswers (
	FormSubSectionAnswersId int IDENTITY(1,1) NOT NULL,
	FkProjectId int NOT NULL,
	FkFormSubSectionId int NOT NULL,
	SummaryAnswer varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CreatedDate datetime NULL,
	UpdatedBy varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UpdatedDate datetime NULL,
	SummaryTableImage varbinary(MAX) NULL,
	SummaryAnswerUnformatted varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__FormSubS__42A7B23382A47E14 PRIMARY KEY (FormSubSectionAnswersId)
);


-- NEPABPM.Project.FormSubSectionAnswers foreign keys

ALTER TABLE NEPABPM.Project.FormSubSectionAnswers ADD CONSTRAINT FK__FormSubSe__FkFor__592635D8 FOREIGN KEY (FkFormSubSectionId) REFERENCES NEPABPM.App.FormSubSection(FormSubSectionId);
ALTER TABLE NEPABPM.Project.FormSubSectionAnswers ADD CONSTRAINT FK__FormSubSe__FkPro__5A1A5A11 FOREIGN KEY (FkProjectId) REFERENCES NEPABPM.Project.Project(ProjectId);




