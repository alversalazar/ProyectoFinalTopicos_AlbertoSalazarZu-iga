CREATE TABLE "User"
(
    idUser int NOT NULL,
    "name" VARCHAR2(50) NOT NULL,
    "password" VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
   status number(1) default 1,
    CONSTRAINT PK_User 	PRIMARY KEY (idUser)
);

CREATE TABLE Career (
    idCareer int NOT NULL,
    "name" VARCHAR2(50) NOT NULL,
    "duration" VARCHAR2(20) NOT NULL,
    "description" VARCHAR2(20) NOT NULL,
  status number(1) default 1,
    idUserCreate NUMBER,
    dateCreate DATE,
    idUserModified NUMBER,
    dateModified DATE,
   CONSTRAINT PK_Career PRIMARY KEY (idCareer)
);

CREATE TABLE Subject (
    idSubject int NOT NULL,
    "name" VARCHAR2(50) NOT NULL,
    credit VARCHAR2(30) NOT NULL,
    unit VARCHAR2(50) NOT NULL,
    characteristic VARCHAR2(50) NOT NULL,
    keyMatter VARCHAR2(50) NOT NULL,
      status number(1) default 1,
    idUserCreate NUMBER,
    dateCreate DATE,
    idUserModified NUMBER,
    dateModified DATE,
   CONSTRAINT PK_Subject PRIMARY KEY (idSubject)
);

CREATE TABLE Employee (
    idEmployee int NOT NULL,
    "name" VARCHAR2(50) NOT NULL,
    lastname VARCHAR2(50) NOT NULL,
    mothersLastName VARCHAR2(50) NOT NULL,
    gender VARCHAR2(50) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    socialSecurity CHAR(11) NOT NULL,
    dateOfHire DATE NOT NULL,
    idSubject NUMBER NOT NULL,
     status number(1) default 1,
    idUserCreate NUMBER,
    dateCreate DATE,
    idUserModified NUMBER,
    dateModified DATE,
   CONSTRAINT PK_Employee PRIMARY KEY (idEmployee)
);

CREATE TABLE Viatic (
    idViatic int NOT NULL,
    place VARCHAR2(200) NOT NULL,
    description1 VARCHAR2(250) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    idEmployee NUMBER NOT NULL,
    status number(1) default 1,
    idUserCreate NUMBER,
    creationdate DATE,
    idUserModify NUMBER,
    modified DATE,
   CONSTRAINT PK_Viatic PRIMARY KEY (idViatic)
);

CREATE TABLE StudyPlan (
    idStudyPlan int NOT NULL,
    objetive VARCHAR2(50) NOT NULL,
    starDate DATE NOT NULL,
    finalDate DATE NOT NULL,
    key1 VARCHAR2(50) NOT NULL,
    status number(1) default 1,
    idCareer NUMBER NOT NULL,
    idUserCreate NUMBER,
    creationdate DATE,
    idUserModify NUMBER,
    modified DATE,
  CONSTRAINT PK_StudyPlan  PRIMARY KEY (idStudyPlan)
);

ALTER TABLE Career
ADD CONSTRAINT FK_UserCreateCareer 
FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser);

ALTER TABLE Career
ADD CONSTRAINT FK_UserModifiedCareer 
FOREIGN KEY (idUserModified) REFERENCES "User"(idUser);

ALTER TABLE Employee
ADD CONSTRAINT FK_UserCreateEmployee
FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser);

ALTER TABLE Employee
ADD CONSTRAINT FK_UserModifiedEmployee 
FOREIGN KEY (idUserModified) REFERENCES "User"(idUser);

ALTER TABLE Subject
ADD CONSTRAINT FK_UserCreateSubject 
FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser);

ALTER TABLE Subject
ADD CONSTRAINT FK_UserModifiedSubject 
FOREIGN KEY (idUserModified) REFERENCES "User"(idUser);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserCreateStudyPlan 
FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserModifiedStudyPlan 
FOREIGN KEY (idUserModify) REFERENCES "User"(idUser);

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserCreateViatic 
FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser);

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserModifiedViatic 
FOREIGN KEY (idUserModify) REFERENCES "User"(idUser);

