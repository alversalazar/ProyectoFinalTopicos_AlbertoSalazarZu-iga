--- P R O C E D I M I E N T O S -- I N S E R T
CREATE PROCEDURE INSERT_Career
(
@manejador as varchar(100),
@name AS VARCHAR (100),
@duration as varchar(20),
@description as varchar(200)
)
AS
BEGIN
IF @manejador = 'SQL SERVER' 
BEGIN
INSERT INTO Career([name], duration, [description],idUserCreate,dateCreate,idUserModified,dateModified) 
VALUES (@name,@duration, @description, 1,GETDATE(),1,GETDATE());
END

ELSE IF @manejador = 'MYSQL'
BEGIN
INSERT INTO OPENQUERY ([MYSQL],'SELECT name, duration, description,idUserCreate,dateCreate,idUserModified,dateModified FROM Vinculation.Career') 
VALUES (@name,@duration, @description, 1,GETDATE(),1,GETDATE());
END 


END 
GO

---------------------------------------------------------------------------------------------------------------------------------------







CREATE PROCEDURE INSERT_Employee
(
@manejador as varchar(100),
@name AS VARCHAR (100),
@lastname as varchar(100),
@mothersLastName as varchar(100),
@gender as varchar(100),
@phone as char(100),
@email as varchar(100),
@address as varchar(100),
@socialSecurity as char(100),
@dateOfHire as date
)
AS
BEGIN
IF @manejador = 'SQL SERVER' 
BEGIN
INSERT INTO Employee([name], lastname,[mothersLastName], gender, phone, email,[address], socialSecurity, dateOfHire, idSubject,idUserCreate,dateCreate,idUserModified,dateModified) 
VALUES (@name,@lastname, @mothersLastName,@gender,@phone,@email,@address,@socialSecurity,@dateOfHire,1, 1,GETDATE(),1,GETDATE());
END


END
GO











----------------------------------------------------------------------------------------------------------------------------------------------








CREATE PROCEDURE INSERT_Subject
(
@manejador as varchar(100),
@name AS VARCHAR (100),
@credit as varchar(100),
@unit as varchar(100),
@characteristic as varchar(100),
@keyMatter as varchar(100)
)
AS
BEGIN
IF @manejador = 'SQL SERVER' 
BEGIN
INSERT INTO [Subject]([name], credit,unit, characteristic, keyMatter,idUserCreate,dateCreate,idUserModified,dateModified) 
VALUES (@name,@credit, @unit,@characteristic,@keyMatter, 1,GETDATE(),1,GETDATE());
END


END
GO







----------------------------------------------------------------------------------------------------------------------------------------------







CREATE PROCEDURE INSERT_StudyPlan
(
@manejador as varchar(100),
@objetive AS VARCHAR (100),
@starDate as date,
@finalDate as date,
@key1 as varchar(100)
)
AS
BEGIN
IF @manejador = 'SQL SERVER' 
BEGIN
INSERT INTO StudyPlan(objetive,starDate,finalDate,key1,idCareer,idUserCreate,creationdate,IdUserModify,modified) 
VALUES (@objetive,@starDate, @finalDate,@key1,1, 1,GETDATE(),1,GETDATE());
END


END
GO


-----------------------------------------------------------------------------------------------------------------------------------------








CREATE PROCEDURE INSERT_Viatic
(
@manejador as varchar(100),
@place AS VARCHAR (100),
@description1 as VARCHAR (100),
@amount as decimal (10,2),
@idEmployee as int
)
AS
BEGIN
IF @manejador = 'SQL SERVER' 
BEGIN
INSERT INTO Viatic(place,description1,amount,idEmployee,idUserCreate,creationdate,IdUserModify,modified) 
VALUES (@place,@description1, @amount,@idEmployee, 1,GETDATE(),1,GETDATE());
END


END
GO









-----------------------Tablas de mysql-----------------------------------------------------------
CREATE PROCEDURE INSERT_EvaluationDetail
(
@manejador as varchar(100),
@assessment AS VARCHAR (100),
@criterion as varchar(100)
)
AS
BEGIN


IF @manejador = 'MYSQL'
BEGIN
INSERT INTO OPENQUERY ([MYSQL],'SELECT assessment, criterion,idUserCreate,dateCreate,idUserModified,dateModified FROM Vinculation.EvaluationDetail') 
VALUES (@assessment,@criterion, 1,GETDATE(),1,GETDATE());
END 


END 
GO





---------------------------------------------------------------------------------------------------------------------------------------






CREATE PROCEDURE INSERT_Student
(
@manejador as varchar(100),
@name AS VARCHAR (100),
@lastName as varchar(100),
@mothersthestName as varchar(100),
@enrollment as varchar(100),
@birthdate as date,
@curp as varchar(100),
@phone as varchar(100),
@rfc as varchar(100),
@socialSegurity as varchar(100)
)
AS
BEGIN


IF @manejador = 'MYSQL'
BEGIN
INSERT INTO OPENQUERY ([MYSQL],'SELECT name, lastName,mothersthestName ,enrollment,birthdate,curp,phone,rfc,socialSegurity,idUserCreate,creationdate,IdUserModify,modified FROM Vinculation.Student') 
                               VALUES (@name,@lastName,@mothersthestName,@enrollment,@birthdate,@curp,@phone,@rfc,@socialSegurity, 1,GETDATE(),1,GETDATE());
