namespace RentaVehiculos.Datos.Modelos;

public class Pago
{
    private decimal _monto;

    public int IdPago { get; set; }
    public int IdReserva { get; set; }
    public ConceptoPago Concepto { get; set; }
    public DateTime FechaPago { get; set; }

    public decimal Monto
    {
        get => _monto;
        set
        {
            if (value <= 0)
                throw new ArgumentException("El monto del pago debe ser mayor que 0.");
            _monto = value;
        }
    }
}
