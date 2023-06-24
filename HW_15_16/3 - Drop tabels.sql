USE [Academy];
GO


-- ������� ���������� (Schedules)
ALTER TABLE [Schedules] DROP CONSTRAINT [FK_Sched_LectureId];
GO
ALTER TABLE [Schedules] DROP CONSTRAINT [FK_Sched_LectureRoomId];
GO
DROP TABLE [Schedules];
GO


-- ������� ������ � ������ (GroupsLectures)
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_GroupId];
GO
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_LectureId];
GO
DROP TABLE [GroupsLectures];
GO


-- ������� ������ � �������� (GroupsCurators)
ALTER TABLE [GroupsCurators] DROP CONSTRAINT [FK_GK_CuratorId];
GO
ALTER TABLE [GroupsCurators] DROP CONSTRAINT [FK_GK_GroupId];
GO
DROP TABLE [GroupsCurators];
GO


-- ������� ������ (Lectures)
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_SubjectId];
GO
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_TeacherId];
GO
DROP TABLE [Lectures];
GO


-- ������� ������ (Groups)
ALTER TABLE [Groups] DROP CONSTRAINT [FK_Groups_DepartmentId];
GO
DROP TABLE [Groups];
GO


-- ������� ������� (Departments)
ALTER TABLE [Departments] DROP CONSTRAINT [FK_Dep_FacultyId];
GO
ALTER TABLE [Departments] DROP CONSTRAINT [FK_Dep_HeadId];
GO
DROP TABLE [Departments];
GO


-- ������� ���������� (Faculties)
ALTER TABLE [Faculties] DROP CONSTRAINT [FK_Facul_DeanId];
GO 
DROP TABLE [Faculties];
GO


-- ������� ���������� (Heads)
ALTER TABLE [Heads] DROP CONSTRAINT [FK_Heads_TeacherId];
GO
DROP TABLE [Heads];
GO


-- ������������� (Deans)
ALTER TABLE [Deans] DROP CONSTRAINT [FK_Deans_TeacherId];
GO
DROP TABLE [Deans];
GO


-- ������� �������� (Curators)
ALTER TABLE [Curators] DROP CONSTRAINT [FK_Cur_TeacherId];
GO
DROP TABLE [Curators];
GO


-- ������� ���������� (Assistants)
ALTER TABLE [Assistants] DROP CONSTRAINT [FK_Assistants_TeacherId];
GO
DROP TABLE [Assistants];
GO


-- ������� ��������� (LectureRooms)
DROP TABLE [LectureRooms];
GO


-- ������� ���������� (Teachers)
DROP TABLE [Teachers];
GO


-- ������� ���������� (Subjects)
DROP TABLE [Subjects];
GO