-- 1 Listado con la cantidad de cursos.
select COUNT(*) as 'cantidad de cursos'from Cursos

-- 2 Listado con la cantidad de usuarios.
select COUNT(*) as 'Cantidad de usuarios' from Usuarios 

-- 3 Listado con el promedio de costo de certificación de los cursos.
select avg(CostoCertificacion) as 'Promedio costo certificacion'from Cursos

-- 4 Listado con el promedio general de calificación de reseñas.
SELECT AVG(Puntaje) as 'Promedio puntaje resenias' from Reseñas

-- 5 Listado con la fecha de estreno de curso más antigua.
SELECT MIN(Estreno) from Cursos

-- 6 Listado con el costo de certificación menos costoso.
SELECT MIN(CostoCertificacion) from Cursos

-- 7 Listado con el costo total de todos los cursos.
SELECT SUM(CostoCertificacion+CostoCurso) from Cursos

-- 8 Listado con la suma total de todos los pagos.
SELECT SUM(Importe) from Pagos

-- 9 Listado con la cantidad de cursos de nivel principiante.
SELECT COUNT(IDNivel) FROM Cursos where IDNivel =5

-- 10 Listado con la suma total de todos los pagos realizados en 2020.
SELECT SUM(Importe) from Pagos WHERE YEAR(Fecha)=2020

-- 11 Listado con la cantidad de usuarios que son instructores.
SELECT COUNT(distinct IdUsuario) FROM Instructores_x_Curso

-- 12 Listado con la cantidad de usuarios distintos que se hayan certificado.
SELECT COUNT(distinct u.ID) from Usuarios u
INNER JOIN  Inscripciones i on u.ID= i.IDUsuario
INNER JOIN Certificaciones c on i.ID = c.IDInscripcion

-- 13 Listado con el nombre del país y la cantidad de usuarios de cada país.
SELECT p.Nombre as Pais, COUNT(u.ID) as 'Cantidad de usuarios' from Usuarios u 
inner JOIN Datos_Personales d on u.ID= d.ID
INNER JOIN Localidades l on d.IDLocalidad = l.ID
INNER JOIN Paises p on l.IDPais= p.ID
GROUP BY p.Nombre

-- 14 Listado con el apellido y nombres del usuario y el importe más costoso abonado como pago. Sólo listar aquellos que hayan abonado más de $7500.
SELECT d.Apellidos+ ',' + d.Nombres as 'Nombre y Apellido', max(p.Importe) as 'Importe de pago mas costoso' from Datos_Personales d 
INNER JOIN Inscripciones i on d.ID = i.IDUsuario
INNER JOIN Pagos p on i.ID = p.IDInscripcion
GROUP BY d.Apellidos+','+ d.Nombres
HAVING MAX(p.Importe) > 7500

-- 15 Listado con el apellido y nombres de usuario de cada usuario y el importe más costoso del curso al cual se haya inscripto. Si hay usuarios sin inscripciones deben figurar en el listado de todas maneras.
select d.Apellidos+','+d.Nombres as 'Apellido y Nombre', MAX(c.CostoCurso) as 'Mayor costo de curso inscripto' from Datos_Personales d
LEFT JOIN Inscripciones i on d.ID= i.IDUsuario
left JOIN Cursos c on i.IDCurso= c.ID
GROUP BY d.Apellidos+','+d.Nombres

-- 16 Listado con el nombre del curso, nombre del nivel, cantidad total de clases y duración total del curso en minutos.
select c.Nombre Curso, n.Nombre Nivel, COUNT(cl.ID) as 'Cantidad Total de Clases', sum(cl.Duracion) as'Duracion total curso' from Cursos c
INNER JOIN  Clases cl on c.ID = cl.IDCurso
INNER JOIN Niveles n on c.IDNivel = n.ID
GROUP BY c.Nombre, n.Nombre  

-- 17 Listado con el nombre del curso y cantidad de contenidos registrados. Sólo listar aquellos cursos que tengan más de 10 contenidos registrados.
select c.Nombre Curso, COUNT(cont.ID) as 'Cantidad de contenidos' from Cursos c
INNER JOIN Clases cl on c.ID = cl.IDCurso
INNER JOIN Contenidos cont on cl.ID = cont.IDClase
GROUP by c.Nombre HAVING COUNT(cont.ID) >10