ALTER TABLE Employee
ADD CONSTRAINT FK_AgreementSubject 
FOREIGN KEY (idSubject) REFERENCES Subject(idSubject);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer 
FOREIGN KEY (idCareer) REFERENCES Career(idCareer);

ALTER TABLE Viatic
ADD CONSTRAINT FK_ViaticEmployee 
FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

INSERT INTO "User" (idUser,"name", "password", email) VALUES (1,'Alberto', '130218', 'alberto@gmail.com');

INSERT INTO Career(idCareer,"name", "duration", "description", idUserCreate, dateCreate, idUserModified, dateModified)VALUES (1,'Informatica', '4 años 9 meses', 'Programacion', 1, SYSDATE, 1, SYSDATE);
INSERT INTO Career(idCareer,"name", "duration", "description", idUserCreate, dateCreate, idUserModified, dateModified)VALUES      (2,'Mecanica', '4 años 9 meses', 'Automotriz', 1, SYSDATE, 1, SYSDATE);
 INSERT INTO Career(idCareer,"name", "duration", "description", idUserCreate, dateCreate, idUserModified, dateModified)VALUES      (3,'Gestion Empresarial', '4 años 9 meses', 'Gestiona', 1, SYSDATE, 1, SYSDATE);
INSERT INTO Career(idCareer,"name", "duration", "description", idUserCreate, dateCreate, idUserModified, dateModified)VALUES       (4,'Electronica', '4 años 9 meses', 'Gestiona', 1, SYSDATE, 1, SYSDATE);
INSERT INTO Career(idCareer,"name", "duration", "description", idUserCreate, dateCreate, idUserModified, dateModified)VALUES       (5,'Energias Renovables', '4 años 9 meses', 'Medio ambiente', 1, SYSDATE, 1, SYSDATE);
INSERT INTO Career(idCareer,"name", "duration", "description", idUserCreate, dateCreate, idUserModified, dateModified)VALUES       (6,'Industrial', '4 años 9 meses', 'Industria', 1, SYSDATE, 1, SYSDATE);

INSERT INTO Subject(idsubject,"name", credit, unit, characteristic, keyMatter, idUserCreate, dateCreate, idUserModified, dateModified)VALUES (1,'ingles', '100', '1', 'Actividad 1', '0923', 1, SYSDATE, 1, SYSDATE);
INSERT INTO Subject(idsubject,"name", credit, unit, characteristic, keyMatter, idUserCreate, dateCreate, idUserModified, dateModified)VALUES       (2,'ingles', '100', '2', 'Actividad 2', '0923', 1, SYSDATE, 1, SYSDATE);
INSERT INTO Subject(idsubject,"name", credit, unit, characteristic, keyMatter, idUserCreate, dateCreate, idUserModified, dateModified)VALUES       (3,'ingles', '100', '3', 'Actividad 3', '0923', 1, SYSDATE, 1, SYSDATE);
INSERT INTO Subject(idsubject,"name", credit, unit, characteristic, keyMatter, idUserCreate, dateCreate, idUserModified, dateModified)VALUES       (4,'ingles', '100', '4', 'Actividad 4', '0923', 1, SYSDATE, 1, SYSDATE);
 INSERT INTO Subject(idsubject,"name", credit, unit, characteristic, keyMatter, idUserCreate, dateCreate, idUserModified, dateModified)VALUES      (5,'ingles', '100', '5', 'Actividad 5', '0923', 1, SYSDATE, 1, SYSDATE);

