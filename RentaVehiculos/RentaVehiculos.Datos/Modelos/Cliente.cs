namespace RentaVehiculos.Datos.Modelos;

public class Cliente
{
    private string _nombre = "";
    private string _cedula = "";
    private string _licencia = "";

    public int IdCliente { get; set; }

    public string Nombre
    {
        get => _nombre;
        set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("El nombre es obligatorio.");
            if (value.Length > 100)
                throw new ArgumentException("El nombre no puede tener mas de 100 caracteres.");
            _nombre = value;
        }
    }

    public string Cedula
    {
        get => _cedula;
        set
        {
            if (value.Length != 11 || !value.All(char.IsAsciiDigit))
                throw new ArgumentException("La cedula debe tener 11 digitos, solo numeros.");
            _cedula = value;
        }
    }

    public string Licencia
    {
        get => _licencia;
        set
        {
            if (value.Length != 10 || !char.IsAsciiLetter(value[0]) || !value.Skip(1).All(char.IsAsciiDigit))
                throw new ArgumentException("La licencia debe tener una letra seguida de 9 digitos.");
            _licencia = value;
        }
    }

    public DateTime VencimientoCedula { get; set; }
    public DateTime VencimientoLicencia { get; set; }
}
