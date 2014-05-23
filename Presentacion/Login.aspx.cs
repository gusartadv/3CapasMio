using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows.Forms;
using Negocio;

namespace Presentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            DataTable tabla = new DataTable();
            tabla = Negocio.Usuario.DatosLogin(tbEmail.Text, tbpass.Text);
            if (tabla != null)
            {
                Session["login"] = tabla.Rows[0]["email"];
                Session["doc"] = tabla.Rows[0]["documento"];
                Response.Redirect("Home.aspx");
            }
            else
            {
                MessageBox.Show("Usuario o contraseña no validos");
            }

        }
    }
}