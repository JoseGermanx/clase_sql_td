/*
Crear una tabla llamada "Categorias" con 2 columnas: id_categoria (PK)y nombre_categoria. 
Crear una tabla llamada "Productos" con 4 columnas: id_producto (PF), nombre_producto, precio, id_categoria (FK).
Insertar algunos datos de ejemplo para probar las relaciones.
*/

create database tienda_online;
use tienda_online;

create table categorias (
    id_categoria int auto_increment primary key,
    nombre_categoria varchar(50) not null
);


create table productos (
    id_producto int auto_increment primary key,
    nombre_producto varchar(100) not null,
    precio decimal(10,2) not null,
    id_categoria int,
    foreign key (id_categoria) references categorias(id_categoria)
);

insert into categorias (nombre_categoria)
values
('Electrónica'),
('Libros'),
('Ropa');

select * from categorias;

insert into productos (nombre_producto, precio, id_categoria)
values
('Laptop', 80000, 1),
('El Principito', 50000, 2),
('Camiseta', 20000, 3);

select * from productos;

select productos.nombre_producto, productos.precio, categorias.nombre_categoria
from productos
join categorias
on productos.id_categoria = categorias.id_categoria