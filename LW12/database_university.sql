USE university;

CREATE TABLE faculty
(
    id 				INT AUTO_INCREMENT 	NOT NULL,
	name 			VARCHAR(255)		NOT NULL,
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8mb4
  COLLATE `utf8mb4_unicode_ci`
  ENGINE = InnoDB
;

CREATE TABLE class
(
	id 				INT AUTO_INCREMENT 	NOT NULL,
	name 			VARCHAR(255)		NOT NULL,
    faculty_id		INT                 NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(id),
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8mb4
  COLLATE `utf8mb4_unicode_ci`
  ENGINE = InnoDB
;

CREATE TABLE student
(
	id 				INT AUTO_INCREMENT 	NOT NULL,
    name 			VARCHAR(255)		NOT NULL,
	surname 		VARCHAR(255)		NOT NULL,
    age				INT					NOT NULL,
    class_id		INT,
    FOREIGN KEY (class_id) REFERENCES class(id),
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8mb4
  COLLATE `utf8mb4_unicode_ci`
  ENGINE = InnoDB
;

INSERT INTO faculty (name)
VALUES 
	('ФИиВТ'),
	('РТФ'),
	('ФУП')
;

INSERT INTO class (name, faculty_id)
VALUES 
	('ПС-11', 1),
	('ПС-12', 1),
    ('ПС-13', 1),
    ('ИТиС-11', 2),
    ('ИТиС-12', 2),
    ('ИТиС-13', 2),
    ('УП-11', 3),
    ('УП-12', 3),
    ('УП-13', 3)
;

INSERT INTO student (surname, name, age, class_id)
VALUES
	('Чернядьев', 		'Максим',   	19, 1),
	('Кармазанов', 		'Роман',  	    19, 1),
	('Осокин', 			'Владислав', 	20, 1),
	('Аламбаев', 		'Даниил', 		19, 1),
	('Александров', 	'Дмитрий', 		19, 1),
	('Безносюк', 		'Олег', 		20, 2),
	('Петухов', 		'Дмитрий', 		21, 2),
	('Москвин', 		'Алексей', 		20, 2),
	('Каплунова', 		'Анастасия', 	19, 2),
	('Бусыгин', 		'Алексей', 		19, 2),
	('Иванов', 			'Дмитрий', 		19, 3),
	('Попов', 			'Михаил', 		20, 3),
	('Данилов',			'Павел', 		19, 3),
	('Колдырев', 		'Даниил', 		19, 3),
	('Смирнов', 		'Роман', 		21, 3),
	('Подоплелов', 		'Дмитрий', 		19, 4),
	('Иванов', 			'Артем', 		19, 4),
	('Клочко', 			'Александр', 	20, 4),
	('Белов', 			'Никита', 		19, 4),
	('Игнатьев', 		'Владислав', 	19, 4),
	('Крюков', 			'Дмитрий', 		22, 5),
	('Пащенко', 		'Дарья', 		19, 5),
	('Волков', 			'Семен', 		18, 5),
	('Горник', 			'Мария', 		19, 5),
	('Романова', 		'Анна', 		20, 5),
	('Мыза', 			'Артём', 		19, 6),
	('Чухланцев', 		'Павел', 		19, 6),
	('Михайлов', 		'Александр', 	19, 6),
	('Комиссарова', 	'Арина', 		19, 6),
	('Видякин', 		'Егор', 		22, 6),
	('Таныгин',			'Вадим', 		19, 7),
	('Васильева', 		'Ольга', 		19, 7),
	('Петухов', 		'Фёдор', 		18, 7),
	('Яковлев', 		'Кирилл', 		25, 7),
	('Петров', 			'Михаил', 		18, 7),
	('Платонова', 		'Дарья', 		19, 8),
	('Пирогова', 		'Светлана', 	20, 8),
	('Петухов', 		'Максим', 		19, 8),
	('Ильдюков', 		'Дмитрий', 		20, 8),
	('Ткаченко', 		'Святослав',	19, 8),
	('Кашин', 			'Владислав', 	19, 9),
	('Кузнецов', 		'Вадим', 		20, 9),
	('Данилов', 		'Владимир', 	19, 9),
	('Журавлёва', 		'Татьяна',		19, 9),
	('Арсибеков', 		'Артем', 		18, 9)
;

SELECT /*Для получения всех студентов в возрасте 19 лет*/
	student.surname AS Фамилия,
    student.name AS Имя,
    student.age AS Возраст,
    class.name AS Группа
FROM 
	student
    INNER JOIN class ON student.class_id = class.id
WHERE
	student.age = 19;
    
SELECT  /*Для получения всех студентов из конкретной группы.*/
	student.surname AS Фамилия,
    student.name AS Имя,
    class.name AS Группа
FROM 
	student
    INNER JOIN class ON student.class_id = class.id
WHERE
	class.name = 'ПС-13';
    
SELECT  /*Для получения всех студентов из конкретного факультета*/
	student.surname AS Фамилия,
    student.name AS Имя,
    faculty.name AS Факультет
FROM 
	student
    INNER JOIN class ON student.class_id = class.id
    INNER JOIN faculty ON faculty.id = class.faculty_id
WHERE
	faculty.name = 'ФИиВТ';
    
SELECT  /*Для получения факультета и группы конкретного студента*/
	student.id,
	student.surname AS Фамилия,
    student.name AS Имя,
    class.name AS Группа,
    faculty.name AS Факультет
FROM 
	student
    INNER JOIN class ON student.class_id = class.id
    INNER JOIN faculty ON faculty.id = class.faculty_id
WHERE
	student.surname = 'Романова' AND student.name = 'Анна';
