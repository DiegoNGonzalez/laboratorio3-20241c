use Univ_Angel
-- 1 Listado con nombre de usuario de todos los usuarios y sus respectivos nombres y apellidos.
-- SELECT u.ID,u.NombreUsuario, d.Nombres as Nombres, d.Apellidos as Apellidos
-- from Usuarios u 
-- INNER JOIN Datos_Personales d on u.ID = d.ID

-- 2 Listado con apellidos, nombres, fecha de nacimiento y nombre del país de nacimiento. 
-- SELECT d.Apellidos, d.Nombres, d.Nacimiento, p.Nombre as Pais
-- FROM Datos_Personales d 
-- INNER JOIN Localidades l ON d.IDLocalidad = l.ID 
-- INNER JOIN Paises p on l.IDPais = p.ID

-- 3 Listado con nombre de usuario, apellidos, nombres, email o celular de todos los usuarios que vivan en una domicilio comience con vocal. 
-- NOTA: Si no tiene email, obtener el celular.
-- SELECT u.NombreUsuario, d.Apellidos, d.Nombres,
-- CASE 
--     WHEN d.Email is not null THEN email
--     ELSE d.Celular
-- END as Contacto
-- FROM Usuarios u
-- INNER JOIN Datos_Personales d ON u.ID = d.ID
-- WHERE d.Domicilio like '[a,e,i,o,u]%'

-- 4 Listado con nombre de usuario, apellidos, nombres, email o celular o domicilio como 'Información de contacto'.
-- NOTA: Si no tiene email, obtener el celular y si no posee celular obtener el domicilio.
-- SELECT u.NombreUsuario, d.Apellidos, d.Nombres,
-- CASE 
--     WHEN d.Email is not null THEN email
--     WHEN d.Celular is not null THEN celular
--     ELSE d.Domicilio
-- END as 'Informacion de Contacto'
-- FROM Usuarios u
-- INNER JOIN Datos_Personales d ON u.ID = d.ID

--5 Listado con apellido y nombres, nombre del curso y costo de la inscripción de todos los usuarios inscriptos a cursos.
-- NOTA: No deben figurar los usuarios que no se inscribieron a ningún curso.
-- SELECT d.Apellidos, d.Nombres, c.Nombre as 'Nombre Curso', c.CostoCurso as 'Costo de Inscripción'
-- FROM Datos_Personales d 
-- INNER JOIN Inscripciones i on d.ID = I.IDUsuario
-- INNER JOIN Cursos c on  c.ID = i.IDCurso

-- 6 Listado con nombre de curso, nombre de usuario y mail de todos los inscriptos a cursos que se hayan estrenado en el año 2020.
-- SELECT c.Nombre, u.NombreUsuario, d.Email
-- FROM Cursos c
-- INNER JOIN Inscripciones i on c.ID = i.IDCurso
-- INNER JOIN Usuarios u on i.IDUsuario = u.ID
-- INNER JOIN Datos_Personales d on u.ID = d.ID
-- WHERE YEAR(Estreno) = 2020

-- 7 Listado con nombre de curso, nombre de usuario, apellidos y nombres, fecha de inscripción, costo de inscripción, fecha de pago e importe de pago.
-- Sólo listar información de aquellos que hayan pagado.
-- select c.Nombre as 'Nombre del curso', u.NombreUsuario as 'Usuario', d.Apellidos, d.Nombres, i.Fecha as 'Fecha de inscripcion', i.Costo as 'Costo de inscripcion', p.Fecha as 'Fecha de pago', p.Importe as 'Importe de pago'
-- FROM Cursos c 
-- INNER JOIN Inscripciones i on c.ID = i.IDCurso
-- INNER JOIN Usuarios u on i.IDUsuario = u.ID
-- INNER JOIN Datos_Personales d on u.ID = d.ID
-- INNER JOIN Pagos p on i.ID = p. IDInscripcion

-- 8 Listado con nombre y apellidos, género, fecha de nacimiento, mail, nombre del curso y fecha de certificación de todos aquellos usuarios que se hayan certificado.
-- SELECT d.Nombres, d.Apellidos, d.Nacimiento, d.Email, cu.Nombre as 'Nombre del curso', c.Fecha as 'Fecha de certificacion'
-- FROM Datos_Personales d 
-- INNER JOIN Inscripciones i on d.ID = i.IDUsuario
-- INNER JOIN Cursos cu on cu.ID = i.IDCurso
-- INNER JOIN Certificaciones c on c.IDInscripcion= i.ID 

