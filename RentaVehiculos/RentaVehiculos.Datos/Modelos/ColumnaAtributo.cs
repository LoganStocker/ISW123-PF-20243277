namespace RentaVehiculos.Datos.Modelos;

[AttributeUsage(AttributeTargets.Property)]
public class ColumnaAtributo : Attribute
{
    public string Titulo { get; }
    public int Orden { get; }

    public ColumnaAtributo(string titulo, int orden)
    {
        Titulo = titulo;
        Orden = orden;
    }
}
