
create table cuentas (
    id int auto_increment primary key,
    titular varchar(50),
    saldo decimal(10,2)
);

insert into cuentas (titular, saldo)
values
   ('Cuenta origen', 500),
   ('Cuenta destino', 100);
   
select * from cuentas;

call transferir_saldo(1,2,200);
call transferir_saldo(1,2,300);
call transferir_saldo(1,2,100);