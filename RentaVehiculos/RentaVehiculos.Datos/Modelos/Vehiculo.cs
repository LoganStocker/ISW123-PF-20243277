namespace RentaVehiculos.Datos.Modelos;

public abstract class Vehiculo : IReservable
{
    private string _placa = "";
    private decimal _precioPorDia;

    public int IdVehiculo { get; set; }

    [ColumnaAtributo("Placa", 1)]
    public string Placa
    {
        get => _placa;
        set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("La placa es obligatoria.");
            _placa = value;
        }
    }

    [ColumnaAtributo("Marca", 2)]
    public string Marca { get; set; } = "";
    [ColumnaAtributo("Modelo", 3)]
    public string Modelo { get; set; } = "";

    [ColumnaAtributo("Precio por dia", 4)]
    public decimal PrecioPorDia
    {
        get => _precioPorDia;
        set
        {
            if (value <= 0)
                throw new ArgumentException("El precio por dia debe ser mayor que 0.");
            _precioPorDia = value;
        }
    }

    [ColumnaAtributo("Estado", 5)]
    public EstadoVehiculo Estado { get; set; } = EstadoVehiculo.Disponible;

    public bool Activo { get; set; } = true;

    public bool PuedeReservarse()
    {
        return Activo && Estado == EstadoVehiculo.Disponible;
    }

    public abstract string Descripcion();
}
