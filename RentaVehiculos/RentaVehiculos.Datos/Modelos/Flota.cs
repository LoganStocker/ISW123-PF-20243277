using System.Collections;

namespace RentaVehiculos.Datos.Modelos;

public class Flota : IEnumerable<Vehiculo>
{
    private readonly List<Vehiculo> _vehiculos = new();

    public void Agregar(Vehiculo vehiculo)
    {
        ArgumentNullException.ThrowIfNull(vehiculo);
        _vehiculos.Add(vehiculo);
    }

    public IEnumerator<Vehiculo> GetEnumerator()
    {
        foreach (var vehiculo in _vehiculos)
            yield return vehiculo;
    }

    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
}
