namespace RentaVehiculos.Datos.Modelos;

public class Reserva : IComparable<Reserva>
{
    private int _dias;

    public int IdReserva { get; set; }
    public int IdVehiculo { get; set; }
    public int IdCliente { get; set; }
    public DateTime FechaInicio { get; set; }
    public DateTime FechaFinPactada { get; set; }
    public DateTime? FechaDevolucion { get; set; }

    public int Dias
    {
        get => _dias;
        set
        {
            if (value < 1 || value > 30)
                throw new ReglaNegocioException(1, "La reserva debe durar entre 1 y 30 dias.");
            _dias = value;
        }
    }

    public decimal Total { get; set; }
    public decimal Recargo { get; set; }
    public int DiasRetraso { get; set; }
    public EstadoReserva Estado { get; set; } = EstadoReserva.Activa;

    public int CompareTo(Reserva? otra)
    {
        if (otra is null) return 1;
        return FechaInicio.CompareTo(otra.FechaInicio);
    }
}
