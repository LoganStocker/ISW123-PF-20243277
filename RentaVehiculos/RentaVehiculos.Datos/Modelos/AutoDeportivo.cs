namespace RentaVehiculos.Datos.Modelos;

public class AutoDeportivo : Vehiculo
{
    private int _caballosFuerza;

    public int CaballosFuerza
    {
        get => _caballosFuerza;
        set
        {
            if (value <= 0)
                throw new ArgumentException("Los caballos de fuerza deben ser mayores que 0.");
            _caballosFuerza = value;
        }
    }

    public override string Descripcion()
    {
        return $"{Marca} {Modelo} (auto deportivo, {CaballosFuerza} HP), placa {Placa}";
    }
}
