/*
Contexto: 🙌
Estás trabajando en la base de datos de una empresa que gestiona pedidos de clientes. La empresa necesita una nueva tabla para almacenar información de productos. Además, desean asegurar que ciertos campos no puedan quedar vacíos.

Consigna: ✍️
Debes realizar las siguientes tareas en SQL utilizando el Lenguaje de Definición de Datos (DDL):
Crear una tabla llamada Productos que incluya las siguientes columnas:
id_producto: Identificador único de tipo INT, clave primaria y auto incrementable.
nombre: Nombre del producto, de tipo VARCHAR(100), no debe permitir valores nulos.
precio: Precio del producto, de tipo DECIMAL(10,2), debe permitir valores nulos inicialmente.
stock: Cantidad disponible, de tipo INT, por defecto debe ser 0.

Insertar tres productos con diferentes valores en la tabla creada.
Verificar que los datos se hayan insertado correctamente utilizando SELECT.
Modificar la columna precio para que ya no acepte valores nulos.
Intentar insertar un nuevo producto sin definir el precio y observar qué sucede.
Eliminar la tabla Productos después de realizar todas las operaciones.
*/

use company;

create table productos (
    id_producto int auto_increment primary key,
    nombre varchar(100) not null,
    precio decimal(10,2) null,
    stock int default 0
);

insert into productos (nombre, precio, stock)
values
('Teclado', 10000, 2),
('Mouse', 5000, 2),
('Monitor', 100000, 6);

insert into productos (nombre, precio)
values
('Camara web', 60000);

update productos
set precio = 0
where precio is null;

alter table productos
modify precio decimal(10,2) not null;

drop table productos;

select * from productos;
