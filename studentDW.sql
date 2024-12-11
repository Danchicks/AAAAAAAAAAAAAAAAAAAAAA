
CREATE TABLE [dbo].[Dim_Student] (
    [StudentID] INT IDENTITY(1,1) PRIMARY KEY,
    [StudentKey] INT NOT NULL,
    [LastName] NVARCHAR(50),
    [FirstName] NVARCHAR(50),
		[StudentCardNumber] NVARCHAR(20) NOT NULL,
    [MiddleName] NVARCHAR(50),
    [Gender] CHAR(1),
    
);


CREATE TABLE [dbo].[Dim_Group] (
    [GroupID] INT IDENTITY(1,1) PRIMARY KEY,
    [GroupKey] INT NOT NULL,
    [GroupName] NVARCHAR(50),
    [Course] INT,
	[LeaderStudentID] INT NULL
);


  CREATE TABLE [dbo].[Dim_Subject] (
    [SubjectID] INT IDENTITY(1,1) PRIMARY KEY,
    [SubjectKey] INT NOT NULL,
    [Name] NVARCHAR(100),
    [Coefficient] INT
);


CREATE TABLE [dbo].[Dim_Lecturer] (
    [LecturerID] INT IDENTITY(1,1) PRIMARY KEY,
	[LecturerKey] INT NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [FirstName] NVARCHAR(50) NOT NULL,
    [MiddleName] NVARCHAR(50)
);

CREATE TABLE [dbo].[Fact_Performance] (
    [FactID] INT IDENTITY(1,1) PRIMARY KEY,
    [StudentID] INT NOT NULL,
    [GroupID] INT NOT NULL,
    [SubjectID] INT NOT NULL,
    [LecturerID] INT NOT NULL,
    [Semester] TINYINT NOT NULL,
    [Year] INT NOT NULL,
    [Score] INT NOT NULL,
	[Rating] [int] NULL,
	[Grade] VARCHAR(50) NOT NULL,
    [Scholarship] DECIMAL(10,2)

);

ALTER TABLE [Fact_Performance] ADD CONSTRAINT FK_Student
FOREIGN KEY ([StudentID]) REFERENCES [Dim_Student]([StudentID]);
ALTER TABLE [Fact_Performance] ADD CONSTRAINT FK_Lecturer
FOREIGN KEY ([LecturerID]) REFERENCES [dbo].[Dim_Lecturer]([LecturerID]);
ALTER TABLE [Fact_Performance] ADD CONSTRAINT FK_Group
FOREIGN KEY ([GroupID]) REFERENCES [Dim_Group]([GroupID]);
ALTER TABLE [Fact_Performance] ADD CONSTRAINT FK_Subject
FOREIGN KEY ([SubjectID]) REFERENCES [Dim_Subject]([SubjectID]);

SELECT COUNT(*)
FROM dbo.Dim_Group
SELECT COUNT(*)
FROM dbo.Dim_Lecturer
SELECT COUNT(*)
FROM dbo.Dim_Student
SELECT COUNT(*)
FROM dbo.Dim_Subject
SELECT COUNT(*)
FROM dbo.Fact_Performance



DELETE FROM dbo.Fact_Performance;
GO

DELETE FROM dbo.Dim_Student;
GO

DELETE FROM dbo.Dim_Group;
GO  

DELETE FROM dbo.Dim_Subject;
GO

DELETE FROM dbo.Dim_Lecturer;
GO


