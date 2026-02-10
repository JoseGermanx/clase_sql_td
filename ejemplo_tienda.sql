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
('Carlos Díaz', 'carlos@email.com', 'Perú');

INSERT INTO Productos (nombre, categoria, precio) VALUES
('Laptop', 'Electrónica', 1200.00),
('Auriculares', 'Electrónica', 150.00),
('Silla de oficina', 'Muebles', 200.00),
('Mouse', 'Electrónica', 40.00),
('Escritorio', 'Muebles', 350.00);

INSERT INTO Ordenes (fecha, id_cliente) VALUES
('2024-01-15', 1),
('2024-03-22', 2),
('2023-11-10', 1),
('2024-07-05', 3);

INSERT INTO DetalleOrden (id_orden, id_producto, cantidad) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 3),
(3, 5, 1),
(4, 2, 1),
(4, 4, 2);
