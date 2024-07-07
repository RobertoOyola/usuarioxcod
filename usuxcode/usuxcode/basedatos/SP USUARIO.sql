

CREATE PROCEDURE SP_GET_USUARIO
AS
BEGIN
SELECT * FROM [CODIGOCLIENTE].[dbo].[USUARIOS]

END
GO



CREATE PROCEDURE SP_GET_USUARIOU
	@PI_ID_USUARIO INT
AS
BEGIN
SELECT * FROM [CODIGOCLIENTE].[dbo].[USUARIOS]
WHERE ID_USUARIO = @PI_ID_USUARIO
END
GO



CREATE PROCEDURE SP_INT_USUARIO
	@PV_NOMBRES VARCHAR(100),
	@PV_APELLIDOS VARCHAR(100),
	@PV_MAIL VARCHAR(100),
	@PD_FECHA_NACIMIENTO DATETIME,
	@PV_CONTRASENA VARCHAR(100),
	@PI_USUARIO_CREACION INT
AS
BEGIN
INSERT INTO [CODIGOCLIENTE].[dbo].[USUARIOS] (NOMBRES, APELLIDOS, MAIL, FECHA_NACIMIENTO, CONTRASENA, ESTADO, USUARIO_CREACION, FECHA_CREACION)
VALUES (@PV_NOMBRES, @PV_APELLIDOS, @PV_MAIL, @PD_FECHA_NACIMIENTO, @PV_CONTRASENA, 'A', @PI_USUARIO_CREACION, GETDATE())
END
GO



CREATE PROCEDURE SP_DEL_USUARIO
	@PI_ID_USUARIO INT,
	@PI_USUARIO_MODIFICACION INT
AS
BEGIN
	UPDATE [CODIGOCLIENTE].[dbo].[USUARIOS]
    SET 
        ESTADO = 'I',
        USUARIO_MODIFICACION = @PI_USUARIO_MODIFICACION,
        FECHA_MODIFICACION = GETDATE()

    WHERE ID_USUARIO = @PI_ID_USUARIO;
END
GO

CREATE PROCEDURE SP_UPD_USUARIO
	@PI_ID_USUARIO INT,
	@PV_NOMBRES VARCHAR(100),
	@PV_APELLIDOS VARCHAR(100),
	@PV_MAIL VARCHAR(100),
	@PD_FECHA_NACIMIENTO DATETIME,
	@PV_CONTRASENA VARCHAR(100),
	@PI_ID_USUARIO_MODIFICACION INT
AS
BEGIN
	UPDATE [CODIGOCLIENTE].[dbo].[USUARIOS]
    SET 
        NOMBRES = @PV_NOMBRES,
        APELLIDOS = @PV_APELLIDOS,
        FECHA_NACIMIENTO = @PD_FECHA_NACIMIENTO,
		CONTRASENA = @PV_CONTRASENA,
		USUARIO_MODIFICACION = @PI_ID_USUARIO_MODIFICACION,
		FECHA_MODIFICACION = GETDATE()

    WHERE ID_USUARIO = @PI_ID_USUARIO;
END
GO