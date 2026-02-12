/*
Tareas con JOIN y sus variantes
Obtener el nombre de los clientes y la fecha de sus órdenes.
Obtener el nombre del cliente y los productos que compró.
Obtener todos los clientes y sus órdenes, aunque no tengan ninguna.
Obtener los clientes que no han realizado ninguna orden.
Obtener todas las órdenes y los nombres de los clientes, aunque haya órdenes sin cliente asociado.
Obtener el nombre del cliente y la cantidad de órdenes que ha realizado.
Obtener pares de clientes que pertenecen al mismo país.
*/

-- Obtener el nombre de los clientes y la fecha de sus órdenes. -

select clientes.nombre, clientes.email, ordenes.fecha, ordenes.id_orden
from clientes
inner join ordenes
on clientes.id_cliente = ordenes.id_cliente;

-- Obtener el nombre del cliente y los productos que compró. --

select clientes.nombre as nombre_cliente, productos.nombre as nombre_producto, ordenes.id_orden, ordenes.fecha, productos.precio
from clientes
inner join ordenes
on clientes.id_cliente = ordenes.id_cliente
inner join detalleorden
on ordenes.id_orden = detalleorden.id_orden
inner join productos
on detalleorden.id_producto = productos.id_producto;

-- Obtener todos los clientes y sus órdenes, aunque no tengan ninguna. --

select clientes.nombre, ordenes.id_orden
from clientes
left join ordenes
on clientes.id_cliente = ordenes.id_cliente;

-- Obtener los clientes que no han realizado ninguna orden. --

select clientes.nombre, ordenes.id_orden
from clientes
left join ordenes
on clientes.id_cliente = ordenes.id_cliente
where ordenes.id_orden is null;

-- Obtener todas las órdenes y los nombres de los clientes, aunque haya órdenes sin cliente asociado.--

select clientes.nombre as nombre_cliente, ordenes.id_orden
from clientes
right join ordenes
on clientes.id_cliente = ordenes.id_cliente;

-- Obtener el nombre del cliente y la cantidad de órdenes que ha realizado. --

select clientes.nombre, count(ordenes.id_orden) as total_ordenes
from clientes
left join ordenes
on clientes.id_cliente = ordenes.id_cliente
group by clientes.nombre;

-- Obtener pares de clientes que pertenecen al mismo país. --

select 
    c1.nombre as cliente1,
    c2.nombre as cliente2,
    c1.pais
from clientes c1
join clientes c2
on c1.pais = c2.pais
and c1.id_cliente < c2.id_cliente;