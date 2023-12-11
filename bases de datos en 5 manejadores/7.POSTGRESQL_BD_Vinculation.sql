CREATE TABLE "User" (
    idUser SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Career (
    idCareer SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    duration VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE
);

CREATE TABLE Subject (
    idSubject SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    credit VARCHAR(30) NOT NULL,
    unit VARCHAR(50) NOT NULL,
    characteristic VARCHAR(50) NOT NULL,
    keyMatter VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE
);

CREATE TABLE Employee (
    idEmployee SERIAL PRIMARY KEY,
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
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE
);

CREATE TABLE Viatic (
    idViatic SERIAL PRIMARY KEY,
    place VARCHAR(200) NOT NULL,
    description1 VARCHAR(250) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    idEmployee INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    creationdate DATE,
    idUserModify INT,
    modified DATE
);

CREATE TABLE StudyPlan (
    idStudyPlan SERIAL PRIMARY KEY,
    objetive VARCHAR(50) NOT NULL,
    startDate DATE NOT NULL,
    finalDate DATE NOT NULL,
    key1 VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idCareer INT NOT NULL,
    idUserCreate INT,
    creationdate DATE,
    idUserModify INT,
    modified DATE
);

-- Aquí continúan las inserciones de datos...

CREATE TABLE Objective (
    idObjective SERIAL PRIMARY KEY,
    objetivename VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser),
    FOREIGN KEY (idUserModified) REFERENCES "User"(idUser)
);

CREATE TABLE Territory (
    idTerritory SERIAL PRIMARY KEY,
    territoryname VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser),
    FOREIGN KEY (idUserModified) REFERENCES "User"(idUser)
);

CREATE TABLE Company (
    idCompany SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    identificationNumber VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser),
    FOREIGN KEY (idUserModified) REFERENCES "User"(idUser)
);

CREATE TABLE Purpose (
    idPurpose SERIAL PRIMARY KEY,
    investigation VARCHAR(50) NOT NULL,
    purposename VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser),
    FOREIGN KEY (idUserModified) REFERENCES "User"(idUser)
);

CREATE TABLE Agreement (
    idAgreement SERIAL PRIMARY KEY,
    acronym VARCHAR(50) NOT NULL,
    objetive VARCHAR(25) NOT NULL,
    idObjetive INT NOT NULL,
    idTerritory INT NOT NULL,
    statusAgreement VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idObjetive) REFERENCES Objective(idObjective),
    FOREIGN KEY (idTerritory) REFERENCES Territory(idTerritory),
    FOREIGN KEY (idUserCreate) REFERENCES "User"(idUser),
    FOREIGN KEY (idUserModified) REFERENCES "User"(idUser)
);
-- RELACIONES
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
FOREIGN KEY (idSubject) REFERENCES Subject (idSubject);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer 
FOREIGN KEY (idCareer) REFERENCES Career (idCareer);

ALTER TABLE Viatic
ADD CONSTRAINT FK_ViaticEmployee 
FOREIGN KEY (idEmployee) REFERENCES Employee (idEmployee);




INSERT INTO "User" (name, password, email)
VALUES ('Alberto', '1234', 'A_Salazar@gmail.com');

