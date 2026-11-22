namespace RentaVehiculos.Datos.Modelos;

public class ReglaNegocioException : Exception
{
    public int NumeroRegla { get; }

    public ReglaNegocioException(int numeroRegla, string mensaje) : base(mensaje)
    {
        NumeroRegla = numeroRegla;
    }
}
