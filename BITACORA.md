# Bitacora

## 22/11/2026 12:36 PM

Se definieron las 6 reglas de negocio del caso Renta de vehiculos: duracion de 1 a 30 dias, deposito del 40 %, estados del vehiculo, documentos vigentes del cliente, recargo del 20 % por dia de retraso y devolucion del deposito con descuento del recargo. Si el recargo es mayor que el deposito, el cliente paga lo que resta.

## 22/11/2026 12:57 PM

Se diseño la base de datos RentaVehiculosDB con 5 tablas: Usuarios, Vehiculos, Clientes, Reservas y Depositos. Los vehiculos son de dos tipos, auto deportivo y jeepeta, y cada uno tiene un dato propio: el auto deportivo se identifica por sus caballos de fuerza y la jeepeta por si es 4x4.

## 22/11/2026 03:16 PM

Se reviso el flujo completo y se ajusto el diseño: se agrego la tabla Pagos para el pago del alquiler y del recargo, el estado de la reserva (Activa, Devuelta, Cancelada), la cancelacion y edicion de reservas, la edicion de vehiculos y clientes con recalculo de las reservas activas, y la validacion de documentos vencidos.

## 22/11/2026 03:16 PM

Se revisaron las validaciones del sistema: se definio que excepcion se lanza en cada caso (reglas de negocio, datos invalidos, formato, base de datos) y se agregaron restricciones en la base de datos como segunda barrera. Las reglas pasaron a ser 10. Se decidio no incluir borrar clientes.

## 22/11/2026 03:16 PM

Se ajustaron las validaciones: la cedula debe tener 11 digitos y la licencia una letra seguida de 9 digitos. Se agrego la eliminacion de vehiculos sin perder el historial, porque el vehiculo queda inactivo, y el registro de los dias de retraso en cada devolucion tardia.