-- 18 Listado con nombre del curso, nombre del idioma y cantidad de tipos de idiomas.
select c.Nombre , i.Nombre, COUNT(ic.IDFormatoIdioma) as 'Cantidad tipos de idiomas'from Cursos c 
INNER JOIN Idiomas_x_Curso ic on c.ID = ic.IDCurso
INNER JOIN Idiomas i on ic.IDIdioma = i.ID
GROUP BY i.Nombre, c.Nombre
ORDER by c.Nombre, i.Nombre

-- 19 Listado con el nombre del curso y cantidad de idiomas distintos disponibles.
SELECT c.Nombre, COUNT(distinct ic.IDIdioma) as 'Cantidad de idiomas' from Cursos c
INNER JOIN Idiomas_x_Curso ic on c.ID = ic.IDCurso
GROUP by c.Nombre 

-- 20 Listado de categorías de curso y cantidad de cursos asociadas a cada categoría. Sólo mostrar las categorías con más de 5 cursos.
select cat.Nombre, COUNT(cxc.IDCurso) as 'Cantidad cursos asociados' from Categorias cat 
INNER JOIN Categorias_x_Curso cxc on cat.ID = cxc.IDCategoria
GROUP by cat.Nombre HAVING COUNT(cxc.IDCurso) > 5

-- 21 Listado con tipos de contenido y la cantidad de contenidos asociados a cada tipo. Mostrar también aquellos tipos que no hayan registrado contenidos con cantidad 0.
select tc.Nombre, COUNT(con.IDTipo)as 'Cantidad de contenidos' from TiposContenido tc
LEFT JOIN Contenidos con on tc.ID = con.IDTipo
GROUP by tc.Nombre

-- 22 Listado con Nombre del curso, nivel, año de estreno y el total recaudado en concepto de inscripciones. Listar también aquellos cursos sin inscripciones con total igual a $0.
select c.nombre as 'Nombre Curso', c.IdNivel as Nivel, c.Estreno as 'Fecha Estreno', isNull(SUM(i.Costo),0) as 'Total Recaudado' from Cursos c
LEFT JOIN Inscripciones i on c.ID = i.IDCurso
GROUP by c.Nombre, c.IDNivel, c.Estreno

-- 23 Listado con Nombre del curso, costo de cursado y certificación y cantidad de usuarios distintos inscriptos cuyo costo de cursado sea menor a $10000 y cuya cantidad de usuarios inscriptos sea menor a 5. Listar también aquellos cursos sin inscripciones con cantidad 0.
select c.Nombre as 'Nombre Curso', c.costoCurso as 'Costo Cursado', c.CostoCertificacion as 'Costo Certificacion', isNull(COUNT(i.IdUsuario),0) as 'Usuarios inscriptos' FROM Cursos c 
left JOIN Inscripciones i on c.ID = i.IDCurso
WHERE c.CostoCurso <10000
GROUP BY c.Nombre, c.CostoCurso, c.CostoCertificacion
HAVING COUNT(i.IDUsuario)<5 or COUNT(i.IDUsuario) is null


-- 24 Listado con Nombre del curso, fecha de estreno y nombre del nivel del curso que más recaudó en concepto de certificaciones.
select top 1 c.nombre, c.estreno, n.nombre from cursos c 
left JOIN Niveles n on c.IDNivel = n.ID
left JOIN Inscripciones i on c.ID = i.IDCurso
INNER JOIN Certificaciones cer on i.ID = cer.IDInscripcion
GROUP BY c.Nombre, c.Estreno, n.Nombre
ORDER BY SUM(cer.Costo) DESC

-- 25 Listado con Nombre del idioma del idioma más utilizado como subtítulo.

-- 26 Listado con Nombre del curso y promedio de puntaje de reseñas apropiadas.

-- 27 Listado con Nombre de usuario y la cantidad de reseñas inapropiadas que registró.

-- 28 Listado con Nombre del curso, nombre y apellidos de usuarios y la cantidad de veces que dicho usuario realizó dicho curso. No mostrar cursos y usuarios que contabilicen cero.

-- 29 Listado con Apellidos y nombres, mail y duración total en concepto de clases de cursos a los que se haya inscripto. Sólo listar información de aquellos registros cuya duración total supere los 400 minutos.

-- 30 Listado con nombre del curso y recaudación total. La recaudación total consiste en la sumatoria de costos de inscripción y de certificación. Listarlos ordenados de mayor a menor por recaudación.


