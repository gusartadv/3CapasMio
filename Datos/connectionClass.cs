using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections;
//using System.Windows.Forms;
using System.Data;

/// <summary>
/// Descripción breve de ConnectionClass
/// </summary>
/// 
namespace Datos
{
    public class ConnectionClass
    {

        private static SqlConnection conn;
        private static SqlCommand command;

        static ConnectionClass()
        {

            string connectionString = ConfigurationManager.ConnectionStrings["SelectorConnectionString"].ToString();
            conn = new SqlConnection(connectionString);
            command = new SqlCommand("", conn);

        }

        public static DataTable getDatos(int documento)
        {
            /*  DataTable tabla = new DataTable();
              string query = string.Format("SELECT * FROM Aspirante WHERE numDocumento LIKE " + documento);

        
              conn.Open();
              command.CommandText = query;

              SqlDataAdapter adaptadorTabla = new SqlDataAdapter(query, conn);
                adaptadorTabla.Fill(tabla);
                return tabla;*/


            DataTable tabla = new DataTable();
            string query = "selectAspirante";


            conn.Open(); ///abro la conexion
            command.CommandText = query;  ///le indico que el procedimiento se llama selectAspirante
            command.CommandType = System.Data.CommandType.StoredProcedure; ///le indico que se utilizara un procedimiento almacenado
            command.Parameters.AddWithValue("@documento", documento);  ///le paso el parametro que requiere el procedimiento
            SqlDataReader DataReaderExecutador = command.ExecuteReader();  ///leo el resultado
            tabla.Load(DataReaderExecutador);  //// cargo el resultado en una tabla
            command.Parameters.Clear();
            conn.Close();
            return tabla;          ////retorno la tabla


        }

        public static DataTable getDatos2()
        {
            /*  DataTable tabla = new DataTable();
              string query = string.Format("SELECT * FROM Aspirante WHERE numDocumento LIKE " + documento);

        
              conn.Open();
              command.CommandText = query;

              SqlDataAdapter adaptadorTabla = new SqlDataAdapter(query, conn);
                adaptadorTabla.Fill(tabla);
                return tabla;*/


            DataTable tabla = new DataTable();
            string query = "selectAspirante2";


            conn.Open(); ///abro la conexion
            command.CommandText = query;  ///le indico que el procedimiento se llama selectAspirante
            command.CommandType = System.Data.CommandType.StoredProcedure; ///le indico que se utilizara un procedimiento almacenado
            //command.Parameters.AddWithValue("@documento", documento);  ///le paso el parametro que requiere el procedimiento
            SqlDataReader DataReaderExecutador = command.ExecuteReader();  ///leo el resultado
            tabla.Load(DataReaderExecutador);  //// cargo el resultado en una tabla
            command.Parameters.Clear();
            conn.Close();
            return tabla;          ////retorno la tabla


        }

        public static void deleteDatos(string documento)
        {
            string query = "deleteAspirante";
            command.CommandText = query;
            conn.Open();
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@documento", documento);
            command.ExecuteNonQuery();          //ejecuto el comando

            conn.Close();
            command.Parameters.Clear(); // importante limpiar para no generar errores por tener demasiados parametros

        }

