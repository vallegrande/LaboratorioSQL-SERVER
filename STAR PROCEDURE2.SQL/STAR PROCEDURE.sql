use dbLibrary

/* visualizar las tablas de la base de datos activas */ 
exec sp_tables

/* visualizar los registros de la tabla Genero*/

select  *from Genero

/* crear un sp que permita listar los registros de la tabla genero*/
create procedure sp_ListGen
 AS
     BEGIN  
        SELECT * from Genero
        END
  go 
  /* ejecutar store procedure de listado de genero */
  EXEC sp_ListGen
  GO

  create procedure sp_Cliente
  AS
    BEGIN
        SELECT * from Cliente
        END
    /* ejecutar store procedure que permita listar los registros de la tabla cliente*/

    GO
    EXEC sp_Cliente

    /* crear un sp que permita listar los clientes ordenados por la columna sexo de forma
    ascendente*/

    create PROCEDURE sp_liscliensexo
    AS 
        Begin 
            Select * from Cliente
            order by cliente.sexoCliente ASC

            END
            GO

            /* Modificar el Sp anterior de tal forma que se permita mostrar el listado de clientes de acuerdo a la letra del sexo indicado*/
            
            ALTER PROCEDURE sp_liscliensexo
                @Sexo varchar(1)

            AS
                BEGIN
                SELECT * 
                from Cliente
               where cliente.sexoCliente = @Sexo
            go

            /* Ejecutar sp que muestre los clientes del sexo femenino*/
              EXCEC sp_liscliensexo @Sexo = F
go

/*mODIFICAR EL SP DE TAL FORMA QUE SE VEA C0MPLETO EL NOMBRE DEL SEXO */
ALTER PROCEDURE sp_liscliensexo
   @sexo VARCHAR(1)
   AS
   BEGIN 
   CONCAT(cliente.ApeCliente, ',', cliente.nomCliente) as Cliente
   CASE 
   SELECT Cliente.sexoCliente = 'F' THEN 'MASCULINO'
      SELECT Cliente.sexoCliente = 'M' THEN 'FEMENINO'


/* Crear un SP que permita ingresar registros a la tabla genero*/
CREATE PROCEDURE sp_AddGen
    @codigo VARCHAR(4),
    @nombre VARCHAR(MAX)
    AS 
        BEGIN    INSERT INTO Genero
        (idGenero, nomGenero)
        VALUES
            (@Codigo, @nombre)
        END
        GO
        /*Agregar el genero comedia */
        EXEC sp_AddGen @codigo = 5, @nombre = 'Comedia'
        go

        /* Verificar que se haya agregado los registros*/
        EXEC sp_AddGen @codigo = 6, @nombre = 'INFANTIL'
        EXEC sp_AddGen @codigo = 7, @nombre = 'OTRA LIBRERIA'
         EXEC sp_AddGen @codigo = 8, @nombre = 'DRAMA'
         GO
         /* VERIFICAMOS QUE SE AYA AGREGADO LOS REGISTROS*/
         SELECT * FROM Genero
         GO

         /* Elaborar un SP que te permita validar el codigo de genero antes de ingresar un registro*/

         create procedure sp_validAddReg
         @Codigo INT,
         @nombre varchar(MAX)
         AS 
            BEGIN 
                IF(SELECT GENERO.idGenero
                    FROM Genero
                    Where Genero.idGenero = @Codigo) is not NULL
                    Select 'El codigo ya existe' AS 'Resuelto'
                    ELSE
                        INSERT Into Genero
                        (idGenero,nomGenero)
                        VALUES
                       (@Codigo,@nombre)
                        END
                        go

                        /*Validar el ingresode genero con el codigo 2 */
                        EXEC sp_validAddReg @codigo = 2, @nombre = 'Series'
                        EXEC sp_validAddReg @codigo = 9, @nombre = 'Series'
                        go