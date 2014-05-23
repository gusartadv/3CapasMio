using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class AccesoDatos
    {

        public int Insert(string Nombre, string Apellido, int Edad)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc();
            _comando.Parameters.AddWithValue("@nombre", Nombre);
            _comando.Parameters.AddWithValue("@apellido", Apellido);
            _comando.Parameters.AddWithValue("@edad", Edad);
            return MetodosDatos.EjecutarComandoInsert(_comando);
        }


        public static DataTable ObtenerEmpleados()
        {
            SqlCommand _comando = MetodosDatos.CrearComando();
            _comando.CommandText = "selectAspirante2";
            return MetodosDatos.EjecutarComandoSelect(_comando);
        }

    }
}
