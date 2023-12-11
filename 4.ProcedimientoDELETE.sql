-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
---------------///// [  - P R O C E D I M I E N T O S -- D E L E T E] /////--------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
------------------------TABLAS DE SQL SERVER---------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

CREATE PROCEDURE DELETE_Career
(
@manejador as varchar(100),
    @idCareer INT
)
AS
BEGIN
    DELETE FROM Career WHERE idCareer = @idCareer;
END
GO




CREATE PROCEDURE DELETE_Employee
(
@manejador as varchar(100),
    @idEmployee INT
)
AS
BEGIN
    DELETE FROM Employee
	WHERE idEmployee = @idEmployee;
END
GO




CREATE PROCEDURE DELETE_StudyPlan
(
@manejador as varchar(100),
    @idStudyPlan INT
)
AS
BEGIN
    DELETE FROM StudyPlan
	WHERE idStudyPlan = @idStudyPlan;
END
GO




CREATE PROCEDURE DELETE_Subject
(
@manejador as varchar(100),
    @idSubject INT
)
AS
BEGIN
    DELETE FROM Subject
	WHERE idSubject = @idSubject;
END
GO

CREATE PROCEDURE DELETE_Viatic
(
@manejador as varchar(100),
    @idViatic INT
)
AS
BEGIN
    DELETE FROM Viatic
	WHERE idViatic = @idViatic;
END
GO


----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
------------------------TABLAS DE MYSQL---------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

CREATE PROCEDURE DELETE_ActivityDetail
(
@manejador as varchar(100),
    @idActivityDetail INT
)
AS
BEGIN
    DELETE FROM [MYSQL]...ActivityDetail WHERE idActivityDetail = @idActivityDetail;
END
GO




CREATE PROCEDURE DELETE_CompanyStudent
(
@manejador as varchar(100),
    @idCompanyStudent INT
)
AS
BEGIN
    DELETE FROM [MYSQL]...CompanyStudent WHERE idCompanyStudent = @idCompanyStudent;
END
GO


CREATE PROCEDURE DELETE_ComplementaryActivity
(
@manejador as varchar(100),
    @idComplementaryActivity INT
)
AS
BEGIN
    DELETE FROM [MYSQL]...ComplementaryActivity WHERE idComplementaryActivity = @idComplementaryActivity;
END
GO


CREATE PROCEDURE DELETE_EvaluationDetail
(
@manejador as varchar(100),
    @idEvaluationDetail INT
)
AS
BEGIN
    DELETE FROM [MYSQL]...EvaluationDetail WHERE idEvaluationDetail = @idEvaluationDetail;
END
GO




CREATE PROCEDURE DELETE_Student
(
@manejador as varchar(100),
    @idStudent INT
)
AS
BEGIN
    DELETE FROM [MYSQL]...Student WHERE idStudent = @idStudent;
END
GO



----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
------------------------TABLAS DE POSTRGRE---------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------



CREATE PROCEDURE DELETE_Agreement
(
@manejador as varchar(100),
    @idAgreement INT
)
AS
BEGIN
    DELETE FROM [POSTGRESQL]...Agreement WHERE idAgreement = @idAgreement;
END
GO



CREATE PROCEDURE DELETE_Company
(
@manejador as varchar(100),
    @idCompany INT
)
AS
BEGIN
    DELETE FROM [POSTGRESQL]...Company WHERE idCompany = @idCompany;
END
GO



CREATE PROCEDURE DELETE_Objective
(
@manejador as varchar(100),
    @idObjective INT
)
AS
BEGIN
    DELETE FROM [POSTGRESQL]...Objective WHERE idObjective = @idObjective;
END
GO


CREATE PROCEDURE DELETE_Purpose
(
@manejador as varchar(100),
    @idPurpose INT
)
AS
BEGIN
    DELETE FROM [POSTGRESQL]...Purpose WHERE idPurpose = @idPurpose;
END
GO


CREATE PROCEDURE DELETE_Territory
(
@manejador as varchar(100),
    @idTerritory INT
)
AS
BEGIN
    DELETE FROM [POSTGRESQL]...Territory WHERE idTerritory = @idTerritory;
END
GO