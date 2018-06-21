



create view vwDatosLibro
AS
 select libro.tituloLibro, Libro.Autor_idAutor, Autor.nomAutor, Autor.apeAutor
  from Libro
  INNER JOIN Autor
  on Libro.Autor_idAutor = Autor.idAutor
go
  SELECT * from vwDatosLibro
go
  /*Listar el nombre del autor, el libro, genero y pais respectivo  en una vista llamada vwDatosAutor*/
 create VIEW vwGenLib
As
SELECT Genero.nomGenero as 'genero', count(Libro.Genero_idGenero) AS 'total'
FROM Libro  
        INNER JOIN Genero
        ON libro.Genero_idGenero = Genero.idGenero
        GROUP BY Genero.nomGenero
        go
 
 SELECT * from vwGenLib
 go
 /* vista qiue liste la cantidad de los libros por pais */
 create view vwpais
 as
 select pais.nomPais as 'Pais', count(Libro.Pais_idPais) as 'total'
 from Libro
 INNER JOIN Pais
 on Libro.Pais_idPais = Pais.idPais
 GROUP BY Pais.nomPais
 go


select * from vwpais
go
 SELECT name from sys.views
/* que me muestre el nombre del bibliotecario, titulo de libro y fecha de salida del libro*/

SELECT Prestamos.fecsalPrestamo, 
CONCAT(Bibliotecario.apeBibliotecario,',', Bibliotecario.nomBibliotecario) As 'Bibliotecario'
FROM Prestamos
INNER JOIN Bibliotecario
ON  Prestamos.Bibliotecario_idBibliotecario = Bibliotecario_idBibliotecario
go



 