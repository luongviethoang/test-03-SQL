﻿CREATE DATABASE task03
GO
USE task03
GO
CREATE TABLE STUDENT
(
	student_id INT IDENTITY PRIMARY KEY
	,student_name NVARCHAR(255)
	,age INT
	,address NVARCHAR(255)
	,status INT
)
GO

CREATE TABLE CLASSROOM
(
	class_id INT IDENTITY PRIMARY KEY
	,class_name VARCHAR(255)
)
GO

CREATE TABLE SUBJECT
(
	subject_id INT IDENTITY PRIMARY KEY
	,subject_name NVARCHAR(255)
)
GO

CREATE TABLE STUDENT_CLASS
(
	student_id INT REFRENCES STUDENT(student_id)
	,class_id INT REFRENCES CLASSROOM(class_id)
	PRIMARY KEY(student_id, class_id)
)
GO

CREATE TABLE STUDENT_SUBJECT
(
	student_id INT REFRENCES STUDENT(student_id)
	,subject_id INT REFRENCES SUBJECT(subject_id)
	PRIMARY KEY(student_id, subject_id)
)
GO

INSERT INTO STUDENT VALUES 
	(N'Tuân',21,N'Hà Đông',1)
	,(N'Huy',21,N'Hà Tây',1)
GO

INSERT INTO CLASSROOM VALUES
	('H2')
	,('H3')
GO

INSERT INTO SUBJECT VALUES
	(N'Toán')
	,(N'Văn')
GO

INSERT INTO STUDENT_CLASS VALUES
	(1,1)
	,(1,2)
	,(2,1)
	,(2,2)
GO

INSERT INTO STUDENT_SUBJECT VALUES
	(1,1)
	,(1,2)
	,(2,1)
	,(2,2)
GO
	
SELECT * FROM STUDENT su 
	JOIN STUDENT_SUBJECT ss ON su.student_id = ss.student_id
	JOIN SUBJECT st ON ss.subject_id = st.subject_id
	WHERE st.subject_name = 'Văn'

GO

SELECT * FROM STUDENT su 
	JOIN STUDENT_CLASS sc ON su.student_id = sc.student_id
	JOIN CLASSROOM c ON sc.class_id = cl.class_id
	WHERE cl.class_name = 'H2'

GO