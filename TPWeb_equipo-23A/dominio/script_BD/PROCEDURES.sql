CREATE PROCEDURE SP_ListarArticulos
AS
BEGIN
    -- Seleccionamos los datos b�sicos de los art�culos
    SELECT 
        A.Id, 
        A.Codigo,
        A.Nombre, 
        A.Descripcion,
        A.Precio,
        M.Descripcion AS Marca, -- Usamos Alias para la descripci�n de la marca
        C.Descripcion AS Categoria -- Usamos Alias para la descripci�n de la categor�a
    FROM ARTICULOS A
    LEFT JOIN MARCAS M ON M.Id = A.IdMarca
    LEFT JOIN CATEGORIAS C ON C.Id = A.IdCategoria
    -- NOTA: Si hubiera un campo 'Activo' en ARTICULOS, se agregar�a 'WHERE Activo = 1'
END
GO

-- B�squeda y Validaci�n de Voucher
CREATE PROCEDURE SP_BuscarVoucher
    @Codigo VARCHAR(50)
AS
BEGIN
    SELECT 
        CodigoVoucher, 
        IdCliente,          -- NULL si no est� canjeado
        FechaCanje,         -- NULL si no est� canjeado
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