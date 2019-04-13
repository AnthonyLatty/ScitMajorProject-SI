
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/13/2019 12:30:34
-- Generated from EDMX file: C:\Users\mlatt\Desktop\ScitMajorProject-SI\SMPP_web\SMPP_web\ScitMajorProjectModel.edmx
-- --------------------------------------------------

CREATE DATABASE SMP_Portal_web
SET QUOTED_IDENTIFIER OFF;
GO
USE [SMP_Portal_web];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentId] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Address] nvarchar(150)  NOT NULL,
    [Faculty] nvarchar(50)  NOT NULL,
    [IDNumber] nvarchar(7)  NOT NULL,
    [LecturerLecturerId] int  NOT NULL,
    [Project_ProjectId] int  NOT NULL
);
GO

-- Creating table 'Lecturers'
CREATE TABLE [dbo].[Lecturers] (
    [LecturerId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Faculty] nvarchar(20)  NOT NULL,
    [OfficeExtension] nvarchar(5)  NOT NULL
);
GO

-- Creating table 'Libarians'
CREATE TABLE [dbo].[Libarians] (
    [LibarianId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Documents'
CREATE TABLE [dbo].[Documents] (
    [DocumentId] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(20)  NOT NULL,
    [Date] datetime  NOT NULL,
    [FilePath] nvarchar(max)  NOT NULL,
    [LibarianLibarianId] int  NOT NULL
);
GO

-- Creating table 'Memos'
CREATE TABLE [dbo].[Memos] (
    [MemoId] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Description] nvarchar(150)  NOT NULL,
    [LecturerLecturerId] int  NOT NULL
);
GO

-- Creating table 'Coordinators'
CREATE TABLE [dbo].[Coordinators] (
    [CoordinatorId] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [ProjectId] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(20)  NOT NULL,
    [Topic] nvarchar(20)  NOT NULL,
    [AcademicYear] nvarchar(20)  NOT NULL,
    [FilePath] nvarchar(max)  NOT NULL,
    [LecturerLecturerId] int  NOT NULL
);
GO

-- Creating table 'Syllabus'
CREATE TABLE [dbo].[Syllabus] (
    [SyllabusId] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(20)  NOT NULL,
    [FilePath] nvarchar(max)  NOT NULL,
    [CoordinatorCoordinatorId] nvarchar(max)  NOT NULL,
    [MarkScheme_MarkSchemeId] int  NOT NULL
);
GO

-- Creating table 'MarkSchemes'
CREATE TABLE [dbo].[MarkSchemes] (
    [MarkSchemeId] int IDENTITY(1,1) NOT NULL,
    [FilePath] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StudentId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentId] ASC);
GO

-- Creating primary key on [LecturerId] in table 'Lecturers'
ALTER TABLE [dbo].[Lecturers]
ADD CONSTRAINT [PK_Lecturers]
    PRIMARY KEY CLUSTERED ([LecturerId] ASC);
GO

-- Creating primary key on [LibarianId] in table 'Libarians'
ALTER TABLE [dbo].[Libarians]
ADD CONSTRAINT [PK_Libarians]
    PRIMARY KEY CLUSTERED ([LibarianId] ASC);
GO

-- Creating primary key on [DocumentId] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [PK_Documents]
    PRIMARY KEY CLUSTERED ([DocumentId] ASC);
GO

-- Creating primary key on [MemoId] in table 'Memos'
ALTER TABLE [dbo].[Memos]
ADD CONSTRAINT [PK_Memos]
    PRIMARY KEY CLUSTERED ([MemoId] ASC);
GO

-- Creating primary key on [CoordinatorId] in table 'Coordinators'
ALTER TABLE [dbo].[Coordinators]
ADD CONSTRAINT [PK_Coordinators]
    PRIMARY KEY CLUSTERED ([CoordinatorId] ASC);
GO

-- Creating primary key on [ProjectId] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([ProjectId] ASC);
GO

-- Creating primary key on [SyllabusId] in table 'Syllabus'
ALTER TABLE [dbo].[Syllabus]
ADD CONSTRAINT [PK_Syllabus]
    PRIMARY KEY CLUSTERED ([SyllabusId] ASC);
GO

-- Creating primary key on [MarkSchemeId] in table 'MarkSchemes'
ALTER TABLE [dbo].[MarkSchemes]
ADD CONSTRAINT [PK_MarkSchemes]
    PRIMARY KEY CLUSTERED ([MarkSchemeId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LecturerLecturerId] in table 'Memos'
ALTER TABLE [dbo].[Memos]
ADD CONSTRAINT [FK_LecturerMemo]
    FOREIGN KEY ([LecturerLecturerId])
    REFERENCES [dbo].[Lecturers]
        ([LecturerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LecturerMemo'
CREATE INDEX [IX_FK_LecturerMemo]
ON [dbo].[Memos]
    ([LecturerLecturerId]);
GO

-- Creating foreign key on [LecturerLecturerId] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_LecturerProject]
    FOREIGN KEY ([LecturerLecturerId])
    REFERENCES [dbo].[Lecturers]
        ([LecturerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LecturerProject'
CREATE INDEX [IX_FK_LecturerProject]
ON [dbo].[Projects]
    ([LecturerLecturerId]);
GO

-- Creating foreign key on [LibarianLibarianId] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_LibarianDocument]
    FOREIGN KEY ([LibarianLibarianId])
    REFERENCES [dbo].[Libarians]
        ([LibarianId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LibarianDocument'
CREATE INDEX [IX_FK_LibarianDocument]
ON [dbo].[Documents]
    ([LibarianLibarianId]);
GO

-- Creating foreign key on [LecturerLecturerId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_LecturerStudent]
    FOREIGN KEY ([LecturerLecturerId])
    REFERENCES [dbo].[Lecturers]
        ([LecturerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LecturerStudent'
CREATE INDEX [IX_FK_LecturerStudent]
ON [dbo].[Students]
    ([LecturerLecturerId]);
GO

-- Creating foreign key on [Project_ProjectId] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_StudentProject]
    FOREIGN KEY ([Project_ProjectId])
    REFERENCES [dbo].[Projects]
        ([ProjectId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentProject'
CREATE INDEX [IX_FK_StudentProject]
ON [dbo].[Students]
    ([Project_ProjectId]);
GO

-- Creating foreign key on [CoordinatorCoordinatorId] in table 'Syllabus'
ALTER TABLE [dbo].[Syllabus]
ADD CONSTRAINT [FK_CoordinatorSyllabus]
    FOREIGN KEY ([CoordinatorCoordinatorId])
    REFERENCES [dbo].[Coordinators]
        ([CoordinatorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CoordinatorSyllabus'
CREATE INDEX [IX_FK_CoordinatorSyllabus]
ON [dbo].[Syllabus]
    ([CoordinatorCoordinatorId]);
GO

-- Creating foreign key on [MarkScheme_MarkSchemeId] in table 'Syllabus'
ALTER TABLE [dbo].[Syllabus]
ADD CONSTRAINT [FK_SyllabusMarkScheme]
    FOREIGN KEY ([MarkScheme_MarkSchemeId])
    REFERENCES [dbo].[MarkSchemes]
        ([MarkSchemeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SyllabusMarkScheme'
CREATE INDEX [IX_FK_SyllabusMarkScheme]
ON [dbo].[Syllabus]
    ([MarkScheme_MarkSchemeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------