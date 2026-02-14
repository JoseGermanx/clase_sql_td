USE `alkewallet`;
DROP procedure IF EXISTS `transferir_saldo`;

DELIMITER $$
USE `alkewallet`$$
CREATE PROCEDURE `transferir_saldo` (
   in cuenta_origen int,
   in cuenta_destino int,
   in monto decimal(10,2)
)
BEGIN
declare filas_afectadas int;
   
   start transaction;
   
   -- intentar descontar el monto desde la cuenta origen
   update cuentas
   set saldo = saldo - monto
   where id = cuenta_origen and saldo >= monto;
   
   set filas_afectadas = row_count();
   
   if filas_afectadas = 0 then
       rollback;
       select 'Saldo insuficiente - Transacción cancelada' as mensaje;
   else
       update cuentas
       set saldo = saldo  + monto
       where id = cuenta_destino;
       
       commit;
       select 'Transacción realizada con éxito' as mensaje;
   end if;
END$$

DELIMITER ;