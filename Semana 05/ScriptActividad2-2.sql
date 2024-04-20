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

