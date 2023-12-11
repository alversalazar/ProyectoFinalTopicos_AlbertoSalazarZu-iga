CREATE DATABASE Vinculation;
Use Vinculation;

CREATE TABLE User (
    idUser INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    PRIMARY KEY (idUser)
);

CREATE TABLE Career (
    idCareer INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    duration VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    PRIMARY KEY (idCareer)
);

CREATE TABLE Subject (
    idSubject INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    credit VARCHAR(30) NOT NULL,
    unit VARCHAR(50) NOT NULL,
    characteristic VARCHAR(50) NOT NULL,
    keyMatter VARCHAR(50) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    PRIMARY KEY (idSubject)
);

CREATE TABLE Employee (
    idEmployee INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    mothersLastName VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    socialSecurity CHAR(11) NOT NULL,
    dateOfHire DATE NOT NULL,
    idSubject INT NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    PRIMARY KEY (idEmployee)
);

CREATE TABLE Viatic (
    idViatic INT AUTO_INCREMENT,
    place VARCHAR(200) NOT NULL,
    description1 VARCHAR(250) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    idEmployee INT NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idUserCreate INT,
    creationdate DATE,
    idUserModify INT,
    modified DATE,
    PRIMARY KEY (idViatic)
);

CREATE TABLE StudyPlan (
    idStudyPlan INT AUTO_INCREMENT,
    objetive VARCHAR(50) NOT NULL,
    starDate DATE NOT NULL,
    finalDate DATE NOT NULL,
    key1 VARCHAR(50) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idCareer INT NOT NULL,
    idUserCreate INT,
    creationdate DATE,
    idUserModify INT,
    modified DATE,
    PRIMARY KEY (idStudyPlan)
);

CREATE TABLE EvaluationDetail (
    idEvaluationDetail INT AUTO_INCREMENT ,
    assessment VARCHAR(50) NOT NULL,
    criterion VARCHAR(100) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idUserCreate INT NULL,
    dateCreate DATE NULL,
    idUserModified INT NULL,
    dateModified DATE NULL,
    PRIMARY KEY (idEvaluationDetail)
);

CREATE TABLE Student (
    idStudent INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    mothersthestName VARCHAR(50) NOT NULL,
    enrollment VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    curp CHAR(18) NOT NULL,
    phone CHAR(10) NOT NULL,
    rfc CHAR(13) NOT NULL,
    socialSegurity CHAR(11) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    IdUserCreate INT NULL,
    creationdate DATE NULL,
    IdUserModify INT NULL,
    modified DATE NULL,
       PRIMARY KEY (idStudent)
);

CREATE TABLE ComplementaryActivity (
    idComplementaryActivity INT AUTO_INCREMENT,
    activityname VARCHAR(50) NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idStudent INT NOT NULL,
    idusercreate INT NULL,
    datecreate DATE NULL,
    idusermodified INT NULL,
    datemodified DATE NULL,
       PRIMARY KEY (idComplementaryActivity)
);

CREATE TABLE ActivityDetail (
    idActivityDetail INT AUTO_INCREMENT ,
    activitydetailsdescription VARCHAR(100) NOT NULL,
    idEvaluationDetail INT NULL,
    idComplementaryActivity INT NULL,
    status BIT NOT NULL DEFAULT 1,
    idUserCreate INT NULL,
    dateCreate DATE NULL,
    idUserModified INT NULL,
    dateModified DATE NULL,
       PRIMARY KEY (idActivityDetail)
);

CREATE TABLE CompanyStudent (
    IdCompanyStudent INT AUTO_INCREMENT,
    date DATE NULL,
    workplace VARCHAR(50) NOT NULL,
    idStudent INT NOT NULL,
    status BIT NOT NULL DEFAULT 1,
    idUserCreate INT NULL,
    dateCreate DATE NULL,
    idUserModified INT NULL,
    dateModified DATE NULL,
       PRIMARY KEY (IdCompanyStudent)
);
/------------------------INDEX-------------------------------------/
CREATE INDEX IX_User ON User(idUser);
CREATE INDEX IX_Career ON Career(idCareer);
CREATE INDEX IX_Subject ON Subject(idSubject);
CREATE INDEX IX_Employee ON Employee(idEmployee);
CREATE INDEX IX_Viatic ON Viatic(idViatic);
CREATE INDEX IX_StudyPlan ON StudyPlan(idStudyPlan);
CREATE INDEX IX_EvaluationDetail ON EvaluationDetail(idEvaluationDetail);
CREATE INDEX IX_Student ON Student(idStudent);
CREATE INDEX IX_ComplementaryActivity ON ComplementaryActivity(idComplementaryActivity);
CREATE INDEX IX_ActivityDetail ON ActivityDetail(idActivityDetail);
CREATE INDEX IX_CompanyStudent ON CompanyStudent(IdCompanyStudent);

