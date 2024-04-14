CREATE DATABASE UNIV
go
use UNIV
go
CREATE TABLE Niveles(
    IDNivel int not null PRIMARY KEY,
    Nivel varchar (20) not NULL
)
go 
CREATE TABLE Curso(
    IDCurso int not null PRIMARY KEY,
    Nombre VARCHAR(100) not null,
    FechaEstreno DATE not null,
    CostoCursado MONEY not null CHECK(CostoCursado >= 0),
    CostoCertificacion money not null CHECK(CostoCertificacion >0),
    IDNivel int null FOREIGN KEY REFERENCES Niveles(IDNivel)
)
go
CREATE TABLE CategoriasCurso(
    IDCategoria int not null PRIMARY KEY,
    Categoria VARCHAR(100) not null
)
go
CREATE TABLE CategoriasXCurso(
    IDCurso int not null FOREIGN KEY REFERENCES Curso(IDCurso),
    IDCategoria int not null FOREIGN KEY REFERENCES CategoriasCurso(IDCategoria)
    PRIMARY KEY (IDCurso,IDCategoria)
)
go
CREATE TABLE Idiomas(
    IDIdioma int not null PRIMARY KEY,
    Idioma VARCHAR(20) not null
)
go
CREATE TABLE CursosXIdioma(
    IDCurso int not null FOREIGN KEY REFERENCES Curso(IDCurso),
    IDIdioma int not null FOREIGN KEY REFERENCES Idiomas(IDIdioma),
    IdiomaAudio bit not null DEFAULT 0,
    IdiomaSubtitulo bit not null DEFAULT 0,
    PRIMARY KEY(IDCurso,IDIdioma)
)
go
CREATE TABLE Clase(
    IDClase int not null PRIMARY KEY,
    NombreClase VARCHAR(50) not null,
    NroClase int not null DEFAULT 1,
    Duracion int not null CHECK(Duracion>0),
    IDCurso int not null FOREIGN KEY REFERENCES Curso(IDCurso)
)
go
CREATE TABLE TipoContenido(
    IDTipoContenido int not null PRIMARY KEY,
    TipoContenido VARCHAR(100) not null
)
go
CREATE TABLE Contenido(
    IDContenido int not null PRIMARY KEY,
    Tamanio int not null CHECK (Tamanio>0),
    IDClase int not null FOREIGN KEY REFERENCES Clase(IDClase),
    IDTipoContenido int not null FOREIGN KEY REFERENCES TipoContenido(IDTipoContenido)
)
