# History

## 1. Tables

The following tables are candidates for addition to history:
```
Project.FormDropDownAnswers (+App.FormDropDownOption?)
Project.FormQuestionAnswers (+App.FormQuestion?)
Project.FormSubsectionAnswers (+App.FormSubsectionQuestion +App.FormSubsection +App.FormSection?)
```

# 2. Document finalization history
SQL:
[DDL for History.sql](DDL%20for%20History.sql)

General Idea:
![DDL for History - General Idea.png](DDL%20for%20History%20-%20General%20Idea.png)
    

# 3. App history

SQL: TODO

General Idea:
- create a history table for each of those App entities:
    - `App.FormSubsection`
    - `App.FormSection`
    - `App.FormDropDownOption`
    - `App.FormQuestion`
    - `App.FormSubsectionQuestion`

e.g.
![App History.png](App%20History.png)
