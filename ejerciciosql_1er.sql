/* Consignas:
Obtener el nombre y direccion de todos los clientes registrados.
Obtener el nombre y categoría de los productos con precio mayor a 100.
Obtener el nombre de los clientes y el ID de las órdenes que realizaron en el año 1997.
*/

-- Obtener el nombre y direccion de todos los clientes registrados. --

SELECT nombre, pais
FROM clientes;

-- Obtener el nombre y categoría de los productos con precio mayor a 100. --

SELECT nombre, categoria
FROM Productos
WHERE precio > 100;

-- Obtener el nombre de los clientes y el ID de las órdenes que realizaron en el año 1997. --
SELECT clientes.nombre, ordenes.id_orden
FROM clientes
JOIN ordenes
ON clientes.id_cliente = ordenes.id_cliente
WHERE YEAR(ordenes.fecha) = 2023;