INSERT INTO Employee(idEmployee, "name", lastname, mothersLastName, gender, phone, email, address, socialSecurity, dateOfHire, idSubject, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES (1, 'Luis Alfonso', 'Rodriguez', 'Perez', 'Hombre', '8662567822', 'luis@gmail.com', 'Ayuntamiento 212 Occidental', '44180032044', TO_DATE('2023-04-11', 'YYYY-MM-DD'), 1, 1, SYSDATE, 1, SYSDATE);

INSERT INTO Employee(idEmployee, "name", lastname, mothersLastName, gender, phone, email, address, socialSecurity, dateOfHire, idSubject, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES (2, 'Alberto', 'Salazar', 'Zuñiga', 'Hombre', '8662347822', 'alberto@gmail.com', 'Ignacio allende 313 La sierrita', '44180032042', TO_DATE('2023-02-12', 'YYYY-MM-DD'), 2, 1, SYSDATE, 1, SYSDATE);

INSERT INTO Employee(idEmployee, "name", lastname, mothersLastName, gender, phone, email, address, socialSecurity, dateOfHire, idSubject, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES (3, 'Antonio', 'Rodriguez', 'Tovar', 'Hombre', '8661227822', 'antonio@gmail.com', 'Jalisco nte 1700 Monclova', '44180032043', TO_DATE('2023-02-10', 'YYYY-MM-DD'), 3, 1, SYSDATE, 1, SYSDATE);

INSERT INTO Employee(idEmployee, "name", lastname, mothersLastName, gender, phone, email, address, socialSecurity, dateOfHire, idSubject, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES (4, 'Gabriela', 'Mendoza', 'Aguilar', 'Mujer', '8662137822', 'gabriela@gmail.com', 'C. Monaco 1010 Monclova', '44180032044', TO_DATE('2023-04-11', 'YYYY-MM-DD'), 4, 1, SYSDATE, 1, SYSDATE);

INSERT INTO Employee(idEmployee, "name", lastname, mothersLastName, gender, phone, email, address, socialSecurity, dateOfHire, idSubject, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES (5, 'Patricia', 'Hernendez', 'Mata', 'Mujer', '8665437822', 'patricia@gmail.com', 'C. Zaragoza 227 Frontera', '44180032045', TO_DATE('2023-07-25', 'YYYY-MM-DD'), 5, 1, SYSDATE, 1, SYSDATE);



INSERT INTO Viatic(idViatic, place, description1, amount, idEmployee, idUserCreate, creationdate, IdUserModify, modified)
VALUES (1, 'Saltillo Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', 2500.50, 1, 1, SYSDATE, 1, SYSDATE);

INSERT INTO Viatic(idViatic, place, description1, amount, idEmployee, idUserCreate, creationdate, IdUserModify, modified)
VALUES (2, 'Monterrey Nuevo Leon', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', 3289.50, 2, 1, SYSDATE, 1, SYSDATE);

INSERT INTO Viatic(idViatic,place, description1, amount, idEmployee, idUserCreate, creationdate, IdUserModify, modified)VALUES       
(3,'Monclova Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', 1289.50, 3, 1, SYSDATE, 1, SYSDATE);

 INSERT INTO Viatic(idViatic,place, description1, amount, idEmployee, idUserCreate, creationdate, IdUserModify, modified)VALUES     
 (4,'Frontera Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', 1392.50, 4, 1, SYSDATE, 1, SYSDATE);
 
 INSERT INTO Viatic(idViatic,place, description1, amount, idEmployee, idUserCreate, creationdate, IdUserModify, modified)VALUES      
 (5,'Saltillo Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', 3478.50, 5, 1, SYSDATE, 1, SYSDATE);

INSERT INTO StudyPlan(idStudyPlan, objetive, starDate, finalDate, key1, idCareer, IdUserCreate, creationdate, IdUserModify, modified)
VALUES (1, 'Informatica', TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), 'I1920812', 1, 1, SYSDATE, 1, SYSDATE);

INSERT INTO StudyPlan(idStudyPlan, objetive, starDate, finalDate, key1, idCareer, IdUserCreate, creationdate, IdUserModify, modified)
VALUES (2, 'Gestion Empresarial', TO_DATE('2023-10-08', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), 'G8237288', 2, 1, SYSDATE, 1, SYSDATE);



select * from "User";
select * from Career;
select * from Employee;
select * from Subject;
select * from Viatic;
select * from StudyPlan;