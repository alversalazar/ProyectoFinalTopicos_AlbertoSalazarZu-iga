--- P R O C E D I M I E N T O S --- S E L E C T
----------------------------------------Career
CREATE PROCEDURE SELECT_Career
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN
----ESTE SERVIDOR ES LOCAL
IF @manejador = 'SQL SERVER'
BEGIN
SELECT idCareer,[name], duration, [description],[status]
FROM Career 
END 

-----ESTE ES MEDIANTE IP 
IF @manejador = 'MYSQL'
BEGIN

 SELECT idCareer,name, duration, description,status
 FROM [MYSQL]...Career;
END 

END
GO

----------------------------------Employee
CREATE PROCEDURE SELECT_Employee
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN
----ESTE SERVIDOR ES LOCAL
IF @manejador = 'SQL SERVER'
BEGIN
SELECT idEmployee,[name], lastname,[mothersLastName], gender, phone, email,[address], socialSecurity, dateOfHire, idSubject,[status]
FROM Employee 
END 



END
GO



----------------------------------StudyPlan
CREATE PROCEDURE SELECT_StudyPlan
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN
----ESTE SERVIDOR ES LOCAL
IF @manejador = 'SQL SERVER'
BEGIN
SELECT idStudyPlan,objetive,starDate,finalDate,key1,idCareer,[status]
FROM StudyPlan
END 

-----ESTE ES MEDIANTE IP 


END
GO


----------------------------------Subject
CREATE PROCEDURE SELECT_Subject
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN
----ESTE SERVIDOR ES LOCAL
IF @manejador = 'SQL SERVER'
BEGIN
SELECT idSubject,[name], credit,unit, characteristic, keyMatter,[status]
FROM [Subject]
END 

-----ESTE ES MEDIANTE IP 


END
GO



----------------------------------Viatic
CREATE PROCEDURE SELECT_Viatic
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN
----ESTE SERVIDOR ES LOCAL
IF @manejador = 'SQL SERVER'
BEGIN
SELECT idViatic,place,description1,amount,idEmployee,[status]
FROM Viatic
END 


END
GO






--------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------TABLAS DE MYSQL-----------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

------------------TABLAS DE MYSQL
CREATE PROCEDURE SELECT_ActivityDetail
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN


-----ESTE ES MEDIANTE IP 
IF @manejador = 'MYSQL'
BEGIN

 SELECT idActivityDetail,activitydetailsdescription, idEvaluationDetail,idComplementaryActivity,status
 FROM [MYSQL]...ActivityDetail;
END 

END
GO

-------------------------------------------------------
CREATE PROCEDURE SELECT_EvaluationDetail
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN

-----ESTE ES MEDIANTE IP 
IF @manejador = 'MYSQL'
BEGIN

 SELECT idEvaluationDetail,assessment, criterion,status
 FROM [MYSQL]...EvaluationDetail;
END 

END
GO


------------------------------------------------------------------
CREATE PROCEDURE SELECT_Student
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN


-----ESTE ES MEDIANTE IP 
IF @manejador = 'MYSQL'
BEGIN

 SELECT idStudent,name, lastName,mothersthestName ,enrollment,birthdate,curp,phone,rfc,socialSegurity,status
 FROM [MYSQL]...Student;
END 

END
GO


---------------------------------------------------
CREATE PROCEDURE SELECT_ComplementaryActivity
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN
----

-----ESTE ES MEDIANTE IP 
IF @manejador = 'MYSQL'
BEGIN

 SELECT idComplementaryActivity,activityname, idStudent,status FROM [MYSQL]...ComplementaryActivity;
END 

END
GO

CREATE PROCEDURE SELECT_CompanyStudent
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN


-----ESTE ES MEDIANTE IP 
IF @manejador = 'MYSQL'
BEGIN

 SELECT IdCompanyStudent,date, workplace,idStudent,status FROM [MYSQL]...CompanyStudent;
END 

END
GO


--------------------------------------------
---------------------------------------------------------------------------
----------------------TABLAS DE POSTGRE-----------------------------------
------------------------------------------------------------------------------



CREATE PROCEDURE SELECT_Company
(
    @manejador AS NVARCHAR(100),
    @idUser INT 
)
AS
BEGIN
    IF @manejador = 'POSTGRESQL'
    BEGIN
        SELECT idCompany, name, email, phone ,address,identificationNumber,status-- Lista de columnas que deseas seleccionar
        FROM [POSTGRESQL]...Company;
    END 
END
GO




CREATE PROCEDURE SELECT_Agreement
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN

-----ESTE ES MEDIANTE IP 
IF @manejador = 'POSTGRESQL'
BEGIN
SELECT idAgreement,acronym,objetive,idObjetive,idTerritory,statusAgreement,status
FROM [POSTGRESQL]...Agreement;
END 

END
GO






CREATE PROCEDURE SELECT_Objetive
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN


-----ESTE ES MEDIANTE IP 
IF @manejador = 'POSTGRESQL'
BEGIN
SELECT idObjective,objetivename,status
FROM [POSTGRESQL]...Objective;
END 

END
GO







CREATE PROCEDURE SELECT_Purpose
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN


-----ESTE ES MEDIANTE IP 
IF @manejador = 'POSTGRESQL'
BEGIN
SELECT idPurpose,investigation,purposename,status
FROM [POSTGRESQL]...Purpose;
END 

END
GO















CREATE PROCEDURE SELECT_Territory
(
@manejador as nvarchar (100),
@idUser int 
)
AS
BEGIN


-----ESTE ES MEDIANTE IP 
IF @manejador = 'POSTGRESQL'
BEGIN
SELECT idTerritory,territoryname,status
FROM [POSTGRESQL]...Territory;
END 

END
GO


