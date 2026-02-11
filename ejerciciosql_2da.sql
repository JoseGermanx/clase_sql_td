/* Consigna: ✍️
Recuperar el nombre y país de los clientes que hayan realizado al menos una orden en 2024.
Obtener los nombres de los productos y la suma total vendida (cantidad × precio).
Listar el nombre del cliente y el monto total comprado, ordenados de mayor a menor.
Obtener el nombre del producto más caro de la categoría "Electrónica".
Contar cuántos clientes distintos hicieron compras en cada país.
*/

-- Recuperar el nombre y país de los clientes que hayan realizado al menos una orden en 2024. --

SELECT DISTINCT clientes.nombre, clientes.pais
FROM clientes
JOIN ordenes
ON clientes.id_cliente = ordenes.id_cliente
WHERE YEAR(ordenes.fecha) = 2024;

-- Obtener los nombres de los productos y la suma total vendida (cantidad × precio). --
SELECT
    productos.nombre,
    SUM(detalleorden.cantidad*productos.precio) as total_vendido
FROM productos
JOIN detalleorden
ON productos.id_producto = detalleorden.id_producto
GROUP BY productos.nombre;

-- Listar el nombre del cliente y el monto total comprado, ordenados de mayor a menor. --

SELECT 
    clientes.nombre,
    SUM(detalleorden.cantidad*productos.precio) as total_comprado
FROM clientes
JOIN ordenes
ON clientes.id_cliente = ordenes.id_cliente
JOIN detalleorden
ON ordenes.id_orden = detalleorden.id_orden
JOIN productos
ON detalleorden.id_producto = productos.id_producto
group by clientes.nombre
ORDER BY total_comprado DESC;

-- Obtener el nombre del producto más caro de la categoría "Electrónica". --

SELECT nombre, precio
FROM productos
WHERE categoria = 'Electrónica'
ORDER BY precio DESC
LIMIT 1;


-- Contar cuántos clientes distintos hicieron compras en cada país. --

SELECT
    clientes.pais,
    COUNT(DISTINCT clientes.id_cliente) AS total_cliente
FROM clientes
JOIN ordenes
on clientes.id_cliente = ordenes.id_cliente
group by clientes.pais;