/-------------------------RELACIONES------------------------/
ALTER TABLE Career
ADD CONSTRAINT FK_UserCreateCareer 
FOREIGN KEY (idUserCreate) REFERENCES User(idUser);

ALTER TABLE Career
ADD CONSTRAINT FK_UserModifiedCareer 
FOREIGN KEY (idUserModified) REFERENCES User(idUser);

ALTER TABLE Employee
ADD CONSTRAINT FK_UserCreateEmployee
 FOREIGN KEY (idUserCreate)REFERENCES User(idUser);

ALTER TABLE Employee
ADD CONSTRAINT FK_UserModifiedEmployee FOREIGN KEY (idUserModified)
REFERENCES User(idUser);

ALTER TABLE Subject
ADD CONSTRAINT FK_UserCreateSubject 
FOREIGN KEY (idUserCreate) REFERENCES User(idUser);

ALTER TABLE Subject
ADD CONSTRAINT FK_UserModifiedSubject 
FOREIGN KEY (idUserModified) REFERENCES User(idUser);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserCreateStudyPlan FOREIGN KEY (idUserCreate)
REFERENCES User(idUser);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserModifiedStudyPlan 
FOREIGN KEY (idUserModify) REFERENCES User(idUser);

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserCreateViatic 
FOREIGN KEY (idUserCreate) REFERENCES User(idUser);

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserModifiedViatic 
FOREIGN KEY (idUserModify) REFERENCES User(idUser);

ALTER TABLE Employee
ADD CONSTRAINT FK_AgreementSubject 
FOREIGN KEY (idSubject) REFERENCES Subject (idSubject);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer 
FOREIGN KEY (idCareer) REFERENCES Career (idCareer);

ALTER TABLE Viatic
ADD CONSTRAINT FK_ViaticEmployee 
FOREIGN KEY (idEmployee) REFERENCES Employee (idEmployee);


INSERT INTO User (name,password, email)
VALUES ('Nallely', '130218','toledo@');

