namespace RentaVehiculos.Datos.Modelos;

public record Deposito(
    int IdDeposito,
    int IdReserva,
    decimal Monto,
    DateTime FechaDeposito,
    decimal? MontoDevuelto = null);
