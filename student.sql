
CREATE TABLE [dbo].[Student] (
    [StudentID] INT IDENTITY(1,1) PRIMARY KEY,
    [LastName] NVARCHAR(50) NOT NULL,
    [FirstName] NVARCHAR(50) NOT NULL,
    [MiddleName] NVARCHAR(50),
    [StudentCardNumber] NVARCHAR(20) NOT NULL UNIQUE,
    [BirthYear] INT NOT NULL,
    [BirthPlace] NVARCHAR(100) NOT NULL,
    [Address] NVARCHAR(200),
    [Gender] CHAR(1) NOT NULL CHECK ([Gender] IN ('M', 'F')),
   
);
GO

CREATE TABLE [dbo].[Group] (
    [GroupID] INT IDENTITY(1,1) PRIMARY KEY,
    [GroupName] NVARCHAR(50) NOT NULL UNIQUE,
    [Course] INT NOT NULL CHECK ([Course] BETWEEN 1 AND 6),
    [LeaderStudentID] INT NULL FOREIGN KEY REFERENCES [Student]([StudentID])
);
GO

CREATE TABLE [dbo].[Lecturer] (
    [LecturerID] INT IDENTITY(1,1) PRIMARY KEY,
    [LastName] NVARCHAR(50) NOT NULL,
    [FirstName] NVARCHAR(50) NOT NULL,
    [MiddleName] NVARCHAR(50)
);
GO

CREATE TABLE [dbo].[Subject] (
    [SubjectID] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL UNIQUE,
    [Coefficient] INT NOT NULL CHECK ([Coefficient] > 0)
);
GO

CREATE TABLE [dbo].[Performance] (
    [PerformanceID] INT IDENTITY(1,1) PRIMARY KEY,
    [StudentID] INT NOT NULL FOREIGN KEY REFERENCES [Student]([StudentID]),
    [GroupID] INT NOT NULL FOREIGN KEY REFERENCES [Group]([GroupID]),
    [LecturerID] INT NOT NULL FOREIGN KEY REFERENCES [Lecturer]([LecturerID]),
    [SubjectID] INT NOT NULL FOREIGN KEY REFERENCES [Subject]([SubjectID]),
    [Semester] TINYINT NOT NULL CHECK ([Semester] IN (1, 2)),
    [Year] INT NOT NULL,
     [Scholarship] DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    [Score] INT NOT NULL 
);

SELECT COUNT(*)
FROM dbo.[Group]

SELECT COUNT(*)
FROM dbo.Lecturer

SELECT COUNT(*)
FROM dbo.Student
SELECT COUNT(*)
FROM dbo.Subject
SELECT COUNT(*)
FROM dbo.Performance

SELECT * FROM dbo.[Group]
SELECT * FROM dbo.Lecturer
SELECT * FROM dbo.Performance
SELECT * FROM dbo.Student
SELECT * FROM dbo.Subject