INSERT INTO Career(name,duration,description,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES('Informatica', '4 años 9 meses','Programacion',1,CURDATE(),1,CURDATE()),
      ('Mecanica', '4 años 9 meses','Automotriz',1,CURDATE(),1,CURDATE()),
	  ('Gestion Empresarial', '4 años 9 meses','Gestiona',1,CURDATE(),1,CURDATE()),
	  ('Electronica', '4 años 9 meses','Gestiona',1,CURDATE(),1,CURDATE()),
	  ('Energias Renovables', '4 años 9 meses','Medio ambiente',1,CURDATE(),1,CURDATE()),
	  ('Industrial', '4 años 9 meses','Industria',1,CURDATE(),1,CURDATE());

INSERT INTO Subject(name,credit,unit,characteristic,keyMatter,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('ingles','100','1','Actividad 1','0923',1,CURDATE(),1,CURDATE()),
       ('ingles','100','2','Actividad 2','0923',1,CURDATE(),1,CURDATE()),
	   ('ingles','100','3','Actividad 3','0923',1,CURDATE(),1,CURDATE()),
	   ('ingles','100','4','Actividad 4','0923',1,CURDATE(),1,CURDATE()),
	   ('ingles','100','5','Actividad 5','0923',1,CURDATE(),1,CURDATE());
       
INSERT INTO Employee(name,lastname,mothersLastName	,gender,phone,email,address,socialSecurity,dateOfHire,idSubject,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('Luis Alfonso','Rodriguez','Perez','Hombre','8662567822','luis@gmail.com','Ayuntamiento 212 Occidental','44180032044','2023-01-23',1,1,CURDATE(),1,CURDATE()),
       ('Alberto','Salazar','Zuñiga','Hombre','8662347822','alberto@gmail.com','Ignacio allende 313 La sierrita','44180032042','2023-02-12',2,1,CURDATE(),1,CURDATE()),
	   ('Antonio','Rodriguez','Tovar','Hombre','8661227822','antonio@gmail.com','Jalisco nte 1700 Monclova','44180032043','2023-02-10',3,1,CURDATE(),1,CURDATE()),
	   ('Gabriela','Mendoza','Aguilar','Mujer','8662137822','gabriela@gmail.com','C. Monaco 1010 Monclova','44180032044','2023-04-11',4,1,CURDATE(),1,CURDATE()),
	   ('Patricia','Hernendez','Mata','Mujer','8665437822','patricia@gmail.com','C. Zaragoza 227 Frontera','44180032045','2023-07-25',5,1,CURDATE(),1,CURDATE());

INSERT INTO Viatic(place,description1,amount,idEmployee,idUsercreate,creationdate,IdUserModify,modified)
VALUES ('Saltillo Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','2500.50',1,1,CURDATE(),1,CURDATE()),
       ('Monterrey Nuevo Leon','Realizar una visita para conocer las instalaciones y que es lo que realizan.','3289.50',2,1,CURDATE(),1,CURDATE()),
	   ('Monclova Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','1289.50',3,1,CURDATE(),1,CURDATE()),
	   ('Frontera Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','1392.50',4,1,CURDATE(),1,CURDATE()),
	   ('Saltillo Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','3478.50',5,1,CURDATE(),1,CURDATE());

INSERT INTO StudyPlan(objetive,starDate,finalDate,key1 ,idCareer  ,IdUserCreate,creationdate,IdUserModify,modified)
VALUES ('Informatica','2023-10-07','2023-11-09','I1920812',1,1,CURDATE(),1,CURDATE()),
       ('Gestion Empresarial','2023-10-08','2023-11-09','G8237288',2,1,CURDATE(),1,CURDATE()),
	('Electronica','2023-10-09','2023-11-09','E1920812',3,1,CURDATE(),1,CURDATE()),
       ('Mecanica','2023-10-10','2023-11-09','M765647',4,1,CURDATE(),1,CURDATE()),
	('Industrial','2023-10-11','2023-11-09','IN99087Y',5,1,CURDATE(),1,CURDATE());

INSERT INTO Student (name, lastName, mothersthestName, enrollment, birthdate, curp, phone, rfc, socialSegurity, IdUserCreate, creationdate, IdUserModify, modified)
VALUES 
    ('Nallely', 'Toledo', 'Alonso', 'I15171917', '1996-06-09', 'TOASMNL000NLLN9654', '8667882323', 'TOASMNL000NLL', '44180032043', 1, CURDATE(), 1, CURDATE()),
    ('Alberto', 'Salazar', 'Zuñiga', 'I18050517', '2000-04-08', 'SAZA000408HCLLXLA6', '8661222321', 'SAZA000408K61', '44180032089', 1, CURDATE(), 1, CURDATE()),
    ('Antonio', 'Perez', 'Gaitan', 'I23050517', '2003-08-20', 'PEGA030820HCLLXKLR', '8664322321', 'PEGA030820HCL', '44180032090', 1, CURDATE(), 1, CURDATE()),
    ('Maria', 'Rivera', 'Soledad', 'I20050517', '2005-01-25', 'RISM000408HCLLXLA6', '8662332321', 'RISM000408HCL', '44180032011', 1, CURDATE(), 1, CURDATE()),
    ('Bertha', 'Ibarra', 'Vazquez', 'I17050517', '2007-09-17', 'VAVB000408HCLLXLO6', '8666542321', 'VAVB000408HCL', '44180032055', 1, CURDATE(), 1, CURDATE());

INSERT INTO EvaluationDetail (assessment, criterion, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES 
    ('Excelente', 'Un buen desarrollo de trabajo', 1, CURDATE(), 1, CURDATE()),
    ('Buen trabajp', 'Interesante trabajo solo la ortografia', 1, CURDATE(), 1, CURDATE()),
    ('Excelente', 'Ninguno', 1, CURDATE(), 1, CURDATE()),
    ('Excelente', 'Ninguno', 1, CURDATE(), 1, CURDATE());

INSERT INTO ComplementaryActivity (activityname, idStudent, idUsercreate, dateCreate, idUserModified, dateModified)
VALUES 
    ('practice', 1, 1, CURDATE(), 1, CURDATE()),
    ('residence', 2,  1, CURDATE(), 1, CURDATE()),
    ('stay', 3,  1, CURDATE(), 1, CURDATE()),
    ('socialservice', 4,  1, CURDATE(), 1, CURDATE());

INSERT INTO ActivityDetail (activitydetailsdescription, idEvaluationDetail, idComplementaryActivity, idUsercreate, dateCreate, idUserModified, dateModified)
VALUES 
    ('Ninguno', 1, 1, 1, CURDATE(), 1, CURDATE()),
    ('Interesante trabajo solo falta menjorar la ortografia', 2, 2, 1, CURDATE(), 1, CURDATE()),
    ('Ninguno', 3, 3, 1, CURDATE(), 1, CURDATE()),
    ('Ninguno', 4, 4, 1, CURDATE(), 1, CURDATE());

INSERT INTO CompanyStudent (date, workplace, idStudent, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES 
    ('2023-10-23', 'HFI', 1, 1, CURDATE(), 1, CURDATE()),
    ('2023-11-30', 'Grupo Fox', 2, 1, CURDATE(), 1, CURDATE()),
    ('2023-09-25', 'Denso', 3, 1, CURDATE(), 1, CURDATE()),
    ('2023-10-02', 'Aramak', 4, 1, CURDATE(), 1, CURDATE()),
    ('2023-11-09', 'Quality', 5, 1, CURDATE(), 1, CURDATE());

SELECT * FROM ActivityDetail;
SELECT * FROM EvaluationDetail;
SELECT * FROM Student;
SELECT * FROM ComplementaryActivity;
SELECT * FROM CompanyStudent;
       
select * from User;
select * from Career;
select * from Subject;
select * from Employee;
select * from Viatic;
select * from StudyPlan;