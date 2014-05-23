using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                gvMostrar(sender, e);
        }

        protected void gvMostrar(object sender, EventArgs e)
        {
            GridView1.DataSource = LogicaNegocio.ObtenerEmpleados();
                
            GridView1.DataBind();
           
        }

        protected void Eliminar(object sender, EventArgs e)
        {
            LogicaNegocio.Eliminar("1116441475");
           
        }

        
    }
}