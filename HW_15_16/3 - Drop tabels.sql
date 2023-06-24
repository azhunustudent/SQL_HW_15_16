USE [Academy];
GO


-- таблица Расписания (Schedules)
ALTER TABLE [Schedules] DROP CONSTRAINT [FK_Sched_LectureId];
GO
ALTER TABLE [Schedules] DROP CONSTRAINT [FK_Sched_LectureRoomId];
GO
DROP TABLE [Schedules];
GO


-- таблица Группы и лекции (GroupsLectures)
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_GroupId];
GO
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_LectureId];
GO
DROP TABLE [GroupsLectures];
GO


-- таблица Группы и кураторы (GroupsCurators)
ALTER TABLE [GroupsCurators] DROP CONSTRAINT [FK_GK_CuratorId];
GO
ALTER TABLE [GroupsCurators] DROP CONSTRAINT [FK_GK_GroupId];
GO
DROP TABLE [GroupsCurators];
GO


-- таблица Лекции (Lectures)
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_SubjectId];
GO
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_TeacherId];
GO
DROP TABLE [Lectures];
GO


-- таблица Группы (Groups)
ALTER TABLE [Groups] DROP CONSTRAINT [FK_Groups_DepartmentId];
GO
DROP TABLE [Groups];
GO


-- таблица Кафедры (Departments)
ALTER TABLE [Departments] DROP CONSTRAINT [FK_Dep_FacultyId];
GO
ALTER TABLE [Departments] DROP CONSTRAINT [FK_Dep_HeadId];
GO
DROP TABLE [Departments];
GO


-- таблица Факультеты (Faculties)
ALTER TABLE [Faculties] DROP CONSTRAINT [FK_Facul_DeanId];
GO 
DROP TABLE [Faculties];
GO


-- таблица Заведующие (Heads)
ALTER TABLE [Heads] DROP CONSTRAINT [FK_Heads_TeacherId];
GO
DROP TABLE [Heads];
GO


-- таблицаДеканы (Deans)
ALTER TABLE [Deans] DROP CONSTRAINT [FK_Deans_TeacherId];
GO
DROP TABLE [Deans];
GO


-- таблица Кураторы (Curators)
ALTER TABLE [Curators] DROP CONSTRAINT [FK_Cur_TeacherId];
GO
DROP TABLE [Curators];
GO


-- таблица Ассистента (Assistants)
ALTER TABLE [Assistants] DROP CONSTRAINT [FK_Assistants_TeacherId];
GO
DROP TABLE [Assistants];
GO


-- таблица Аудитории (LectureRooms)
DROP TABLE [LectureRooms];
GO


-- таблица Дисциплины (Teachers)
DROP TABLE [Teachers];
GO


-- таблица Дисциплины (Subjects)
DROP TABLE [Subjects];
GO