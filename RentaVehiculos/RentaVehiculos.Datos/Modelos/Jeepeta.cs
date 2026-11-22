namespace RentaVehiculos.Datos.Modelos;

public class Jeepeta : Vehiculo
{
    public bool Tiene4x4 { get; set; }

    public override string Descripcion()
    {
        string traccion = Tiene4x4 ? "con 4x4" : "sin 4x4";
        return $"{Marca} {Modelo} (jeepeta {traccion}), placa {Placa}";
    }
}
