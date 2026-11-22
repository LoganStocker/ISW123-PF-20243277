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

## 22/11/2026 03:18 PM

Se creo la capa Datos (solucion RentaVehiculos.Datos) con la carpeta Modelos: el enum EstadoVehiculo con los estados Disponible, Rentado y Mantenimiento, el enum EstadoReserva con Activa, Devuelta y Cancelada, y la excepcion propia ReglaNegocioException, que guarda el numero de la regla de negocio que se rompio.

## 22/11/2026 03:45 PM

Se crearon las clases de los vehiculos: la clase abstracta Vehiculo, con propiedades validadas para la placa y el precio por dia, y sus dos clases hijas AutoDeportivo (con caballos de fuerza) y Jeepeta (con 4x4), cada una con su propia descripcion.

## 22/11/2026 04:21 PM

Se crearon las clases Cliente, con validacion de la cedula (11 digitos) y de la licencia (una letra y 9 digitos), y Reserva, que valida los dias de 1 a 30 y se ordena por fecha de inicio con IComparable.

## 22/11/2026 04:29 PM

Se redacto el planteamiento del problema en el README: la empresa dominicana de renta de vehiculos que hoy lleva su flota y sus reservas en cuaderno o en Excel, los errores que eso causa y como el sistema los evita.

## 22/11/2026 04:45 PM

Se creo la interfaz IReservable en la capa Datos, con el metodo PuedeReservarse, y la clase abstracta Vehiculo la implementa: un vehiculo puede reservarse solo si esta activo y su estado es Disponible.

## 22/11/2026 05:01 PM

Se creo el record Deposito en la capa Datos, con el id del deposito, el id de la reserva, el monto, la fecha del deposito y el monto devuelto, que puede estar vacio hasta que se devuelva el vehiculo. Se uso un record porque un deposito solo guarda datos y no cambia despues de crearse. Un record es inmutable y compara por sus valores, y tiene menos codigo que una clase. No lleva validaciones porque se haran en la capa Negocio.

## 22/11/2026 06:05 PM

Se crearon el enum ConceptoPago, con los conceptos Alquiler y Recargo, y la clase Pago en la capa Datos. La clase Pago valida que el monto sea mayor que 0 y lanza una excepcion si no lo es.

## 22/11/2026 06:23 PM

Se creo el atributo propio ColumnaAtributo en la capa Datos, con un titulo y un orden, y se aplico a las propiedades Placa, Marca, Modelo, PrecioPorDia y Estado de Vehiculo. Se hizo para leer esos datos con reflection mas adelante y armar los reportes sin escribir las columnas a mano.
