/* 

Contexto: 🙌
Una librería llamada "Lectura Global" quiere organizar sus datos en una base de datos relacional. Necesitan gestionar los libros, sus autores, las categorías a las que pertenecen y las ventas realizadas.
Tu tarea es diseñar el esquema de la base de datos mediante comandos DDL en SQL, asegurando restricciones adecuadas y relaciones entre las tablas.
Autores:
autor_id (INT, clave primaria, autoincremental)
nombre (VARCHAR(100), no nulo)
nacionalidad (VARCHAR(50))
Categorias:
categoria_id (INT, clave primaria, autoincremental)
nombre (VARCHAR(50), no nulo)

Libros:
libro_id (INT, clave primaria, autoincremental)
titulo (VARCHAR(150), no nulo)
autor_id (INT, clave foránea que referencia Autores(autor_id))
categoria_id (INT, clave foránea que referencia Categorias(categoria_id))
precio (DECIMAL(8,2), no nulo)
stock (INT, no nulo, con valor por defecto 10)
Ventas:
venta_id (INT, clave primaria, autoincremental)
libro_id (INT, clave foránea que referencia Libros(libro_id))
cantidad (INT, no nulo, mayor a 0)
fecha_venta (DATE, no nulo, valor predeterminado la fecha actual)

*/

create database libreria;
use libreria;

create table autores (
    autor_id int auto_increment primary key,
    nombre varchar(100) not null,
    nacionalidad varchar(50)
);

create table categorias (
    categoria_id int auto_increment primary key,
    nombre VARCHAR(50) not null
);


create table libros (
   libro_id int auto_increment primary key,
   titulo VARCHAR(150) not null,
   precio DECIMAL(10,2) not null,
   stock int default 10,
   autor_id int,
   categoria_id int,
   foreign key (autor_id) references autores(autor_id),
   foreign key (categoria_id) references categorias(categoria_id)
);


create table ventas (
    venta_id int auto_increment primary key,
    libro_id int,
    cantidad int not null,
    fecha_venta DATE default(current_date),
    foreign key (libro_id) references libros(libro_id)
);

insert into autores ( nombre, nacionalidad)
values
('Gabriel Garcia Márquez', 'Colombiana'),
('Isabel Allende', 'Chilena');

insert into categorias (nombre)
values
('Novela'),
('Ciencia Ficción'),
('Ensayo');


insert into libros (titulo, precio, stock, autor_id, categoria_id)
values
('Cien Años de Soledad', 12000, 15, 1, 1),
('La casa de los espíritus', 18000, 20, 2, 2);


insert into ventas (libro_id, cantidad)
values
(1,4),
(2,3);

select * from autores;
select * from categorias;

select libros.titulo, libros.precio, libros.stock, autores.nombre as autor, categorias.nombre as categoria
from libros
join autores
on libros.autor_id = autores.autor_id
join categorias
on libros.categoria_id = categorias.categoria_id;

select * from ventas;