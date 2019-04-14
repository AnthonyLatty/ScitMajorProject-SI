
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/13/2019 23:24:37
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

IF OBJECT_ID(N'[dbo].[FK_LecturerMemo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Memos] DROP CONSTRAINT [FK_LecturerMemo];
GO
IF OBJECT_ID(N'[dbo].[FK_LibarianDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_LibarianDocument];
GO
IF OBJECT_ID(N'[dbo].[FK_CoordinatorSyllabus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Syllabus] DROP CONSTRAINT [FK_CoordinatorSyllabus];
GO
IF OBJECT_ID(N'[dbo].[FK_SyllabusMarkScheme]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Syllabus] DROP CONSTRAINT [FK_SyllabusMarkScheme];
GO
IF OBJECT_ID(N'[dbo].[FK_Group_Lecturers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Group_Lecturers];
GO
IF OBJECT_ID(N'[dbo].[FK_Group_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Group_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_Group_Students]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Group_Students];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Students];
GO
IF OBJECT_ID(N'[dbo].[Lecturers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lecturers];
GO
IF OBJECT_ID(N'[dbo].[Libarians]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Libarians];
GO
IF OBJECT_ID(N'[dbo].[Documents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents];
GO
IF OBJECT_ID(N'[dbo].[Memos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Memos];
GO
IF OBJECT_ID(N'[dbo].[Coordinators]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Coordinators];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Syllabus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Syllabus];
GO
IF OBJECT_ID(N'[dbo].[MarkSchemes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MarkSchemes];
GO
IF OBJECT_ID(N'[dbo].[Groups]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Groups];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Address] nvarchar(150)  NOT NULL,
    [Faculty] nvarchar(50)  NOT NULL
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
    [CoordinatorId] int IDENTITY(1,1) NOT NULL,
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
    [FilePath] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Syllabus'
CREATE TABLE [dbo].[Syllabus] (
    [SyllabusId] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(20)  NOT NULL,
    [FilePath] nvarchar(max)  NOT NULL,
    [CoordinatorCoordinatorId] int  NOT NULL,
    [MarkScheme_MarkSchemeId] int  NOT NULL
);
GO

-- Creating table 'MarkSchemes'
CREATE TABLE [dbo].[MarkSchemes] (
    [MarkSchemeId] int IDENTITY(1,1) NOT NULL,
    [FilePath] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Groups'
CREATE TABLE [dbo].[Groups] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [GroupName] int  NOT NULL,
    [StudentId] int  NOT NULL,
    [LecturerId] int  NOT NULL,
    [ProjectId] int  NOT NULL
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

-- Creating primary key on [Id] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [PK_Groups]
    PRIMARY KEY CLUSTERED ([Id] ASC);
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

-- Creating foreign key on [LecturerId] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [FK_Group_Lecturers]
    FOREIGN KEY ([LecturerId])
    REFERENCES [dbo].[Lecturers]
        ([LecturerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Group_Lecturers'
CREATE INDEX [IX_FK_Group_Lecturers]
ON [dbo].[Groups]
    ([LecturerId]);
GO

-- Creating foreign key on [ProjectId] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [FK_Group_Projects]
    FOREIGN KEY ([ProjectId])
    REFERENCES [dbo].[Projects]
        ([ProjectId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Group_Projects'
CREATE INDEX [IX_FK_Group_Projects]
ON [dbo].[Groups]
    ([ProjectId]);
GO

-- Creating foreign key on [StudentId] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [FK_Group_Students]
    FOREIGN KEY ([StudentId])
    REFERENCES [dbo].[Students]
        ([StudentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Group_Students'
CREATE INDEX [IX_FK_Group_Students]
ON [dbo].[Groups]
    ([StudentId]);
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