using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Datos;

namespace Negocio
{
    public class Referencia
    {
        public static void NregistrarReferencia(string documento, string nombres, string apellidos, string tipoReferencia, string telefono, string movil)
        {
            Datos.ConnectionClass.registrarReferencia( documento,  nombres,  apellidos,  tipoReferencia,  telefono,  movil);
        }

        public static DataTable NDatosReferencia()
        {
            return ConnectionClass.datosReferencia();
        }
    }
}
