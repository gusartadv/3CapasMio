using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class MaestraBootstrap : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Url.AbsolutePath.EndsWith("Home.aspx"))
            {
                lnkDefault.Attributes["class"] = "active";
            }

            if(Request.Url.AbsolutePath.EndsWith("Estudios.aspx"))
            {
                lnkDefault2.Attributes["class"] = "active";
            }



             if (Session["login"] != null)
            {
                Label1.Text = Session["login"].ToString();
                LinkButton1.Text = " Salir";
            }
            else
                Label1.Text = "bienvenido Invitado";
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        }
    }
