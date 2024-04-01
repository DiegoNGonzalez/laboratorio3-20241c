CREATE DATABASE EjercicioNormalizacion
go
USE EjercicioNormalizacion
go
CREATE TABLE NivelIdiomas(
    IDNivel int not null PRIMARY KEY,
    Nivel varchar(50) not null unique
)
go
CREATE TABLE Idiomas(
    IDIdioma int not null PRIMARY KEY,
    Idioma varchar(50) not null UNIQUE
)
go
CREATE TABLE Empleados(
    Legajo int not null PRIMARY KEY IDENTITY(1,1),
    Nombre varchar(50) not null,
    Apellido VARCHAR(50) not null
)
go
CREATE TABLE EmpleadosXIdioma(
    Legajo int not null FOREIGN KEY REFERENCES Empleados(Legajo),
    IDIdioma int not null FOREIGN KEY REFERENCES Idiomas(IDIdioma),
    IDNivel int not null FOREIGN KEY REFERENCES NivelIdiomas(IDNivel)
    PRIMARY KEY (Legajo, IDIdioma)
)