INSERT INTO Objective (objetivename, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES ('specific', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('general', 1, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO Territory (territoryname, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES ('nacional', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('internacional', 1, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO Company (name, email, phone, address, identificationNumber, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES ('Altos hornos de mexico', 'hornos@gmail.com', '8661652344', 'kenedy 122 monclova', '2023', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('Denso', 'denso@gmail.com', '8661302344', 'de los hornos cd frontera', '2023', 2, CURRENT_DATE, 1, CURRENT_DATE),
       ('Ferromex', 'ferromex@gmail.com', '8661623445', 'Americana cd frontera', '2023', 3, CURRENT_DATE, 1, CURRENT_DATE),
       ('Coahuila Durango', 'coahuiladurango@gmail.com', '8662002344', 'porfirio diaz cd frontera', '2023', 4, CURRENT_DATE, 1, CURRENT_DATE),
       ('Aptiv', 'aptiv@gmail.com', '8661702344', 'lib carlos salinas de gortari', '2023', 5, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO Purpose (investigation, purposename, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES ('investigation', 'investigation', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('practice', 'practice', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('resindence', 'resindence', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('socialService', 'socialService', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('external', 'external', 1, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO Agreement (acronym, objetive, idObjetive, idTerritory, statusAgreement, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES ('CFE', 'Servicio', 1, 1, 'Activo', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('Simas', 'Servicio', 2, 2, 'Inactivo', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('Telmex', 'Servicio', 2, 1, 'Activo', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('Transporte', 'Servicio', 1, 2, 'Activo', 1, CURRENT_DATE, 1, CURRENT_DATE),
       ('Mantenimiento', 'Servicio', 2, 1, 'Inactivo', 1, CURRENT_DATE, 1, CURRENT_DATE);

	   INSERT INTO Career(name, duration, description, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES 
    ('Informatica', '4 años 9 meses', 'Programacion', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Mecanica', '4 años 9 meses', 'Automotriz', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Gestion Empresarial', '4 años 9 meses', 'Gestiona', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Electronica', '4 años 9 meses', 'Gestiona', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Energias Renovables', '4 años 9 meses', 'Medio ambiente', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Industrial', '4 años 9 meses', 'Industria', 1, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO Subject(name, credit, unit, characteristic, keyMatter, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES 
    ('ingles', '100', '1', 'Actividad 1', '0923', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('ingles', '100', '2', 'Actividad 2', '0923', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('ingles', '100', '3', 'Actividad 3', '0923', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('ingles', '100', '4', 'Actividad 4', '0923', 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('ingles', '100', '5', 'Actividad 5', '0923', 1, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO Employee(name, lastname, mothersLastName, gender, phone, email, address, socialSecurity, dateOfHire, idSubject, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES 
    ('Luis Alfonso', 'Rodriguez', 'Perez', 'Hombre', '8662567822', 'luis@gmail.com', 'Ayuntamiento 212 Occidental', '44180032044', '2023-01-23', 1, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Alberto', 'Salazar', 'Zuñiga', 'Hombre', '8662347822', 'alberto@gmail.com', 'Ignacio allende 313 La sierrita', '44180032042', '2023-02-12', 2, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Antonio', 'Rodriguez', 'Tovar', 'Hombre', '8661227822', 'antonio@gmail.com', 'Jalisco nte 1700 Monclova', '44180032043', '2023-02-10', 3, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Gabriela', 'Mendoza', 'Aguilar', 'Mujer', '8662137822', 'gabriela@gmail.com', 'C. Monaco 1010 Monclova', '44180032044', '2023-04-11', 4, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Patricia', 'Hernendez', 'Mata', 'Mujer', '8665437822', 'patricia@gmail.com', 'C. Zaragoza 227 Frontera', '44180032045', '2023-07-25', 5, 1, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO Viatic(place, description1, amount, idEmployee, idUserCreate, creationdate, IdUserModify, modified)
VALUES 
    ('Saltillo Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '2500.50', 1, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Monterrey Nuevo Leon', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '3289.50', 2, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Monclova Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '1289.50', 3, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Frontera Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '1392.50', 4, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Saltillo Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '3478.50', 5, 1, CURRENT_DATE, 1, CURRENT_DATE);

INSERT INTO StudyPlan(objetive, startDate, finalDate, key1, idCareer, IdUserCreate, creationdate, IdUserModify, modified)
VALUES 
    ('Informatica', '2023-10-07', '2023-11-09', 'I1920812', 1, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Gestion Empresarial', '2023-10-08', '2023-11-09', 'G8237288', 2, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Electronica', '2023-10-09', '2023-11-09', 'E1920812', 3, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Mecanica', '2023-10-10', '2023-11-09', 'M765647', 4, 1, CURRENT_DATE, 1, CURRENT_DATE),
    ('Industrial', '2023-10-11', '2023-11-09', 'IN99087Y', 5, 1, CURRENT_DATE, 1, CURRENT_DATE);

SELECT * FROM "User";
SELECT * FROM Career;
SELECT * FROM Subject;
SELECT * FROM Employee;
SELECT * FROM Viatic;
SELECT * FROM StudyPlan;