END 


END 
GO





--------------------------------------------------------------------------------------------------------------------------------------------






CREATE PROCEDURE INSERT_ComplementaryActivity
(
@manejador as varchar(100),
@activityname AS VARCHAR (100),
@idStudent as int
)
AS
BEGIN


IF @manejador = 'MYSQL'
BEGIN
INSERT INTO OPENQUERY ([MYSQL],'SELECT activityname, idStudent,idUserCreate,dateCreate,idUserModified,dateModified FROM Vinculation.ComplementaryActivity') 
VALUES (@activityname,@idStudent, 1,GETDATE(),1,GETDATE());
END 


END 
GO





----------------------------------------------------------------------------------------------------------------------------------------







CREATE PROCEDURE INSERT_ActivityDetail
(
@manejador as varchar(100),
@activitydetailsdescription AS VARCHAR (100),
@idEvaluationDetail as int,
@idComplementaryActivity as int
)
AS
BEGIN


IF @manejador = 'MYSQL'
BEGIN
INSERT INTO OPENQUERY ([MYSQL],'SELECT activitydetailsdescription, idEvaluationDetail,idComplementaryActivity,idUserCreate,dateCreate,idUserModified,dateModified FROM Vinculation.ActivityDetail') 
VALUES (@activitydetailsdescription,@idEvaluationDetail,@idComplementaryActivity, 1,GETDATE(),1,GETDATE());
END 


END 
GO





--------------------------------------------------------------------------------------------------------------------------------------------






CREATE PROCEDURE INSERT_CompanyStudent
(
@manejador as varchar(100),
@date AS date,
@workplace as varchar(100),
@idStudent as int
)
AS
BEGIN


IF @manejador = 'MYSQL'
BEGIN
INSERT INTO OPENQUERY ([MYSQL],'SELECT date, workplace,idStudent,idUserCreate,dateCreate,idUserModified,dateModified FROM Vinculation.CompanyStudent') 
VALUES (@date,@workplace,@idStudent, 1,GETDATE(),1,GETDATE());
END 


END 
GO





-----------------------tablas de postgre---------------------------------------------------------------------------------------------------------------------









CREATE PROCEDURE INSERT_Objective
(
@manejador as varchar(100),
@objetivename AS varchar(100)
)
AS
BEGIN

IF @manejador = 'POSTGRESQL'
BEGIN
INSERT INTO [POSTGRESQL]...Objective (objetivename,idUserCreate,dateCreate,idUserModified,dateModified) 
VALUES (@objetivename, 1,GETDATE(),1,GETDATE());

END 

END 
GO





-----------------------------------------------------------------------------------------------------------------------------------------





CREATE PROCEDURE INSERT_Territory 
(
@manejador as varchar(100),
@territoryname  AS varchar(100)
)
AS
BEGIN


IF @manejador = 'POSTGRESQL'
BEGIN
INSERT INTO [POSTGRESQL]...Territory(territoryname,idUserCreate,dateCreate,idUserModified,dateModified ) 
VALUES (@territoryname, 1,GETDATE(),1,GETDATE());
END 


END 
GO





----------------------------------------------------------------------------------------------------------------------------------------------






CREATE PROCEDURE INSERT_Company 
(
@manejador as varchar(100),
@name AS varchar(100),
@email AS varchar(100),
@phone AS char(100),
@address AS varchar(100),
@identificationNumber AS varchar(100)
)
AS
BEGIN


IF @manejador = 'POSTGRESQL'
BEGIN
INSERT INTO [POSTGRESQL]...Company( name,email,phone,address,identificationNumber,idUserCreate,dateCreate,idUserModified,dateModified ) 
VALUES (@name,@email,@phone,@address,@identificationNumber, 1,GETDATE(),1,GETDATE());
END 


END 
GO






------------------------------------------------------------------------------------------------------------------------------------------







CREATE PROCEDURE INSERT_Purpose
(
@manejador as varchar(100),
@investigation AS varchar(100),
@purposename AS varchar(100)
)
AS
BEGIN


IF @manejador = 'POSTGRESQL'
BEGIN
INSERT INTO [POSTGRESQL]...Purpose(investigation,purposename,idUserCreate,dateCreate,idUserModified,dateModified) 
VALUES (@investigation,@purposename, 1,GETDATE(),1,GETDATE());
END 


END 
GO







---------------------------------------------------------------------------------------------------------------------------------------------






CREATE PROCEDURE INSERT_Agreement
(
@manejador as varchar(100),
@acronym AS varchar(100),
@objetive AS varchar(100),
@idObjetive AS int,
@idTerritory AS int,
@statusAgreement AS varchar(100)
)
AS
BEGIN


IF @manejador = 'POSTGRESQL'
BEGIN
INSERT INTO [POSTGRESQL]...Agreement( acronym,objetive,idObjetive,idTerritory,statusAgreement,idUserCreate,dateCreate,idUserModified,dateModified ) 
VALUES (@acronym,@objetive,@idObjetive,@idTerritory,@statusAgreement, 1,GETDATE(),1,GETDATE());
END 


END 
GO