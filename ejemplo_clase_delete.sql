/*
  Eliminación de registros utilizando el comando DELETE:
Eliminar registros de una tabla llamada "Usuarios" para borrar registros específicos según una condición dada:

Escribir una consulta para recuperar y mostrar todos los registros de la tabla "Usuarios" en la consola.
Utilizar el comando DELETE para eliminar los registros de los usuarios que fueron creados antes del 01/01/2025
Escribir una consulta final para recuperar y mostrar todos los registros restantes después de la eliminación.

*/

use company;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(100),
    fecha_creacion DATE
);

INSERT INTO Usuarios (nombre, email, fecha_creacion)
VALUES
('Ana Torres', 'ana@email.com', '2019-05-10'),
('Luis Pérez', 'luis@email.com', '2025-12-20'),
('María Gómez', 'maria@email.com', '2026-03-15'),
('Carlos Ruiz', 'carlos@email.com', '2018-07-01'),
('Sofía Díaz', 'sofia@email.com', '2026-09-30');



delete from usuarios;


select * from usuarios
