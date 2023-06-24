USE Academy;
GO

-- 1. ¬ывести названи€ аудиторий, в которых читает лекции преподаватель УEdward HopperФ.
DROP VIEW IF EXISTS vLectureRoomsByTeacher;
GO

CREATE VIEW vLectureRoomsByTeacher 
AS
SELECT LectureRooms.Name
FROM LectureRooms
JOIN Schedules ON LectureRooms.Id = Schedules.LectureRoomId
JOIN Lectures ON Schedules.LectureId = Lectures.Id
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
WHERE Teachers.Name = 'Edward' AND Teachers.Surname = 'Hopper';
GO

-- 2. ¬ывести фамилии ассистентов, читающих лекции в группе УF505Ф.
DROP VIEW IF EXISTS vAssistantsByGroup;
GO

CREATE VIEW vAssistantsByGroup 
AS
SELECT Teachers.Surname
FROM Assistants
JOIN Teachers ON Assistants.TeacherId = Teachers.Id
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.GroupId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Groups.Name = 'F505';
GO

-- 3. ¬ывести дисциплины, которые читает преподаватель УAlex CarmackФ дл€ групп 5-го курса.
DROP VIEW IF EXISTS vSubjectsByTeacher;
GO

CREATE VIEW vSubjectsByTeacher
AS
SELECT Subjects.Name
FROM Subjects
JOIN Lectures ON Subjects.Id = Lectures.SubjectId
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE (Teachers.Name = 'Alex' AND Teachers.Surname = 'Carmack') AND Groups.Year = 5;
GO

-- 4. ¬ывести фамилии преподавателей, которые не читают лекции по понедельникам.
DROP VIEW IF EXISTS vNoMondayLectures;
GO

CREATE VIEW vNoMondayLectures
AS
SELECT DISTINCT Teachers.Surname, Schedules.DayOfWeek
FROM Teachers
LEFT JOIN Lectures ON Teachers.Id = Lectures.TeacherId
LEFT JOIN Schedules ON Lectures.Id = Schedules.LectureId
WHERE Schedules.DayOfWeek <> 1 OR Schedules.DayOfWeek IS NULL;
-- WHERE Schedules.DayOfWeek = 1;		-- Emmerich, Hopper
GO

-- 5. ¬ывести названи€ аудиторий, с указанием их корпусов, 
-- в которых нет лекций в среду второй недели на третьей паре.
DROP VIEW IF EXISTS vNoWednesdayLectures;
GO

CREATE VIEW vNoWednesdayLectures
AS
SELECT LectureRooms.Name, LectureRooms.Building
FROM LectureRooms
WHERE LectureRooms.Id NOT IN (
    SELECT S.LectureRoomId
    FROM Schedules AS S
    WHERE S.DayOfWeek = 3 AND S.Week = 2 AND S.Class = 3		-- 8 = A104 - 5
);
GO

-- 6. ¬ывести полные имена преподавателей факультета УComputer ScienceФ, 
-- которые не курируют группы кафедры УSoftware DevelopmentФ.
DROP VIEW IF EXISTS vNoCuratedGroups;
GO

CREATE VIEW vNoCuratedGroups
AS
SELECT Teachers.Id, Teachers.Name + ' ' + Teachers.Surname AS FullNameTeacher
FROM [Teachers]
WHERE [Teachers].[Id] NOT IN (
    SELECT [TeacherId]
    FROM [Curators]
    INNER JOIN [GroupsCurators] ON [Curators].[Id] = [GroupsCurators].[CuratorId]
    INNER JOIN [Groups] ON [GroupsCurators].[GroupId] = [Groups].[Id]
    INNER JOIN [Departments] ON [Groups].[DepartmentId] = [Departments].[Id]
    INNER JOIN [Faculties] ON [Departments].[FacultyId] = [Faculties].[Id]
    WHERE [Faculties].[Name] = 'Computer Science' AND [Departments].[Name] = 'Software Development'
	-- (13) Alexandrine Towne; (15) Dustin Klein; (16) Gerda Frami
);
GO

-- 7. ¬ывести список номеров всех корпусов, которые имеютс€ в таблицах факультетов, кафедр и аудиторий.
DROP VIEW IF EXISTS vAllBuildings;
GO

CREATE VIEW vAllBuildings 
AS
SELECT Building
FROM (
    SELECT Building FROM Faculties
    UNION
    SELECT DISTINCT Building FROM Departments
    UNION
    SELECT DISTINCT Building FROM LectureRooms
) AS AllBuildings;
GO

-- 8. ¬ывести полные имена преподавателей в следующем пор€дке: 
-- деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты.
DROP VIEW IF EXISTS vTeachersByPosition;
GO

CREATE VIEW vTeachersByPosition
AS
SELECT Id, [Name] + ' ' + Surname AS FullName, 'Deans' AS TeacherPosition
FROM Teachers
WHERE Id IN (SELECT TeacherId FROM Deans)
UNION ALL
SELECT Teachers.Id, [Name] + ' ' + Surname AS FullName, 'Heads' AS TeacherPosition
FROM Teachers
WHERE [Id] IN (SELECT TeacherId FROM Heads)
UNION ALL
SELECT Teachers.Id, [Name] + ' ' + Surname AS FullName, 'Teachers' AS TeacherPosition
FROM Teachers
LEFT JOIN Deans ON Deans.TeacherId = Teachers.Id
LEFT JOIN Heads ON Heads.TeacherId = Teachers.Id
LEFT JOIN Curators ON Curators.TeacherId = Teachers.Id
LEFT JOIN Assistants ON Assistants.TeacherId = Teachers.Id
WHERE Deans.TeacherId IS NULL AND Heads.TeacherId IS NULL AND Curators.TeacherId IS NULL AND Assistants.TeacherId IS NULL
UNION ALL
SELECT Teachers.Id, [Name] + ' ' + Surname AS FullName, 'Curators' AS TeacherPosition
FROM Teachers
WHERE Id IN (SELECT TeacherId FROM Curators)
UNION ALL
SELECT Teachers.Id, [Name] + ' ' + Surname AS FullName, 'Assistants' AS TeacherPosition
FROM Teachers
WHERE Id IN(SELECT TeacherId FROM Assistants);
GO

-- 9. ¬ывести дни недели (без повторений), 
-- в которые имеютс€ зан€ти€ в аудитори€х УA311Ф и УA104Ф корпуса 5.
DROP VIEW IF EXISTS vDayOfWeekLectures;
GO

CREATE VIEW vDayOfWeekLectures 
AS
SELECT DISTINCT Schedules.DayOfWeek
FROM Schedules
JOIN LectureRooms ON LectureRooms.Id = Schedules.LectureRoomId
WHERE LectureRooms.Name IN ('A311', 'A104') AND LectureRooms.Building = 5;
GO