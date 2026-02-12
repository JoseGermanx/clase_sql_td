
/* Consigna: ✍️
El objetivo de este ejercicio es crear una tabla llamada inventario con las siguientes columnas:
ID, nombre_producto, precio, y cantidad_disponible. 
Luego, deberán insertar registros en la tabla utilizando la instrucción INSERT INTO,
asegurándose de que el campo ID se autogere y se incremente automáticamente.
Esto les permitirá practicar cómo añadir productos al inventario sin tener que
preocuparse por la gestión del ID.

*/

create table inventario (
  id int auto_increment primary key,
  nombre_producto varchar(100),
  precio decimal(10,2),
  cantidad_disponible int
  );
  
  insert into inventario ( nombre_producto, precio, cantidad_disponible)
  values ('Monitor 19', '100000', 100);
  
insert into inventario ( nombre_producto, precio)
values ('Monitor 19', '100000');

insert into inventario ( nombre_producto, precio)
values ('Mouse Optico', '5000');

select * from inventario;
  
  
  