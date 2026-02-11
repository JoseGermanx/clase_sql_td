CREATE DATABASE tienda_online;
USE tienda_online;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    pais VARCHAR(50)
);

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10,2)
);

CREATE TABLE Ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE DetalleOrden (
    id_orden INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_orden, id_producto),
    FOREIGN KEY (id_orden) REFERENCES Ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

INSERT INTO Clientes (nombre, email, pais) VALUES
('Ana Torres', 'ana@email.com', 'Chile'),
('Luis Pérez', 'luis@email.com', 'Argentina'),
('María Gómez', 'maria@email.com', 'Chile'),
('Carlos Díaz', 'carlos@email.com', 'Perú'),
('Sofía Rojas', 'sofia@email.com', 'Chile'),
('Diego Martínez', 'diego@email.com', 'México'),
('Lucía Fernández', 'lucia@email.com', 'Argentina'),
('Pedro Castillo', 'pedro@email.com', 'Perú'),
('Valentina López', 'valentina@email.com', 'Chile');

INSERT INTO Productos (nombre, categoria, precio) VALUES
('Laptop', 'Electrónica', 1200.00),
('Auriculares', 'Electrónica', 150.00),
('Silla de oficina', 'Muebles', 200.00),
('Mouse', 'Electrónica', 40.00),
('Escritorio', 'Muebles', 350.00),
('Teclado mecánico', 'Electrónica', 180.00),
('Monitor 27 pulgadas', 'Electrónica', 450.00),
('Lámpara de escritorio', 'Muebles', 60.00),
('Tablet', 'Electrónica', 300.00),
('Biblioteca', 'Muebles', 500.00);

INSERT INTO Ordenes (fecha, id_cliente) VALUES
('2024-01-15', 1),
('2024-03-22', 2),
('2023-11-10', 1),
('2024-07-05', 3),
('2024-02-10', 5),
('2024-04-18', 6),
('2024-06-21', 7),
('2023-12-05', 8),
('2024-08-30', 9);

INSERT INTO DetalleOrden (id_orden, id_producto, cantidad) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 3),
(3, 5, 1),
(4, 2, 1),
(4, 4, 2),
(5, 6, 1),
(5, 7, 2),
(6, 8, 1),
(7, 9, 1),
(7, 2, 1),
(8, 10, 1),
(9, 6, 2),
(9, 4, 1);
