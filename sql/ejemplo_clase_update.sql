/*
Actualización de registros:
Actualizar de información en una tabla llamada "Transacciones". Utilizar el comando UPDATE para modificar los precios de las transacciones según ciertos criterios.
Utilizar el comando UPDATE para aumentar en un 15% el precio de las transacciones que tienen un precio menor a $50.
Recuperar y mostrar todos los registros de la tabla "Transacciones" después de la actualización.
*/

CREATE TABLE Transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100),
    precio DECIMAL(10,2),
    fecha DATE
);

INSERT INTO Transacciones (descripcion, precio, fecha)
VALUES
('Suscripción básica', 25.00, '2025-01-05'),
('Compra de dominio', 12.00, '2025-01-10'),
('Licencia de software', 75.00, '2025-01-12'),
('Servicio de hosting', 45.00, '2025-01-15'),
('Plantilla premium', 60.00, '2025-01-20');


-- Utilizar el comando UPDATE para aumentar en un 15% el precio de las transacciones que tienen un precio menor a $50.

update transacciones
set precio = precio * 1.15;


select * from transacciones;
