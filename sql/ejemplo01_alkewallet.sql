/* Agregar nuevos usuarios utilizando INSERT:
En este espacio vamos a mostrar cómo agregar nuevos usuarios en una una tabla llamada "Usuarios". No obstante antes de comenzar, debemos crear una conexión a una base de datos llamada “Alke Wallet”.

Crear 3 tablas llamadas: 
Usuario, Transacción y Moneda.

Crear la Tabla “Usuarios”:
user_id (clave primaria)
nombre
correo electrónico
contraseña
saldo.
fecha de creación

Crear la Tabla “Transaccion”:
transaction_id (Primary Key)
sender_user_id (Foreign Key referenciando a User)
receiver_user_id (Foreign Key referenciando a User)
valor
transaction_date.

Crear la Tabla “Moneda”:
currency_id (Primary Key)
currency_name
currency_symbol

Insertar al menos 3 usuarios y 3 transacciones.
Consultar usuarios creados
*/

-- create database alkewallet;
-- use alkewallet;

create table usuarios (
user_id int auto_increment primary key,
nombre varchar(50) not null,
correo_electronico varchar(100) not null unique,
contrasena varchar(255) not null,
saldo decimal(10,2) default 0,
fecha_creacion date
);

create table monedas (
currency_id int auto_increment primary key,
currency_name varchar(50),
currency_symbol varchar(10)
);

create table transacciones (
transaction_id int auto_increment primary key,
sender_user_id int,
receiver_user_id int,
valor decimal(10,2),
transaction_date date,
foreign key (sender_user_id) references usuarios(user_id),
foreign key (receiver_user_id) references usuarios(user_id)
);



-- Insertando usuarios

insert into usuarios(nombre, correo_electronico, contrasena, saldo, fecha_creacion)
values
('Ana', 'ana@ana.com', 'pass123', 15000, '2025-01-20'),
('Jose', 'jose@ajg.com', 'pass123', 20000, '2024-05-20'),
('Alberto', 'alberto@alberto.com', 'pass123', 150000, '2026-01-20');

select * from usuarios;

insert into monedas (currency_name, currency_symbol)
values
('Peso Chileno', 'CLP'),
('Euro', 'EUR');

select * from monedas;

-- validando integridad referencial
insert into transacciones (sender_user_id, receiver_user_id, valor, transaction_date)
values (2,2,30000,'2026-02-12');

insert into transacciones (sender_user_id, receiver_user_id, valor, transaction_date)
values (1,3,30000,'2026-02-12');

insert into transacciones (sender_user_id, receiver_user_id, valor, transaction_date)
values (2,1,30000,'2026-02-12');

insert into transacciones (sender_user_id, receiver_user_id, valor, transaction_date)
values (3,2,30000,'2026-02-12');

select * from transacciones;

select usuarios.nombre, transacciones.transaction_id
from usuarios
join transacciones
on usuarios.user_id = transacciones.sender_user_id
