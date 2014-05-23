using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Datos;

namespace Negocio
{
    public class Usuario
    {
        public static void RegistrarUsuario(string documento, string email, string pass)
        {
            ConnectionClass.RegistrarUsuario(documento, email, pass);
        }

        public static void RegistrarDatos(string documento, string nombres, string apellidos, string tipoDocumento, DateTime fechaNacimiento,
         string grupoSanguineo, string estadoCivil, string genero, string numLibretaMilitar, string claseLibreta, string numeroHijos,
         string paisOrigen, string paisResidencia, string departamento, string ciudad, string barrio, string telefono, string direccion,
         string telefonoMovil, string personaContacto, string numPersonaContacto, string cargoAplica, string aspiracionSalarial, string foto)
        {
            ConnectionClass.insertDatos(documento, nombres, apellidos, tipoDocumento, fechaNacimiento, grupoSanguineo, estadoCivil, genero, numLibretaMilitar, claseLibreta,
                numeroHijos, paisOrigen, paisResidencia, departamento, ciudad, barrio, telefono, direccion, telefonoMovil, personaContacto, numPersonaContacto, cargoAplica,
                aspiracionSalarial, foto);
        }

        public static int verificarUsuarioLN(string documento)
        {
            return ConnectionClass.verificarUsuario(documento);
        }

        public static DataTable DatosLogin(string login, string pass)
        {
            return ConnectionClass.datosUsuario(login, pass);
        }
    }
}
