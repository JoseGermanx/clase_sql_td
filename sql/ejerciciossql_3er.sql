/* Realizar las siguientes tareas consultas anidadas

Obtener los productos más caros que el precio promedio.
Obtener los clientes que han realizado al menos una orden.
Obtener el producto más caro.
Obtener los clientes que gastaron más de 500 en total.
Obtener los productos que nunca se han vendido.
*/

-- Obtener los productos más caros que el precio promedio. --
SELECT nombre, categoria, precio
FROM productos
WHERE precio > (
      SELECT AVG(precio)
      FROM productos
      );

-- Obtener los clientes que han realizado al menos una orden. --

select nombre
from clientes
where id_cliente in (
      select id_cliente
      from ordenes
      );

-- Obtener el producto más caro. --

select nombre, precio
from productos
where precio = (
      select max(precio)
      from productos
      );

-- Obtener los clientes que gastaron más de 500 en total. --
 select nombre
 from clientes
 where id_cliente in (
       select ordenes.id_cliente
       from ordenes
       join detalleorden
       on ordenes.id_orden = detalleorden.id_orden
       join productos
       on detalleorden.id_producto = productos.id_producto
       group by ordenes.id_cliente
       having sum(detalleorden.cantidad*productos.precio) > 500
       );
       
 -- Obtener los productos que nunca se han vendido. --
 
 select nombre
 from productos
 where id_producto not in (
      select id_producto
      from detalleorden
      );
 
 