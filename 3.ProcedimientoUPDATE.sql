-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
---------------///// [  - P R O C E D I M I E N T O S -- U P D A T E] /////--------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
------------------------TABLAS DE SQL SERVER---------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

CREATE PROCEDURE UPDATE_Career
(
@manejador as varchar (100),

@idCareer int,
@name AS VARCHAR (50),
@duration as varchar(20),
@description as varchar(20),
@status as bit
)
AS
BEGIN

IF @manejador = 'SQL SERVER'
BEGIN
UPDATE Career 
SET [name] =@name,duration =@duration,[description]=@description,[status]=@status ,idUserCreate=1,dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()
WHERE idCareer = @idCareer
END

END
GO


CREATE PROCEDURE UPDATE_Employee
(
@manejador as varchar (100),

@idEmployee  as int,
@name AS VARCHAR (50) ,
@lastname AS VARCHAR (50),
@mothersLastName AS VARCHAR (50),
@gender AS VARCHAR (50),
@phone AS CHAR (10),
@email AS VARCHAR (50),
@address AS VARCHAR (50), 
@socialSecurity AS CHAR (11),
@dateOfHire AS date ,
@idSubject as int ,
@status as bit
)
AS
BEGIN

IF @manejador = 'SQL SERVER'
BEGIN
UPDATE Employee 
SET [name] =@name,lastname =@lastname,mothersLastName=@mothersLastName,gender=@gender,phone =@phone,email=@email,[address]=@address,socialSecurity =@socialSecurity,dateOfHire=@dateOfHire,idSubject=@idSubject,[status]=@status,idUserCreate=1,dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()
WHERE idEmployee = @idEmployee
END

END
GO


CREATE PROCEDURE UPDATE_StudyPlan
(
@manejador as varchar (100),

@idStudyPlan  as int,
@objetive AS VARCHAR (50) ,
@starDate AS date,
@finalDate AS date,
@key1 AS VARCHAR (50),
@status as bit
)
AS
BEGIN

IF @manejador = 'SQL SERVER'
BEGIN
UPDATE StudyPlan SET objetive =@objetive,starDate =@starDate,finalDate=@finalDate,key1 =@key1,[status]=@status,idUserCreate=1,creationdate=GETDATE(),IdUserModify=1,modified =GETDATE()

WHERE idStudyPlan = @idStudyPlan
END


END
GO







CREATE PROCEDURE UPDATE_Subject
(
@manejador as varchar (100),

@idSubject  as int,
@name AS VARCHAR (50) ,
@credit AS VARCHAR (50) ,
@unit AS VARCHAR (50) ,
@characteristic AS VARCHAR (50),
@keyMatter AS VARCHAR (50) ,
@status as bit
)
AS
BEGIN

IF @manejador = 'SQL SERVER'
BEGIN
UPDATE [Subject] SET  [name] =@name,credit =@credit,unit=@unit,characteristic =@characteristic,keyMatter=@keyMatter,[status]=@status ,idUserCreate=1,dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()

WHERE idSubject = @idSubject
END


END
GO






CREATE PROCEDURE UPDATE_Viatic
(
@manejador as varchar (100),

@idViatic  as int,
@place AS VARCHAR (200) ,
@description1 AS VARCHAR (250) ,
@amount AS DECIMAL (10,2) ,
@idEmployee AS INT,
@status as bit
)
AS
BEGIN

IF @manejador = 'SQL SERVER'
BEGIN
UPDATE Viatic SET  place =@place,description1 =@description1,amount=@amount,idEmployee =@idEmployee,[status]=@status ,idUserCreate=1,creationdate=GETDATE(),IdUserModify=1,modified =GETDATE()
 
WHERE idViatic = @idViatic
END


END
GO

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
------------------------TABLAS DE MYSQL---------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
CREATE PROCEDURE UPDATE_Objective
(
@manejador as varchar (100),
@idObjective  int,
@objetivename VARCHAR(50) ,
 @status as bit

)
AS
BEGIN

IF @manejador = 'POSTGRESQL'
BEGIN
UPDATE Objective  
SET objetivename =@objetivename,[status]=@status ,idUserCreate=1,
dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()
WHERE idObjective  = @idObjective 
END

END
GO



CREATE PROCEDURE UPDATE_Territory 
(
@manejador as varchar (100),
@idTerritory   int,
@territoryname VARCHAR(50) ,
 @status as bit

)
AS
BEGIN

IF @manejador = 'POSTGRESQL'
BEGIN
UPDATE Territory   
SET territoryname =@territoryname,[status]=@status ,idUserCreate=1,
dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()
WHERE idTerritory   = @idTerritory 
END

END
GO




CREATE PROCEDURE UPDATE_Company 
(
@manejador as varchar (100),
@idCompany   int,
@name VARCHAR(50) ,
    @email VARCHAR(50) ,
    @phone CHAR(10) ,
    @address VARCHAR(50) ,
    @identificationNumber VARCHAR(50) ,

 @status as bit

)
AS
BEGIN

IF @manejador = 'POSTGRESQL'
BEGIN
UPDATE Company   
SET name =@name,email =@email,phone =@phone,address =@address,identificationNumber =@identificationNumber,[status]=@status ,idUserCreate=1,
dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()
WHERE idCompany   = @idCompany
END

END
GO


CREATE PROCEDURE UPDATE_Purpose  
(
@manejador as varchar (100),
@idPurpose  int,
@investigation VARCHAR(50),
    @purposename VARCHAR(50) ,


 @status as bit

)
AS
BEGIN

IF @manejador = 'POSTGRESQL'
BEGIN
UPDATE Purpose    
SET investigation =@investigation,purposename =@purposename,[status]=@status ,idUserCreate=1,
dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()
WHERE idPurpose   = @idPurpose 
END

END
GO

CREATE PROCEDURE UPDATE_Agreement
(
@manejador as varchar (100),
@idAgreement int,
@acronym VARCHAR(50) ,
    @objetive VARCHAR(25) ,
    @idObjetive INT ,
    @idTerritory INT ,
   @statusAgreement VARCHAR(50) ,
  @status as bit

)
AS
BEGIN

IF @manejador = 'POSTGRESQL'
BEGIN
UPDATE Agreement 
SET acronym =@acronym,objetive =@objetive,idObjetive=@idObjetive,idTerritory =@idTerritory,statusAgreement=@statusAgreement,[status]=@status ,idUserCreate=1,
dateCreate=GETDATE(),idUserModified=1,dateModified =GETDATE()
WHERE idAgreement = @idAgreement
END

END
GO