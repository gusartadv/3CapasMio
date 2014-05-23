using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Negocio;


namespace Presentacion
{
    public partial class NuevoUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegUsu(object sender, EventArgs e)
        {
                DateTime fecha = Convert.ToDateTime("01/01/1900");
                int numero = Usuario.verificarUsuarioLN(TbDocIde.Text);
                if (numero == 1)
                {
                    MessageBox.Show("El usuario ya se encuentra registrado");
                    DropDownTI.SelectedValue = "Ciudadania";
                }
                else
                {
                    
                    Usuario.RegistrarDatos(TbDocIde.Text, TbNom.Text, TbApellidos.Text, DropDownTI.Text, fecha , "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                    Usuario.RegistrarUsuario(TbDocIde.Text, TbEmail.Text, TbClave.Text);
                    Session["login"] = TbEmail.Text;
                    Session["doc"] = TbDocIde.Text;
                    Response.Redirect("Home.aspx");
                }
        }
    }
}