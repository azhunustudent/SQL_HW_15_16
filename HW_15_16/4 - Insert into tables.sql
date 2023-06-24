USE [Academy];
GO


-- таблица Дисциплины (Subjects)
INSERT INTO [Subjects] ([Name])
VALUES ('Frontend Development'),
	   ('Backend Development'),
	   ('Android App Development'),
	   ('iOS App Development'),
	   ('Machine Learning'),
	   ('Database Theory'),
	   ('Branding and Identity Design'),
	   ('2D Animation'),
	   ('3D Animation'),
	   ('UI/UX Design'),
	   ('Computer Networks'),
	   ('Server Management'),
	   ('Virtualization and Cloud Services'),
	   ('Cryptography and Information Protection'),
	   ('Programming Languages'),
	   ('Object-Oriented Programming');
GO


-- таблица Преподаватели (Teachers)
INSERT INTO [Teachers] ([Surname], [Name])
VALUES ('Hopper', 'Edward'),
	   ('Goldner', 'Lurline'),
	   ('Carmack', 'Alex'),
	   ('Hahn', 'Jamie'),
	   ('Rice', 'Frida'),
	   ('Underhill', 'Jack'),
	   ('McQueen', 'Dave'),
	   ('Adams', 'Doris'),
	   ('Schuster', 'Ricardo'),
	   ('Predovic', 'Bessie'),
	   ('Medhurst', 'Sonia'),
	   ('Emmerich', 'Carmen'),
	   ('Towne', 'Alexandrine'),
	   ('Glover', 'Agustina'),
	   ('Klein', 'Dustin'),
	   ('Frami', 'Gerda'),
	   ('Eichmann', 'Carroll'),
	   ('Zieme', 'Nichole'),
	   ('Schneider', 'Imelda'),
	   ('Bosco', 'Justyn'),
	   ('Schinner', 'Hazle'),
	   ('Wintheiser', 'Yesenia'),
	   ('Purdy', 'Bridgette'),
	   ('Bogan', 'Kennedy'),
	   ('Roberts', 'Jackson'),
	   ('Braun', 'Hassan'),
	   ('Boyle', 'Libbie'),
	   ('Stanton', 'Kaley'),
	   ('Ryan', 'Madonna'),
	   ('Zboncak', 'Meta'),
	   ('Kiehn', 'Jerrod'),
	   ('McLaughlin', 'Lea'),
	   ('Monahan', 'Jacynthe'),
	   ('Lakin', 'Ulises'),
	   ('Davis', 'Judah'),
	   ('Skiles', 'Ezequiel'),
	   ('Schuppe', 'Brett'),
	   ('Treutel', 'Albert'),
	   ('Medhurst', 'Clay'),
	   ('Kozey', 'Margarita'),
	   ('Bailey', 'Jan'),
	   ('Huels', 'Joseph'),
	   ('Hilll', 'Laurence'),
	   ('Wisoky', 'Sienna'),
	   ('McCullough', 'Bertha'),
	   ('Metz', 'Cristopher'),
	   ('Kris', 'Ford'),
	   ('Prohaska', 'Corine'),
	   ('Feeney', 'Karolann'),
	   ('Stehr', 'Winona');
GO


-- таблица Ассистента (Assistants)
INSERT INTO [Assistants] ([TeacherId])
VALUES (1),
	   (2),
	   (3),
	   (4),
	   (5),
	   (6),
	   (7),
	   (8),
	   (9),
	   (10);
GO


-- таблица Кураторы (Curators)
INSERT INTO [Curators] ([TeacherId])
VALUES (11),
	   (12),
	   (13),
	   (14),
	   (15),
	   (16),
	   (17),
	   (18),
	   (19),
	   (20);
GO


-- таблица Деканы (Deans)
INSERT INTO [Deans] ([TeacherId])
VALUES (21),
	   (22),
	   (23),
	   (24),
	   (25),
	   (26),
	   (27),
	   (28),
	   (29),
	   (30);
GO


-- таблица Заведующие (Heads)
INSERT INTO [Heads] ([TeacherId])
VALUES (31),
	   (32),
	   (33),
	   (34),
	   (35),
	   (36),
	   (37),
	   (38),
	   (39),
	   (40);
GO


-- таблица Факультеты (Faculties)
INSERT INTO [Faculties] ([Building], [Name], [DeanId])
VALUES (1, 'Computer Science', 1),
	   (2, 'Design', 5),
	   (4, 'System Administration', 10);
GO


-- таблица Кафедры (Departments)
INSERT INTO [Departments] ([Building], [Name], [HeadId], [FacultyId])
VALUES (1, 'Web Development', 1, 1),
	   (2, 'Mobile Development', 3, 1),
	   (3, 'Algorithms and Data Structures', 7, 1),
	   (4, 'Graphic Design', 2, 2),
	   (5, 'Animation', 6, 2),
	   (1, 'Web Design', 7, 2),
	   (3, 'System Services', 10, 3),
	   (2, 'Network Technologies', 8, 3),
	   (4, 'Information Security', 9, 3),
	   (5, 'Software Development', 4, 1);
GO


-- таблица Группы (Groups)
INSERT INTO [Groups] ([Name], [Year],[DepartmentId]) 
VALUES ('F505', 1, 1),
	   ('P313', 3, 2),
	   ('P205', 2, 10),
	   ('P147', 1, 3),
	   ('P533', 5, 10),
	   ('P512', 5, 10),
	   ('D531', 5, 5),
	   ('D221', 1, 4),
	   ('D404', 4, 6),
	   ('S518', 5, 9),
	   ('S328', 3, 8),
	   ('S422', 4, 7);
GO


-- таблица Аудитории (LectureRooms)
INSERT INTO [LectureRooms] ([Building], [Name]) 
VALUES (3, 'C101'),
	   (1, 'A102'),
	   (4, 'B209'),
	   (2, 'D210'),
	   (1, 'B307'),
	   (5, 'A311'),
	   (4, 'B408'),
	   (5, 'A104'),
	   (3, 'C512'),
	   (2, 'D502');
GO


-- таблица Лекции (Lectures)
INSERT INTO [Lectures] ([SubjectId], [TeacherId])
VALUES (1, 1),
	   (2, 12),
	   (3, 32),
	   (4, 30),
	   (5, 21),
	   (6, 3),
	   (7, 25),
	   (8, 16),
	   (9, 14),
	   (11, 7),
	   (12, 6),
	   (13, 22),
	   (14, 22);
GO


-- таблица Группы и кураторы (GroupsCurators)
INSERT INTO [GroupsCurators] ([CuratorId], [GroupId])
VALUES (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (7, 7),
	   (8, 8),
	   (9, 9),
	   (10, 10);
GO


-- таблица Группы и лекции (GroupsLectures)
INSERT INTO [GroupsLectures] ([GroupId], [LectureId])
VALUES (1, 1),
       (2, 3),
       (3, 2),
       (4, 4),
       (5, 6),
       (10, 7);
GO


-- таблица Расписания (Schedules)
INSERT INTO [Schedules] ([Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId])
VALUES (1, 1, 5, 1, 3),
	   (2, 4, 7, 3, 6),
	   (3, 2, 12, 4, 1),
	   (4, 1, 8, 2, 2),
	   (5, 1, 41, 2, 4),
	   (1, 2, 17, 3, 6),
	   (2, 5, 25, 5, 4),
	   (3, 3, 2, 7, 8),
	   (4, 5, 33, 10, 10),
	   (5, 2, 31, 11, 2);
GO