using Microsoft.Data.SqlClient;

namespace RentaVehiculos.Datos.ConexionesCambiosDB;

public static class ConexionBD
{
    private const string CadenaConexion =
        "Server=.;Database=RentaVehiculosDB;Trusted_Connection=True;TrustServerCertificate=True;";

    public static SqlConnection CrearConexion()
    {
        return new SqlConnection(CadenaConexion);
    }
}
