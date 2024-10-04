CREATE DATABASE EjemploTaller;

USE EjemploTaller;

CREATE TABLE Usuario(
    id INT  IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50),
	correo VARCHAR(50)
);

CREATE TABLE Album(
    id INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT,
    nombre VARCHAR(50)
    FOREIGN KEY (idUsuario) REFERENCES Usuario(id)
);

CREATE TABLE Imagen(
    id INT IDENTITY(1,1) PRIMARY KEY,
    idAlbum INT,
    fileName NVARCHAR(255),
    fileData VARBINARY(MAX)
);