-- 9 Listado de cursos con nombre, costo de cursado y certificación, costo total (cursado + certificación) con 10% de todos los cursos de nivel Principiante.
-- SELECT TOP (10) PERCENT c.Nombre, c.CostoCurso, c.CostoCertificacion, c.CostoCurso + c.CostoCertificacion as 'Costo total'
-- FROM Cursos c  
-- INNER JOIN Niveles n on c.IDNivel = n.ID
-- WHERE c.IDNivel =5

-- 10 Listado con nombre y apellido y mail de todos los instructores. Sin repetir.
-- SELECT DISTINCT d.Nombres, d.Apellidos, d.Email
-- FROM Datos_Personales d 
-- INNER JOIN Instructores_x_Curso i on d.ID = i.IDUsuario

-- 11 Listado con nombre y apellido de todos los usuarios que hayan cursado algún curso cuya categoría sea 'Historia'.
-- SELECT d.Nombres, d.Apellidos
-- FROM Datos_Personales d 
-- INNER JOIN Inscripciones i on d.ID = i.IDUsuario
-- INNER JOIN Categorias_x_Curso ca on ca.IDCurso= i.IDCurso
-- INNER JOIN Categorias c on c.ID = ca.IDCategoria
-- WHERE c.Nombre = 'Historia'

-- 12 Listado con nombre de idioma, código de curso y código de tipo de idioma. Listar todos los idiomas indistintamente si no tiene cursos relacionados.
-- SELECT i.Nombre as 'Idioma', c.ID as 'Codigo de Curso', ic.IDFormatoIdioma as 'Codigo tipo de idioma'
-- FROM Idiomas i 
-- LEFT JOIN Idiomas_x_Curso ic ON i.ID = IC.IDIdioma
-- LEFT JOIN Cursos c ON c.ID = ic.IDCurso

-- 13 Listado con nombre de idioma de todos los idiomas que no tienen cursos relacionados.
-- SELECT i.Nombre as 'Idioma'
-- FROM Idiomas i 
-- LEFT JOIN Idiomas_x_Curso ic on i.ID = ic.IDIdioma
-- WHERE ic.IDIdioma is null

-- 14 Listado con nombres de idioma que figuren como audio de algún curso. Sin repeticiones.
-- SELECT DISTINCT i.Nombre
-- FROM Idiomas i 
-- INNER JOIN Idiomas_x_Curso ic ON i.ID = ic.IDIdioma
-- INNER JOIN FormatosIdioma fi ON ic.IDFormatoIdioma = fi.ID
-- WHERE fi.Nombre = 'Audio'

-- 15 Listado con nombres y apellidos de todos los usuarios y el nombre del país en el que nacieron. Listar todos los países indistintamente si no tiene usuarios relacionados.
-- SELECT d.Nombres, d.Apellidos, p.Nombre as 'Pais'
-- FROM Datos_Personales d 
-- INNER JOIN Localidades l on l.ID = d.IDLocalidad
-- RIGHT JOIN Paises p on l.IDPais = p.ID

-- 16 Listado con nombre de curso, fecha de estreno y nombres de usuario de todos los inscriptos. Listar todos los nombres de usuario indistintamente si no se inscribieron a ningún curso.
-- SELECT c.Nombre as 'Nombre del Curso', c.Estreno as 'Fecha de Estreno', u.NombreUsuario as 'Nombre de usuario'
-- FROM Cursos c 
-- INNER JOIN Inscripciones i on c.ID = i.IDCurso
-- RIGHT JOIN Usuarios u on i.IDUsuario = u.ID

-- 17 Listado con nombre de usuario, apellido, nombres, género, fecha de nacimiento y mail de todos los usuarios que no cursaron ningún curso.
-- SELECT u.NombreUsuario, d.Apellidos, d.Nombres, d.Genero, d.Nacimiento, d.Email
-- FROM Usuarios u
-- INNER JOIN Datos_Personales d on u.ID = d.ID
-- LEFT JOIN Inscripciones i on i.IDUsuario = u.ID
-- WHERE i.IDUsuario is null 

-- 18 Listado con nombre y apellido, nombre del curso, puntaje otorgado y texto de la reseña. Sólo de aquellos usuarios que hayan realizado una reseña inapropiada.
-- SELECT d.Nombres, d.Apellidos, c.Nombre, r.Puntaje, r.Observaciones
-- FROM Datos_Personales d 
-- INNER JOIN Inscripciones i on d.ID= i.IDUsuario
-- INNER JOIN Cursos c on i.IDCurso= c.ID
-- INNER JOIN Reseñas r on r.IDInscripcion= i.ID
-- WHERE r.Inapropiada=1

-- 19 Listado con nombre del curso, costo de cursado, costo de certificación, nombre del idioma y nombre del tipo de idioma de todos los cursos cuya fecha de estreno haya sido antes del año actual. Ordenado por nombre del curso y luego por nombre de tipo de idioma. Ambos ascendentemente.