        public static void updateDatos(string documento, string nombres, string apellidos, string tipoDocumento, DateTime fechaNacimiento,
            string grupoSanguineo, string estadoCivil, string genero, string numLibretaMilitar, string claseLibreta, string numeroHijos,
            string paisOrigen, string paisResidencia, string departamento, string ciudad, string barrio, string telefono, string direccion,
            string telefonoMovil, string personaContacto, string numPersonaContacto, string cargoAplica, string aspiracionSalarial, string foto)
        {
            string query = "updateAspirante";
            command.CommandText = query;

            conn.Open();
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@documento", documento);
            command.Parameters.AddWithValue("@nombres", nombres);
            command.Parameters.AddWithValue("@apellidos", apellidos);
            command.Parameters.AddWithValue("@tipoDocumento", tipoDocumento);
            command.Parameters.AddWithValue("@fechaNacimiento", fechaNacimiento);
            command.Parameters.AddWithValue("@grupoSanguineo", grupoSanguineo);
            command.Parameters.AddWithValue("@estadoCivil", estadoCivil);
            command.Parameters.AddWithValue("@genero", genero);
            command.Parameters.AddWithValue("@numLibretaMilitar", numLibretaMilitar);
            command.Parameters.AddWithValue("@claseLibreta", claseLibreta);
            command.Parameters.AddWithValue("@numeroHijos", numeroHijos);
            command.Parameters.AddWithValue("@paisOrigen", paisOrigen);
            command.Parameters.AddWithValue("@paisResidencia", paisResidencia);
            command.Parameters.AddWithValue("@departamento", departamento);
            command.Parameters.AddWithValue("@ciudad", ciudad);
            command.Parameters.AddWithValue("@barrio", barrio);
            command.Parameters.AddWithValue("@telefono", telefono);
            command.Parameters.AddWithValue("@direccion", direccion);
            command.Parameters.AddWithValue("@telefonoMovil", telefonoMovil);
            command.Parameters.AddWithValue("@personaContacto", personaContacto);
            command.Parameters.AddWithValue("@numPersonaContacto", numPersonaContacto);
            command.Parameters.AddWithValue("@cargoAplica", cargoAplica);
            command.Parameters.AddWithValue("@aspiracionSalarial", aspiracionSalarial);
            command.Parameters.AddWithValue("@foto", foto);
            command.ExecuteNonQuery();          //ejecuto el comando
            conn.Close();
            command.Parameters.Clear();
        }

        public static void insertDatos(string documento, string nombres, string apellidos, string tipoDocumento, DateTime fechaNacimiento,
         string grupoSanguineo, string estadoCivil, string genero, string numLibretaMilitar, string claseLibreta, string numeroHijos,
         string paisOrigen, string paisResidencia, string departamento, string ciudad, string barrio, string telefono, string direccion,
         string telefonoMovil, string personaContacto, string numPersonaContacto, string cargoAplica, string aspiracionSalarial, string foto)
        {
            string query = "insertAspirante";
            command.CommandText = query;

            conn.Open();
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@documento", documento);
            command.Parameters.AddWithValue("@nombres", nombres);
            command.Parameters.AddWithValue("@apellidos", apellidos);
            command.Parameters.AddWithValue("@tipoDocumento", tipoDocumento);
            command.Parameters.AddWithValue("@fechaNacimiento", fechaNacimiento);
            command.Parameters.AddWithValue("@grupoSanguineo", grupoSanguineo);
            command.Parameters.AddWithValue("@estadoCivil", estadoCivil);
            command.Parameters.AddWithValue("@genero", genero);
            command.Parameters.AddWithValue("@numLibretaMilitar", numLibretaMilitar);
            command.Parameters.AddWithValue("@claseLibreta", claseLibreta);
            command.Parameters.AddWithValue("@numeroHijos", numeroHijos);
            command.Parameters.AddWithValue("@paisOrigen", paisOrigen);
            command.Parameters.AddWithValue("@paisResidencia", paisResidencia);
            command.Parameters.AddWithValue("@departamento", departamento);
            command.Parameters.AddWithValue("@ciudad", ciudad);
            command.Parameters.AddWithValue("@barrio", barrio);
            command.Parameters.AddWithValue("@telefono", telefono);
            command.Parameters.AddWithValue("@direccion", direccion);
            command.Parameters.AddWithValue("@telefonoMovil", telefonoMovil);
            command.Parameters.AddWithValue("@personaContacto", personaContacto);
            command.Parameters.AddWithValue("@numPersonaContacto", numPersonaContacto);
            command.Parameters.AddWithValue("@cargoAplica", cargoAplica);
            command.Parameters.AddWithValue("@aspiracionSalarial", aspiracionSalarial);
            command.Parameters.AddWithValue("@foto", foto);
            command.ExecuteNonQuery();          //ejecuto el comando
            conn.Close();
            command.Parameters.Clear();
        }

