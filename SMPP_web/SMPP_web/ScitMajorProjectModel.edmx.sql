
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/13/2019 15:57:01
-- Generated from EDMX file: C:\ScitMajorProject-SI\SMPP_web\SMPP_web\ScitMajorProjectModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SMP_Portal_web];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_Group_Lecturers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Group] DROP CONSTRAINT [FK_Group_Lecturers];
GO
IF OBJECT_ID(N'[dbo].[FK_Group_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Group] DROP CONSTRAINT [FK_Group_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_Group_Students]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Group] DROP CONSTRAINT [FK_Group_Students];
GO
IF OBJECT_ID(N'[dbo].[FK_LecturerMemo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Memos] DROP CONSTRAINT [FK_LecturerMemo];
GO
IF OBJECT_ID(N'[dbo].[FK_LibarianDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_LibarianDocument];
GO
IF OBJECT_ID(N'[dbo].[FK_SyllabusMarkScheme]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Syllabus] DROP CONSTRAINT [FK_SyllabusMarkScheme];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Documents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents];
GO
IF OBJECT_ID(N'[dbo].[Group]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Group];
GO
IF OBJECT_ID(N'[dbo].[Lecturers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lecturers];
GO
IF OBJECT_ID(N'[dbo].[Libarians]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Libarians];
GO
IF OBJECT_ID(N'[dbo].[MarkSchemes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MarkSchemes];
GO
IF OBJECT_ID(N'[dbo].[Memos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Memos];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Students];
GO
IF OBJECT_ID(N'[dbo].[Syllabus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Syllabus];
GO
IF OBJECT_ID(N'[ScitMajorProjectModelStoreContainer].[Coordinators]', 'U') IS NOT NULL
    DROP TABLE [ScitMajorProjectModelStoreContainer].[Coordinators];
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
    [FilePath] nvarchar(max)  NOT NULL
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

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
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

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
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

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [PK_Groups]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
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

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
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

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------