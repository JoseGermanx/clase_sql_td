/*
Contexto: 🙌
Hasta aquí ya practicamos:
Creación de tablas y tipos de datos.
Consultas simples, subconsultas y JOIN.
Sentencias DML básicas.
Ahora cerraremos la clase con un workflow completo de manipulación de datos sobre la tabla Empleados, consolidando los tres comandos CRUD principales.
Consigna: ✍️
Trabaja sobre la tabla Empleados (id_empleado PK AUTO_INCREMENT, nombre, apellido, salario, fecha_ingreso, departamento).

Alta masiva — INSERT 
Inserta cinco empleados con los datos de la tabla:
(Lucía Pérez 85 000 2024-02-01 IT, …, Sofía Ruiz 68 000 2025-01-10 Marketing).
Ajustes salariales y movimientos — UPDATE
Aumenta un 7 % a quienes ganen < 80 000.
Suma 5 000 fijos a los que tengan > 3 años de antigüedad.
Cambia a Sofía Ruiz al departamento Ventas.
Depuración — DELETE 
Elimina todos los empleados de RRHH.
Verificación
Tras cada bloque, ejecuta SELECT * FROM Empleados; para confirmar los cambios.
*/

create database company;
use company;

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_ingreso DATE,
    departamento VARCHAR(50)
);


-- Inserta cinco empleados con los datos de la tabla:
insert into Empleados (nombre, apellido, salario, fecha_ingreso, departamento)
values
('Lucia', 'Pérez', 85000, '2024-02-01', 'IT'),
('Sofía', 'Ruiz', 72000, '2023-02-01', 'Marketing'),
('Juan', 'Gómez', 68000, '2025-11-01', 'RRHH'),
('Ana', 'Torres', 92000, '2021-04-01', 'Ventas'),
('Carlos', 'Ruiz', 67000, '2022-08-01', 'RRHH');


-- Aumenta un 7 % a quienes ganen < 80 000.
update Empleados
set salario = salario*1.07
where salario < 80000;

-- Suma 5 000 fijos a los que tengan > 3 años de antigüedad.
update Empleados
set salario = salario + 5000
where fecha_ingreso <= date_sub(curdate(), interval 3 year);

-- Cambia a Sofía Ruiz al departamento Ventas.
update Empleados
set departamento = 'Ventas'
where id_empleado = 2;

-- Elimina todos los empleados de RRHH.
delete from Empleados
where departamento = 'RRHH';


select * from Empleados;