        public static int verificar(int documento)
        {
            string query = "verificarExistencia";
            command.CommandText = query;
            command.CommandType = CommandType.StoredProcedure;
            conn.Open();

            command.Parameters.AddWithValue("@documento", documento);
            int numero = (int)(command.ExecuteScalar());
            conn.Close();
            command.Parameters.Clear();
            return numero;



        }

        public static void RegistrarUsuario(string documento, string email, string password)
        {
            string query = "RegistrarUsuario";
            command.CommandText = query;

            conn.Open();
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@documento", documento);
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@pass", password);
            command.ExecuteNonQuery();
            conn.Close();
            command.Parameters.Clear();

        }


        public static int verificarUsuario(string documento)
        {
            string query = "verificarUsuario";
            command.CommandText = query;
            conn.Open();

            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@documento", documento);
            int existe = (int)(command.ExecuteScalar());
            command.Parameters.Clear();
            conn.Close();
            return existe;
        }

        public static DataTable datosUsuario(string login, string pass)
        {
            DataTable datosDelUsuario = new DataTable();

            string query = "login";
            command.CommandText = query;
            conn.Open();

            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@login", login);
            command.Parameters.AddWithValue("@pass", pass);
            SqlDataReader dr = command.ExecuteReader();
            if (dr.HasRows)
            {
                datosDelUsuario.Load(dr);
                command.Parameters.Clear();
                conn.Close();
                return datosDelUsuario;
            }
            else
                command.Parameters.Clear();
                conn.Close();
                return null;
            



        }

        public static void registrarEstudio(string documento, string nivelEducativo, DateTime fechaTerminacion, string institucion, string estudiaActualmente, string tituloObtenido)
        {
            string query = "registrarEstudio";
            command.CommandText = query;
            conn.Open();

            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@documento", documento);
            command.Parameters.AddWithValue("@nivelEducativo", nivelEducativo);
            command.Parameters.AddWithValue("@fechaTerminacion", fechaTerminacion);
            command.Parameters.AddWithValue("@institucion", institucion);
            command.Parameters.AddWithValue("@estudiaActualmente", estudiaActualmente);
            command.Parameters.AddWithValue("@tituloObtenido", tituloObtenido);
            command.ExecuteNonQuery();
            command.Parameters.Clear();
            conn.Close();
            
        }

        public static void registrarOtroEstudio(string documento, string nombre, string tipo,  DateTime fechaTerminacion)
        {
            string query = "InsertarOtroEstudio";
            command.CommandText = query;
            conn.Open();

            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@documento", documento);
            command.Parameters.AddWithValue("@nombre", nombre);
            command.Parameters.AddWithValue("@tipo", tipo);
            command.Parameters.AddWithValue("@fecha", fechaTerminacion);
            
            command.ExecuteNonQuery();
            command.Parameters.Clear();
            conn.Close();

        
    }

        public static void registrarPostgrado(string documento, string areaEstudio,string  estudiaActualmente, string numSemAprodos,
            string tituloObtenido, string nombreInstitucion,string  pais, string ciudad)
        {
            string query = "InsertarPostgrado";
            command.CommandText = query;
            conn.Open();

                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@documento", documento);
                command.Parameters.AddWithValue("@areaEstudio", areaEstudio);
                command.Parameters.AddWithValue("@estudiaActualmente", estudiaActualmente);
                command.Parameters.AddWithValue("@numeroSemestresAprobados", numSemAprodos);
                command.Parameters.AddWithValue("@tituloObtenido",tituloObtenido);
                command.Parameters.AddWithValue("@nombreInstitucion", nombreInstitucion);
                command.Parameters.AddWithValue("@pais", pais);
                command.Parameters.AddWithValue("@ciudad", ciudad);
            
                command.ExecuteNonQuery();
                command.Parameters.Clear();
                conn.Close();
        }

