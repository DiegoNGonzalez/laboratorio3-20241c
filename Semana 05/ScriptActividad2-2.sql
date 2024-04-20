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

--12