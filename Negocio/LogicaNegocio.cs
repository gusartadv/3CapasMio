using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data.SqlClient;
using System.Collections;
//using System.Windows.Forms;
using System.Data;


namespace Negocio
{
    public class LogicaNegocio
    {
        public static DataTable ObtenerEmpleados()
        {
           // return AccesoDatos.ObtenerEmpleados();
            return ConnectionClass.getDatos2();
        }

        public static void Eliminar(string nombre)
        { 
             ConnectionClass.deleteDatos(nombre);
        }
    }
}
