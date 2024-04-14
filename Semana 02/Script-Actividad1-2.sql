Use UNIV
go
CREATE TABLE Usuarios(
    ID_Usuario int not null PRIMARY KEY,
    Usuario VARCHAR(50) not null unique,
    Mail VARCHAR(100) null unique
)
GO
Create TABLE Instructores(
    ID_Instructor int not null PRIMARY KEY,
    ID_Usuario int not null FOREIGN KEY REFERENCES Usuarios(ID_Usuario)
)
GO
Create table Instructores_X_Curso(
    ID_Instructor int not null FOREIGN KEY REFERENCES Instructores(ID_Instructor),
    IDCurso int not null FOREIGN KEY REFERENCES Curso(IDCurso),
    PRIMARY KEY (ID_Instructor, IDCurso)
)
go
CREATE TABLE Paises(
    ID_Pais int not null PRIMARY KEY,
    Pais VARCHAR(50) not null UNIQUE,
    CodigoPostal int not null unique
)
go
CREATE TABLE Domicilios(
    ID_Domicilio int not null PRIMARY KEY,
    CodigoPostal int not null FOREIGN KEY REFERENCES Paises(CodigoPostal),
    Ciudad VARCHAR(50) not null,
    Direccion VARCHAR(100) not null 
)
go
CREATE TABLE Telefonos(
    ID_Telefono int not null PRIMARY KEY,
    Telefono VARCHAR(50) null,
    Celular VARCHAR(50) null
)
go
CREATE TABLE Datos_Personales(
    ID_Usuario int not null FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
    Nombre varchar(50) not null,
    Apellido VARCHAR(50) not null,
    FechaNacimiento DATE not null,
    Genero char(1) null CHECK (Genero ='M' or Genero= 'F'),
    ID_Domicilio int not null FOREIGN KEY REFERENCES Domicilios(ID_Domicilio),
    ID_Telefono int not null FOREIGN key REFERENCES Telefonos(ID_Telefono),
    PRIMARY KEY(ID_Usuario)
)
GO
CREATE TABLE Inscripciones(
    ID_Inscripcion int not null PRIMARY KEY,
    IDCurso int not null FOREIGN KEY REFERENCES Curso(IDCurso),
    ID_Usuario int not null FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
    FechaInscripcion date not null CHECK(FechaInscripcion <= GETDATE()),
)
go
CREATE TABLE Pagos(
    ID_Pagos int not null PRIMARY KEY,
    ID_Inscripcion int not null FOREIGN KEY REFERENCES Inscripciones(ID_Inscripcion),
    FechaDePago DATE not null,
    Monto money not null
)
go
CREATE TABLE Certificaciones(
    ID_Certificacion int not null PRIMARY KEY,
    FechaCertificacion DATE not NULL,
    Costo money not null,
    ID_Inscripcion int not null FOREIGN KEY REFERENCES Inscripciones(ID_Inscripcion)
)
go
Create TABLE Resenias(
    ID_Resenia int not null PRIMARY key,
    Resenia VARCHAR(500) not null,
    Puntaje int not null CHECK(Puntaje between 1 and 10),
    ID_Inscripcion int not null FOREIGN KEY REFERENCES Inscripciones(ID_Inscripcion)
)