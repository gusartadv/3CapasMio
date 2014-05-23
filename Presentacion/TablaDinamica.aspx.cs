using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Negocio;

namespace Presentacion
{
    public partial class TablaDinamica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          ArrayList mitabla =   Negocio.Estudio.NarregloTabla();
          System.Text.StringBuilder sb = new System.Text.StringBuilder();
          sb.Append(@"<table><tr><td></td></tr>");
          foreach (TablaDinamica tablaDinamica in mitabla)
          {
              sb.Append(string.Format(@"<p>{0}</p><p>{1}</p><p>{2}</p><p>{3}</p>"));
          }
          Label1.Text = sb.ToString();
        }


    }
}