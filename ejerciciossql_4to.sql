/*
Tienes una base de datos que registra información sobre una tienda on line con funciones:
Obtener los clientes que realizaron órdenes en el mismo país que el cliente con id_cliente = 2. (subconsultas)
Obtener el nombre del cliente con el mayor monto total de compras.
Obtener el nombre de los países junto con la cantidad de clientes en cada uno, ordenados de mayor a menor.
Obtener la categoría de productos con el mayor precio promedio.
*/

-- Obtener los clientes que realizaron órdenes en el mismo país que el cliente con id_cliente = 2. --

select nombre, pais
from clientes
where pais = (
    select pais
    from clientes
    where id_cliente = 1
    );

-- Obtener el nombre del cliente con el mayor monto total de compras. --
 select clientes.nombre
 from clientes
 join ordenes
 on clientes.id_cliente = ordenes.id_cliente
 join detalleorden
 on ordenes.id_orden = detalleorden.id_orden
 join productos
 on detalleorden.id_producto = productos.id_producto
 group by clientes.id_cliente, clientes.nombre
 order by sum(detalleorden.cantidad*productos.precio) desc
 limit 1;

-- Obtener el nombre de los países junto con la cantidad de clientes en cada uno, ordenados de mayor a menor. --

select pais, count(*) as total_clientes
from clientes
group by pais
order by total_clientes desc;


-- Obtener la categoría de productos con el mayor precio promedio. --

select categoria
from productos
group by categoria
order by avg(precio) DESC
limit 1;