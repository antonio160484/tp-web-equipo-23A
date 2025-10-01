CREATE PROCEDURE SP_ListarArticulos
AS
BEGIN
    -- Seleccionamos los datos básicos de los artículos
    SELECT 
        A.Id, 
        A.Codigo,
        A.Nombre, 
        A.Descripcion,
        A.Precio,
        M.Descripcion AS Marca, -- Usamos Alias para la descripción de la marca
        C.Descripcion AS Categoria -- Usamos Alias para la descripción de la categoría
    FROM ARTICULOS A
    LEFT JOIN MARCAS M ON M.Id = A.IdMarca
    LEFT JOIN CATEGORIAS C ON C.Id = A.IdCategoria
    -- NOTA: Si hubiera un campo 'Activo' en ARTICULOS, se agregaría 'WHERE Activo = 1'
END
GO

-- Búsqueda y Validación de Voucher
CREATE PROCEDURE SP_BuscarVoucher
    @Codigo VARCHAR(50)
AS
BEGIN
    SELECT 
        CodigoVoucher, 
        IdCliente,          -- NULL si no está canjeado
        FechaCanje,         -- NULL si no está canjeado
        IdArticulo 
    FROM Vouchers
    WHERE CodigoVoucher = @Codigo
END
GO

-- Registro de un nuevo Cliente
CREATE PROCEDURE SP_RegistrarCliente
    @Documento VARCHAR(50),
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Email VARCHAR(50),
    @Direccion VARCHAR(50),
    @Ciudad VARCHAR(50),
    @CP INT
AS
BEGIN
    INSERT INTO Clientes (Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP)
    VALUES (@Documento, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP);
    
    -- Devolvemos el ID generado por IDENTITY
    SELECT CAST(SCOPE_IDENTITY() AS INT); 
END
GO


CREATE PROCEDURE SP_ListarImagenesPorArticulo
    @idArticulo INT
AS
BEGIN
    SELECT 
        I.Id, 
        I.IdArticulo, 
        I.ImagenUrl 
    FROM IMAGENES I 
    WHERE I.IdArticulo = @idArticulo
END
GO

CREATE PROCEDURE SP_RegistrarCliente
    @Documento VARCHAR(50),
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Email VARCHAR(50),
    @Direccion VARCHAR(50),
    @Ciudad VARCHAR(50),
    @CP INT -- Ajusta el tipo de dato si en tu tabla CP es VARCHAR
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Insertar el nuevo cliente con los datos proporcionados
    INSERT INTO Clientes (Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP)
    VALUES (@Documento, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP);

    -- 2. Devolver el ID autogenerado del registro que acabamos de insertar
    SELECT SCOPE_IDENTITY() AS NuevoId; 
END
GO

CREATE PROCEDURE SP_BuscarCliente
    @Documento VARCHAR(50)
AS
BEGIN
    SELECT 
        Id, Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP
    FROM Clientes
    WHERE Documento = @Documento;
END
GO

IF OBJECT_ID('SP_ModificarCliente', 'P') IS NOT NULL
    DROP PROCEDURE SP_ModificarCliente;
GO

CREATE PROCEDURE SP_ModificarCliente
    @Id INT,
    @Documento VARCHAR(50),
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Email VARCHAR(50),
    @Direccion VARCHAR(50),
    @Ciudad VARCHAR(50),
    @CP INT -- Ajusta el tipo de dato si es necesario
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Clientes
    SET 
        Documento = @Documento, 
        Nombre = @Nombre, 
        Apellido = @Apellido, 
        Email = @Email, 
        Direccion = @Direccion, 
        Ciudad = @Ciudad, 
        CP = @CP
    WHERE 
        Id = @Id;

END
GO