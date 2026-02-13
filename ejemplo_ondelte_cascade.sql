

create table clientes (
   id_cliente int auto_increment primary key,
   nombre varchar(50),
   correo varchar(100)
   );

create table pedidos (
   id_pedido int auto_increment primary key,
   id_cliente int,
   descripcion varchar(100),
   monto decimal(10,2),
   foreign key (id_cliente)
       references clientes(id_cliente)
       on delete cascade
	);
   
   
INSERT INTO Clientes (nombre, correo)
VALUES
('Ana Torres', 'ana@correo.com'),
('Luis Pérez', 'luis@correo.com'),
('María Gómez', 'maria@correo.com');


INSERT INTO Pedidos (id_cliente, descripcion, monto)
VALUES
(1, 'Laptop', 800000),
(1, 'Mouse', 15000),
(2, 'Teclado', 30000),
(3, 'Monitor', 120000);

select * from clientes;
select * from pedidos;

delete from clientes
where id_cliente = 3;