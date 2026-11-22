namespace RentaVehiculos.Datos.Modelos;

public abstract class Vehiculo
{
    private string _placa = "";
    private decimal _precioPorDia;

    public int IdVehiculo { get; set; }

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

    public string Marca { get; set; } = "";
    public string Modelo { get; set; } = "";

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

    public EstadoVehiculo Estado { get; set; } = EstadoVehiculo.Disponible;

    public bool Activo { get; set; } = true;

    public abstract string Descripcion();
}
