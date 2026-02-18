/*
Consigna: ✍️  
Crea una tabla llamada Autores con las siguientes columnas (tú decides los tipos de datos apropiados):
autor_id – clave primaria y autoincremental.
nombre – nombre de pila del autor.
apellido – apellido del autor.
fecha_nacimiento – fecha de nacimiento.
nacionalidad – país de origen.
Pista: piensa en enteros, cadenas de longitud fija/variable o tipos de fecha según convenga.
Inserta dos registros de ejemplo en Autores con datos ficticios.
Consulta el contenido de la tabla con SELECT * FROM Autores; para verificar que todo quedó almacenado correctamente.
*/
create table autores (
   autor_id int auto_increment primary key,
   nombre varchar(50) not null,
   apellido varchar(50) not null,
   fecha_nacimiento date,
   nacionalidad varchar(100),
   estado enum('activo', 'inactivo', 'baneado') default 'activo'
);

insert into autores(nombre, apellido, fecha_nacimiento, nacionalidad)
values
('Gabriel', 'Garcia Márquez', '1930-04-10', 'Colombiana'),
('Isabel', 'Allende', '1940-04-06', 'Chilena');

select * from autores;