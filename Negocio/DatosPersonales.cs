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
    public class DatosPersonales
    {
        public static int verificarExistencia(int documento)
        {
            return ConnectionClass.verificar(documento);
        }

        public static DataTable tablaDatos(int documento)
        {
            return ConnectionClass.getDatos(documento);
        }

        public static void eliminarPersona(string documento)
        {
            ConnectionClass.deleteDatos(documento);
        }

        public static void insertDatosPersona(string documento, string nombres, string apellidos, string tipoDocumento, DateTime fechaNacimiento,
         string grupoSanguineo, string estadoCivil, string genero, string numLibretaMilitar, string claseLibreta, string numeroHijos,
         string paisOrigen, string paisResidencia, string departamento, string ciudad, string barrio, string telefono, string direccion,
         string telefonoMovil, string personaContacto, string numPersonaContacto, string cargoAplica, string aspiracionSalarial, string foto)
        {
            ConnectionClass.insertDatos( documento,  nombres,  apellidos,  tipoDocumento,  fechaNacimiento,
          grupoSanguineo,  estadoCivil,  genero,  numLibretaMilitar,  claseLibreta,  numeroHijos,
          paisOrigen,  paisResidencia,  departamento,  ciudad,  barrio,  telefono,  direccion,
          telefonoMovil,  personaContacto,  numPersonaContacto,  cargoAplica,  aspiracionSalarial,  foto);
        }

        public static void updateDatosPersona(string documento, string nombres, string apellidos, string tipoDocumento, DateTime fechaNacimiento,
           string grupoSanguineo, string estadoCivil, string genero, string numLibretaMilitar, string claseLibreta, string numeroHijos,
           string paisOrigen, string paisResidencia, string departamento, string ciudad, string barrio, string telefono, string direccion,
           string telefonoMovil, string personaContacto, string numPersonaContacto, string cargoAplica, string aspiracionSalarial, string foto)
        {
            ConnectionClass.updateDatos(documento, nombres, apellidos, tipoDocumento, fechaNacimiento,
          grupoSanguineo, estadoCivil, genero, numLibretaMilitar, claseLibreta, numeroHijos,
          paisOrigen, paisResidencia, departamento, ciudad, barrio, telefono, direccion,
          telefonoMovil, personaContacto, numPersonaContacto, cargoAplica, aspiracionSalarial, foto);
        }
    }
}
