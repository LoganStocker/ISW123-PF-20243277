# Renta de Vehiculos

## Que problema resuelve

RentaVehiculos es un sistema para una empresa dominicana de renta de vehiculos que hoy lleva su flota y sus reservas en cuaderno o en Excel. Con ese metodo no se sabe con certeza que vehiculo esta disponible, se puede rentar el mismo vehiculo a dos clientes y los dias, el total y los recargos se calculan a mano, con errores.

El sistema lleva la flota (autos deportivos y jeepetas) con su estado, registra las reservas con un maximo de 30 dias y calcula solo el total y el deposito del 40 por ciento. Al devolver el vehiculo registra la fecha real, calcula el recargo por cada dia de retraso y devuelve el deposito menos ese recargo.

Dentro de esa misma idea, el sistema tambien evita otros dos problemas: el dinero que no cuadra, porque cada deposito y cada pago queda registrado, y el alquiler a clientes con la cedula o la licencia vencida o mal anotada, porque esos datos se validan antes de guardarlos.

## Reglas de negocio

1. La reserva dura minimo 1 dia y maximo 30, y empieza en la fecha actual. No se aceptan fechas de inicio pasadas ni futuras. Fuera de ese rango no se guarda.
2. El deposito es el 40 % del valor total del alquiler (precio por dia x dias).
3. Un vehiculo solo se reserva si esta Disponible. Al reservar pasa a Rentado y al devolverlo vuelve a Disponible. Mantenimiento no se puede reservar.
4. El cliente debe tener cedula y licencia vigentes en la fecha de la reserva. La cedula tiene 11 digitos, sin caracteres especiales, y la licencia una letra seguida de 9 digitos. No se pueden registrar ni editar documentos vencidos.
5. Cada dia de retraso en la devolucion se cobra al precio normal del vehiculo mas un recargo del 20 % del precio por dia.
6. La devolucion se registra con la fecha actual. Si es tardia, queda registrado en la reserva con los dias de retraso. Si el vehiculo se devuelve a tiempo, se devuelve el deposito completo. Si hay recargo, se descuenta del deposito y se devuelve la diferencia. Si el recargo es mayor que el deposito, el cliente paga lo que resta.
7. Una reserva activa se puede cancelar. El vehiculo vuelve a Disponible y se devuelve el deposito completo.
8. Al editar una reserva activa o el precio de un vehiculo, se recalculan dias, total y deposito de las reservas activas afectadas. Las reservas devueltas y canceladas no cambian.
9. El tipo de un vehiculo no se puede cambiar. Su estado solo cambia entre Disponible y Mantenimiento, y no si tiene una reserva activa. Un vehiculo se puede eliminar solo si no tiene una reserva activa; eliminarlo solo lo deja inactivo y conserva el historial de sus reservas y pagos. Un vehiculo eliminado no se vuelve a usar.
10. Solo una reserva Activa se puede editar, cancelar o devolver. Las reservas Devueltas y Canceladas no se modifican.

## Como usarlo

## Donde esta cada requisito
