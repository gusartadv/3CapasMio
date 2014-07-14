using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Text;

namespace Presentacion
{
    public partial class Estudios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int operacion = 1;
            StringBuilder sb = new StringBuilder();
             switch(operacion)
            {
                 case 1:
                    
                    sb.Append(@"Texto del stringBuilder");
                 break;
                 
                 default:
                 sb.Append(@"No agrego nada");
                 break;
            }
            
        }

        
    }
}