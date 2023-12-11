CREATE TABLE Career (
    idCareer INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    duration VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT 1,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idUserCreate) REFERENCES User(idUser),
    FOREIGN KEY (idUserModified) REFERENCES User(idUser)
);

CREATE TABLE Employee (
    idEmployee INTEGER PRIMARY KEY AUTOINCREMENT,
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
    status BOOLEAN NOT NULL DEFAULT 1,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idUserCreate) REFERENCES User(idUser),
    FOREIGN KEY (idUserModified) REFERENCES User(idUser),
    FOREIGN KEY (idSubject) REFERENCES Subject(idSubject)
);

CREATE TABLE Subject (
    idSubject INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    credit VARCHAR(30) NOT NULL,
    unit VARCHAR(50) NOT NULL,
    characteristic VARCHAR(50) NOT NULL,
    keyMatter VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT 1,
    idUserCreate INT,
    dateCreate DATE,
    idUserModified INT,
    dateModified DATE,
    FOREIGN KEY (idUserCreate) REFERENCES User(idUser),
    FOREIGN KEY (idUserModified) REFERENCES User(idUser)
);

CREATE TABLE StudyPlan (
    idStudyPlan INTEGER PRIMARY KEY AUTOINCREMENT,
    objetive VARCHAR(50) NOT NULL,
    starDate DATE NOT NULL,
    finalDate DATE NOT NULL,
    key1 VARCHAR(50) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT 1,
    idCareer INT NOT NULL,
    idUserCreate INT,
    creationdate DATE,
    idUserModify INT,
    modified DATE,
    FOREIGN KEY (idCareer) REFERENCES Career(idCareer),
    FOREIGN KEY (idUserCreate) REFERENCES User(idUser),
    FOREIGN KEY (idUserModify) REFERENCES User(idUser)
);

CREATE TABLE Viatic (
    idViatic INTEGER PRIMARY KEY AUTOINCREMENT,
    place VARCHAR(200) NOT NULL,
    description1 VARCHAR(250) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    idEmployee INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT 1,
    idUserCreate INT,
    creationdate DATE,
    idUserModify INT,
    modified DATE,
    FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee),
    FOREIGN KEY (idUserCreate) REFERENCES User(idUser),
    FOREIGN KEY (idUserModify) REFERENCES User(idUser)
);
INSERT INTO User (name, password, email)
VALUES ('Alberto', '130218', 'Alberto@gmail.com');

INSERT INTO Career(name, duration, description, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES
    ('Informatica', '4 años 9 meses', 'Programacion', 1, DATE('now'), 1, DATE('now')),
    ('Mecanica', '4 años 9 meses', 'Automotriz', 1, DATE('now'), 1, DATE('now')),
    ('Gestion Empresarial', '4 años 9 meses', 'Gestiona', 1, DATE('now'), 1, DATE('now')),
    ('Electronica', '4 años 9 meses', 'Gestiona', 1, DATE('now'), 1, DATE('now')),
    ('Energias Renovables', '4 años 9 meses', 'Medio ambiente', 1, DATE('now'), 1, DATE('now')),
    ('Industrial', '4 años 9 meses', 'Industria', 1, DATE('now'), 1, DATE('now'));

INSERT INTO Subject(name, credit, unit, characteristic, keyMatter, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES
    ('ingles', '100', '1', 'Actividad 1', '0923', 1, DATE('now'), 1, DATE('now')),
    ('ingles', '100', '2', 'Actividad 2', '0923', 1, DATE('now'), 1, DATE('now')),
    ('ingles', '100', '3', 'Actividad 3', '0923', 1, DATE('now'), 1, DATE('now')),
    ('ingles', '100', '4', 'Actividad 4', '0923', 1, DATE('now'), 1, DATE('now')),
    ('ingles', '100', '5', 'Actividad 5', '0923', 1, DATE('now'), 1, DATE('now')));

INSERT INTO Employee(name, lastname, mothersLastName, gender, phone, email, address, socialSecurity, dateOfHire, idSubject, idUserCreate, dateCreate, idUserModified, dateModified)
VALUES
    ('Luis Alfonso', 'Rodriguez', 'Perez', 'Hombre', '8662567822', 'luis@gmail.com', 'Ayuntamiento 212 Occidental', '44180032044', '2023-01-23', 1, 1, DATE('now'), 1, DATE('now')),
    ('Alberto', 'Salazar', 'Zuñiga', 'Hombre', '8662347822', 'alberto@gmail.com', 'Ignacio allende 313 La sierrita', '44180032042', '2023-02-12', 2, 1, DATE('now'), 1, DATE('now')),
    ('Antonio', 'Rodriguez', 'Tovar', 'Hombre', '8661227822', 'antonio@gmail.com', 'Jalisco nte 1700 Monclova', '44180032043', '2023-02-10', 3, 1, DATE('now'), 1, DATE('now')),
    ('Gabriela', 'Mendoza', 'Aguilar', 'Mujer', '8662137822', 'gabriela@gmail.com', 'C. Monaco 1010 Monclova', '44180032044', '2023-04-11', 4, 1, DATE('now'), 1, DATE('now')),
    ('Patricia', 'Hernendez', 'Mata', 'Mujer', '8665437822', 'patricia@gmail.com', 'C. Zaragoza 227 Frontera', '44180032045', '2023-07-25', 5, 1, DATE('now'), 1, DATE('now')));

INSERT INTO Viatic(place, description1, amount, idEmployee, idUserCreate, creationdate, IdUserModify, modified)
VALUES
    ('Saltillo Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '2500.50', 1, 1, DATE('now'), 1, DATE('now')),
    ('Monterrey Nuevo Leon', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '3289.50', 2, 1, DATE('now'), 1, DATE('now')),
    ('Monclova Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '1289.50', 3, 1, DATE('now'), 1, DATE('now')),
    ('Frontera Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '1392.50', 4, 1, DATE('now'), 1, DATE('now')),
    ('Saltillo Coahuila', 'Realizar una visita para conocer las instalaciones y que es lo que realizan.', '3478.50', 5, 1, DATE('now'), 1, DATE('now')));

INSERT INTO StudyPlan(objetive, starDate, finalDate, key1, idCareer, IdUserCreate, creationdate, IdUserModify, modified)
VALUES
    ('Informatica', '2023-10-07', '2023-11-09', 'I1920812', 1, 1, DATE('now'), 1, DATE('now')),
    ('Gestion Empresarial', '2023-10-08', '2023-11-09', 'G8237288', 2, 1, DATE('now'), 1, DATE('now')),
    ('Electronica', '2023-10-09', '2023-11-09', 'E1920812', 3, 1, DATE('now'), 1, DATE('now')) ;
SELECT * FROM User;
SELECT * FROM Career;
SELECT * FROM Subject;
SELECT * FROM Employee;
SELECT * FROM Viatic;
SELECT * FROM StudyPlan;


