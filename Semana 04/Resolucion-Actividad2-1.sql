-- 1 Listado de todos los idiomas.
-- --select* from Idiomas

-- 2 Listado de todos los cursos.
--select * from Cursos

-- 3 Listado con nombre, costo de inscripción(costo de curso), costo de certificación y fecha de estreno de todos los cursos.
--SELECT Nombre,CostoCurso, CostoCertificacion,FechaEstreno from Cursos

-- 4 Listado con ID, nombre, costo de inscripción y ID de nivel de todos los cursos cuyo costo de certificación sea menor de $5000.
--select ID,Nombre,CostoCurso
--from Cursos
--where CostoCertificacion < 5000

-- 5 Listado con ID, nombre, costo de inscripción y ID de nivel de todos los cursos cuyo costo de certificación sea mayor a $1200.
-- select ID,Nombre,CostoCurso, IDNivel
-- from Cursos
-- where CostoCertificacion > 1200

-- 6 Listado con nombre, número y duración de todas las clases del curso con ID número 6.
-- SELECT Nombre,Numero,Duracion 
-- FROM Clases
-- WHERE IDCurso=6

-- 7 Listado con nombre, número y duración de todas las clases del curso con ID número 10.
-- SELECT Nombre,Numero,Duracion 
-- FROM Clases
-- WHERE IDCurso=10

-- 8 Listado con nombre y duración de todas las clases del curso con ID número 4. Ordenado por duración de mayor a menor.
-- SELECT Nombre, Duracion
-- FROM Clases
-- where IDCurso =4
-- ORDER BY Duracion DESC

-- 9 Listado de cursos con nombre, fecha de estreno, costo del curso, costo de certificación ordenados por fecha de estreno de manera creciente.
-- SELECT Nombre, FechaEstreno, CostoCurso, CostoCertificacion 
-- FROM Cursos
-- ORDER BY FechaEstreno ASC

-- 10 Listado con nombre, fecha de estreno y costo del curso de todos aquellos cuyo ID de nivel sea 1, 5, 9 o 10.
-- SELECT Nombre, FechaEstreno, CostoCurso
-- FROM Cursos
-- WHERE IDNivel in (1,5,9,10)

-- 11 Listado con nombre, fecha de estreno y costo de cursado de los tres cursos más caros de certificar.
-- SELECT TOP(3) Nombre, FechaEstreno, CostoCurso
-- FROM Cursos
-- ORDER BY CostoCertificacion DESC 

-- 12 Listado con nombre, duración y número de todas las clases de los cursos con ID 2, 5 y 7. Ordenados por ID de curso ascendente y luego por número de clase ascendente.
-- SELECT Nombre, Duracion, Numero
-- FROM Clases
-- WHERE IDCurso in (2,5,7)
-- ORDER BY IDCurso ASC, Numero ASC

-- 13 Listado con nombre y fecha de estreno de todos los cursos cuya fecha de estreno haya sido en el primer semestre del año 2019
-- SELECT Nombre, FechaEstreno
-- FROM Cursos
-- WHERE YEAR(FechaEstreno) = 2019 and MONTH(FechaEstreno) <6

-- 14 Listado de cursos cuya fecha de estreno haya sido en el año 2020.
-- SELECT *
-- FROM Cursos
-- WHERE YEAR(FechaEstreno) = 2020

-- 15 Listado de cursos cuyo mes de estreno haya sido entre el 1 y el 4.
-- SELECT *
-- FROM Cursos
-- WHERE MONTH(FechaEstreno) BETWEEN 1 and 4

-- 16 Listado de clases cuya duración se encuentre entre 15 y 90 minutos.
-- SELECT *
-- FROM Clases
-- WHERE Duracion BETWEEN 15 and 90

-- 17 Listado de contenidos cuyo tamaño supere los 5000MB y sean de tipo 4 o sean menores a 400 MB y sean de tipo 1.
-- SELECT *
-- FROM Contenidos
-- WHERE (Tamaño > 5000 and IDTipoContenido = 4) or (Tamaño <400 and IDTipoContenido=1)

-- 18 Listado de cursos que no posean ID de nivel.
-- SELECT * 
-- FROM Cursos
-- WHERE IDNivel is NULL


-- 19 Listado de cursos cuyo costo de certificación corresponda al 20% o más del costo de curso.
-- SELECT *
-- FROM Cursos
-- WHERE CostoCertificacion >= CostoCurso * 0.2

--20 Listado de costos de cursado de todos los cursos sin repetir y ordenados de mayor a menor.
-- SELECT DISTINCT CostoCurso
-- FROM Cursos
-- ORDER BY CostoCurso DESC