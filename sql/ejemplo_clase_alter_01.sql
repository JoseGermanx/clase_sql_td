
/* 
1. Crear la tabla Productos
2. Cambiar el nombre de la columna "valor" a “importe”
3. Modificar el tipo de datos de INT a DECIMAL.
4. Agregar todos los tipos de datos que falten en las tablas.

*/

create table productos (
    id int auto_increment primary key,
    nombre varchar(100),
    valor int
);

-- Cambiar el nombre de la columna "valor" a “importe” (se utiliza change)
alter table productos
change valor importe int;


-- Modificar el tipo de datos de INT a DECIMAL. (se utiliza modify)
alter table productos
modify importe decimal(10,2);

-- Agregar todos los tipos de datos que falten en las tablas. (se utiliza add)
alter table productos
add fecha_registro date;

alter table productos
add activo boolean,
add descripcion varchar(100),
add stock int default 10;

select * from productos;
