
/*
Modificar una restricción de nulidad en una tabla de empleados:
Crear una tabla llamada "empleados" y deseas cambiar la restricción de nulidad de la columna "apellido" para que no permita valores nulos.
Crear la tabla inicialmente con la restricción de nulidad permitiendo valores nulos en la columna "apellido".
2.  Modificar la restricción de nulidad para la columna "apellido" para que no permita valores nulos.
*/

select * from empleados;

insert into empleados (nombre, apellido, salario, fecha_ingreso, departamento)
values
('Luisa', 'Alvarez', 80000, '2026-01-01', 'Ventas');

-- Modificar la restricción de nulidad para la columna "apellido" para que no permita valores nulos.

-- se modifican los campos que sean null antes de cambiar la restricción de nulidad.
update empleados
set apellido = 'Sin apellido'
where apellido is null;

-- Modificar la restricción null
alter table empleados
modify column apellido varchar(50) not null;

