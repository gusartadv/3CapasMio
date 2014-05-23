using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
using Datos;

namespace Negocio
{
    public class Estudio
    {
        public static void registrarEstudio(string documento, string nivelEducativo, DateTime fechaTerminacion, string institucion, string estudiaActualmente, string tituloObtenido)
        {
            ConnectionClass.registrarEstudio(documento, nivelEducativo, fechaTerminacion, institucion, estudiaActualmente, tituloObtenido);
        }

        public static void NregistrarOtroEstudio(string documento, string nombre, string tipo, DateTime fechaTerminacion)
        {
            ConnectionClass.registrarOtroEstudio(documento, nombre, tipo, fechaTerminacion);
        }

        public static void NregistrarPostgrado(string documento, string areaEstudio, string estudiaActualmente, string numSemAprodos,
            string tituloObtenido, string nombreInstitucion, string pais, string ciudad)
        {
            ConnectionClass.registrarPostgrado( documento,  areaEstudio,  estudiaActualmente,  numSemAprodos,
             tituloObtenido,  nombreInstitucion,  pais,  ciudad);
        }

        public static void NinsertarIdioma(string documento, string idioma, string lectura, string conversacion, string escritura, string nivel, string institucion)
        { 
            ConnectionClass.insertarIdioma( documento,  idioma,  lectura,   conversacion,   escritura,  nivel,  institucion);
        }

        public static ArrayList NarregloTabla()
        {
            return ConnectionClass.arregloTabla();
            
        }

    }
}
