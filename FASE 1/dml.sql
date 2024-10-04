use EjemploTaller;

INSERT INTO Usuario (nombre, correo) VALUES ('User 1', 'user1@gmail.com');
SELECT * FROM Usuario;

INSERT INTO Album (idUsuario, nombre) VALUES (1, 'Mi primer album');
SELECT * FROM Album;


INSERT INTO Imagen (idAlbum, fileName, fileData)
SELECT 2, 'image1.jpeg', 
       BulkColumn 
FROM OPENROWSET(BULK 'aqui va la ruta absoluta de tu imagen', SINGLE_BLOB) AS fileData;

SELECT * FROM Imagen;