    public static void insertarIdioma(string documento, string idioma, string lectura,  string conversacion,  string escritura, string nivel, string institucion)
    {
        string query = "insertarIdioma";

        command.CommandText = query;
        conn.Open();

        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@documento", documento);
        command.Parameters.AddWithValue("@idioma", idioma);
        command.Parameters.AddWithValue("@lectura", lectura);
        command.Parameters.AddWithValue("@conversacion", conversacion);
        command.Parameters.AddWithValue("@escritura", escritura);
        command.Parameters.AddWithValue("@nivel", nivel);
        command.Parameters.AddWithValue("@institucion", institucion );

        command.ExecuteNonQuery();
        command.Parameters.Clear();
        conn.Close();



    }

    public static ArrayList arregloTabla()
    {
        string query = "PruebaTablaD";
        ArrayList orderList = new ArrayList();
        command.CommandText = query;
        conn.Open();
        command.CommandType = CommandType.StoredProcedure;
        SqlDataReader dr = command.ExecuteReader();
        while (dr.Read())
            {
                int doc = dr.GetInt32(0);           
                string niv = dr.GetString(1);
                string ins = dr.GetString(2);
                string tit = dr.GetString(3);
                
                TablaDinamica tabla = new TablaDinamica(doc, niv, ins, tit);
                orderList.Add(tabla);
            }
        conn.Close();
        command.Parameters.Clear();
        return orderList;
    }

    public static void registrarReferencia(string documento, string nombres, string apellidos, string tipoReferencia, string telefono, string movil)
    {
        string query = "InsertarReferencia";
        conn.Open();
        command.CommandText = query;

        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@dcoumento", documento);
        command.Parameters.AddWithValue("@nombres", nombres);
        command.Parameters.AddWithValue("@apellidos", apellidos);
        command.Parameters.AddWithValue("@tipoReferencia", tipoReferencia);
        command.Parameters.AddWithValue("@telefono", telefono);
        command.Parameters.AddWithValue("@movil", movil);
        command.ExecuteNonQuery();
        command.Parameters.Clear();
        conn.Close();
    }
        


        public static DataTable datosReferencia()
        {
            /*  DataTable tabla = new DataTable();
              string query = string.Format("SELECT * FROM Aspirante WHERE numDocumento LIKE " + documento);

        
              conn.Open();
              command.CommandText = query;

              SqlDataAdapter adaptadorTabla = new SqlDataAdapter(query, conn);
                adaptadorTabla.Fill(tabla);
                return tabla;*/


            DataTable tabla = new DataTable();
            string query = "DatosReferencia";


            conn.Open(); ///abro la conexion
            command.CommandText = query;  ///le indico que el procedimiento se llama selectAspirante
            command.CommandType = System.Data.CommandType.StoredProcedure; ///le indico que se utilizara un procedimiento almacenado
            //command.Parameters.AddWithValue("@documento", documento);  ///le paso el parametro que requiere el procedimiento
            SqlDataReader DataReaderExecutador = command.ExecuteReader();  ///leo el resultado
            tabla.Load(DataReaderExecutador);  //// cargo el resultado en una tabla
            command.Parameters.Clear();
            conn.Close();
            return tabla;          ////retorno la tabla


        }

        public static void deleteReferencia(string idReferencia)
        {
            string query = "deleteReferencia";
            command.CommandText = query;
            conn.Open();
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@idReferencia", idReferencia);
            command.ExecuteNonQuery();          //ejecuto el comando

            conn.Close();
            command.Parameters.Clear(); // importante limpiar para no generar errores por tener demasiados parametros

        }


        public static void actualizarReferencia(string idReferencia, string documento, string nombre, string apellidos, string tipoReferencia, string telefono, string movil)
        {
            string query = "updateReferencias";
            command.CommandText = query;



            conn.Open();
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@idReferencia", idReferencia);
            command.Parameters.AddWithValue("@documento", documento);
            command.Parameters.AddWithValue("@nombres", nombre);
            command.Parameters.AddWithValue("@apellidos", apellidos);
            command.Parameters.AddWithValue("@tipoReferencia", tipoReferencia);
            command.Parameters.AddWithValue("@telefono", telefono);
            command.Parameters.AddWithValue("@movil", movil);
            command.ExecuteNonQuery();
            conn.Close();
            command.Parameters.Clear();

        }



    }


    
}