USE [Academy];
GO


-- таблица Дисциплины (Subjects)
CREATE TABLE [Subjects]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') UNIQUE
);
GO


-- таблица Преподаватели (Teachers)
CREATE TABLE [Teachers]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(MAX) NOT NULL CHECK([Name] <> N''),
	[Surname] nvarchar(MAX) NOT NULL CHECK([Surname] <> N'')
);
GO


-- таблица Ассистента (Assistants)
CREATE TABLE [Assistants]
(
	[Id] int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId] int NOT NULL,
	CONSTRAINT [FK_Assistants_TeacherId] FOREIGN KEY([TeacherId]) REFERENCES [Teachers]([Id])
);
GO


-- таблица Кураторы (Curators)
CREATE TABLE [Curators]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[TeacherId] int NOT NULL,
	CONSTRAINT [FK_Cur_TeacherId] FOREIGN KEY([TeacherId]) REFERENCES [Teachers]([Id])
);
GO


-- таблица Деканы (Deans)
CREATE TABLE [Deans]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[TeacherId] int NOT NULL,
	CONSTRAINT [FK_Deans_TeacherId] FOREIGN KEY([TeacherId]) REFERENCES [Teachers]([Id])
);
GO


-- таблица Заведующие (Heads)
CREATE TABLE [Heads]
(
	[Id] int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[TeacherId] int NOT NULL,
	CONSTRAINT [FK_Heads_TeacherId] FOREIGN KEY([TeacherId]) REFERENCES [Teachers]([Id])
);
GO


-- таблица Факультеты (Faculties)
CREATE TABLE [Faculties]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Building] int NOT NULL CHECK([Building] BETWEEN 1 AND 5),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') UNIQUE,
	[DeanId] int NOT NULL,
	CONSTRAINT [FK_Facul_DeanId] FOREIGN KEY([DeanId]) REFERENCES [Deans]([Id])
);
GO


-- таблица Кафедры (Departments)
CREATE TABLE [Departments]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Building] int NOT NULL CHECK([Building] BETWEEN 1 AND 5),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') UNIQUE,
	[FacultyId] int NOT NULL,
	[HeadId] int NOT NULL,
	CONSTRAINT [FK_Dep_FacultyId] FOREIGN KEY([FacultyId]) REFERENCES [Faculties]([Id]),
	CONSTRAINT [FK_Dep_HeadId] FOREIGN KEY([HeadId]) REFERENCES [Heads]([Id])
);
GO


-- таблица Группы (Groups)
CREATE TABLE [Groups]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(10) NOT NULL CHECK([Name] <> N'') UNIQUE,
	[Year] int NOT NULL CHECK([Year] BETWEEN 1 AND 5),
	[DepartmentId] int NOT NULL,
	CONSTRAINT [FK_Groups_DepartmentId] FOREIGN KEY([DepartmentId]) REFERENCES [Departments]([Id])
);
GO

-- таблица Аудитории (LectureRooms)
CREATE TABLE [LectureRooms]
(
	[Id] int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[Building] int NOT NULL CHECK ([Building] BETWEEN 1 AND 5),
	[Name] nvarchar(10) NOT NULL CHECK([Name] <> N'') UNIQUE
);
GO


-- таблица Лекции (Lectures)
CREATE TABLE [Lectures]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[SubjectId] int NOT NULL,
	[TeacherId] int NOT NULL,
	CONSTRAINT [FK_Lec_SubjectId] FOREIGN KEY([SubjectId]) REFERENCES [Subjects]([Id]),
	CONSTRAINT [FK_Lec_TeacherId] FOREIGN KEY([TeacherId]) REFERENCES [Teachers]([Id])
);
GO


-- таблица Группы и кураторы (GroupsCurators)
CREATE TABLE [GroupsCurators]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CuratorId] int NOT NULL,
	[GroupId] int NOT NULL,
	CONSTRAINT [FK_GK_CuratorId] FOREIGN KEY([CuratorId]) REFERENCES [Curators]([Id]),
	CONSTRAINT [FK_GK_GroupId] FOREIGN KEY([GroupId]) REFERENCES [Groups]([Id])
);
GO


-- таблица Группы и лекции (GroupsLectures)
CREATE TABLE [GroupsLectures]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GroupId] int NOT NULL,
	[LectureId] int NOT NULL,
	CONSTRAINT [FK_GL_GroupId] FOREIGN KEY([GroupId]) REFERENCES [Groups]([Id]),
	CONSTRAINT [FK_GL_LectureId] FOREIGN KEY([LectureId]) REFERENCES [Lectures]([Id])
);
GO


-- таблица Расписания (Schedules)
CREATE TABLE [Schedules]
(
	[Id] int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[Class] int NOT NULL CHECK([Class] between 1 and 8),
	[DayOfWeek] int NOT NULL CHECK([DayOfWeek] BETWEEN 1 AND 7),
	[Week] int NOT NULL CHECK([Week] BETWEEN 1 AND 52),
	[LectureId] int NOT NULL,
	[LectureRoomId] int NOT NULL,
	CONSTRAINT [FK_Sched_LectureId] FOREIGN KEY([LectureId]) REFERENCES [Lectures]([Id]),
	CONSTRAINT [FK_Sched_LectureRoomId] FOREIGN KEY([LectureRoomId]) REFERENCES [LectureRooms]([Id])
);
GO