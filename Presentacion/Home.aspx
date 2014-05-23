<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraBootstrap.master" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {


        /*string cadenaConexion = ConfigurationManager.ConnectionStrings["SelectorConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection Conexion = new System.Data.SqlClient.SqlConnection();
        Conexion.ConnectionString = cadenaConexion;

        Conexion.Open();
        string query = "SELECT * FROM Aspirante";
        System.Data.SqlClient.SqlCommand comand = new System.Data.SqlClient.SqlCommand(query, Conexion);
        System.Data.DataTable tabla = new System.Data.DataTable();
        System.Data.SqlClient.SqlDataAdapter adaptadorTabla = new System.Data.SqlClient.SqlDataAdapter(query, Conexion);
        adaptadorTabla.Fill(tabla);*/
        
        int ad = Negocio.DatosPersonales.verificarExistencia(Convert.ToInt32(tbDocumento.Text));
        if (ad == 0)
        {
            System.Windows.Forms.MessageBox.Show("No hay ningun usuario con este documento");
        }
        else
        {

            System.Data.DataTable tabla2 = new System.Data.DataTable();
            tabla2 = Negocio.DatosPersonales.tablaDatos(Convert.ToInt32(tbDocumento.Text));
           
           // gv1.DataSource = tabla2;
           // gv1.DataBind();
            
            string numDoc = tabla2.Rows[0]["numDocumento"].ToString();
            tbDocumento.Text = numDoc;

            string nombres = tabla2.Rows[0]["nombres"].ToString();
            tbNombre.Text = nombres;

            string apellidos = tabla2.Rows[0]["apellidos"].ToString();
            tbApellidos.Text = apellidos;
            
            string tipoDocumento = tabla2.Rows[0]["tipoDocumento"].ToString();
            tbTipoDoc.Text = tipoDocumento;

            string fechaNacimiento = tabla2.Rows[0]["fechaNacimiento"].ToString();
            tbFecNac.Text = fechaNacimiento;

            string grupoSanguineo = tabla2.Rows[0]["grupoSanguineo"].ToString();
            tbGruSan.Text = grupoSanguineo;

            string estadoCivil = tabla2.Rows[0]["estadoCivil"].ToString();
            tbEstCiv.Text = estadoCivil;

            string genero = tabla2.Rows[0]["genero"].ToString();
            tbGen.Text = genero;

            string numLibretaMilitar = tabla2.Rows[0]["numLibretaMilitar"].ToString();
            tbNumLib.Text = numLibretaMilitar;

            string claseLibreta = tabla2.Rows[0]["claseLibreta"].ToString();
            tbClaLib.Text = claseLibreta;

            string numeroHijos = tabla2.Rows[0]["numeroHijos"].ToString();
            tbNumHij.Text = numeroHijos;

            string paisOrigen = tabla2.Rows[0]["paisOrigen"].ToString();
            tbPaiOri.Text = paisOrigen;

            string paisResidencia = tabla2.Rows[0]["paisResidencia"].ToString();
            tbPaiRes.Text = paisResidencia;

            string departamento = tabla2.Rows[0]["departamento"].ToString();
            tbDep.Text = departamento;

            string ciudad = tabla2.Rows[0]["ciudad"].ToString();
            tbCiu.Text = ciudad;

            string barrio = tabla2.Rows[0]["barrio"].ToString();
            tbBar.Text = barrio;

            string telefono = tabla2.Rows[0]["telefono"].ToString();
            tbTel.Text = telefono;

            string direccion = tabla2.Rows[0]["direccion"].ToString();
            tbDir.Text = direccion;

            string telefonoMovil = tabla2.Rows[0]["telefonoMovil"].ToString();
            tbTelMov.Text = telefonoMovil;

            string personaContacto = tabla2.Rows[0]["personaContacto"].ToString();
            tbPerCon.Text = personaContacto;

            string numPersonaContacto = tabla2.Rows[0]["numPersonaContacto"].ToString();
            tbNumPerCon.Text = numPersonaContacto;

            string cargoAplica = tabla2.Rows[0]["cargoAplica"].ToString();
            tbCarApl.Text = cargoAplica;

            string aspiracionSalarial = tabla2.Rows[0]["aspiracionSalarial"].ToString();
            tbAspSal.Text = aspiracionSalarial;

            string foto = tabla2.Rows[0]["foto"].ToString();
            tbFot.Text = foto;


        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Negocio.DatosPersonales.eliminarPersona(tbDocumento.Text);
        
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string rutaFoto;
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentLength < 1048576)
            {

                string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "BMP", "GIF", "PNG", "JPG", "JPEG" };
                string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                int fileSize = FileUpload1.PostedFile.ContentLength;
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (!isValidFile)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Invalid File. Please upload a File with extension  " +
                                   string.Join(",", validFileTypes);
                }
                else
                {
                    string fileName = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/img/") + tbDocumento.Text + fileName);
                    rutaFoto = tbDocumento.Text + fileName;

                    Negocio.DatosPersonales.updateDatosPersona(tbDocumento.Text, tbNombre.Text, tbApellidos.Text, tbTipoDoc.Text, Convert.ToDateTime(tbFecNac.Text), tbGruSan.Text, tbEstCiv.Text, tbGen.Text, tbNumLib.Text,
            tbClaLib.Text, tbNumHij.Text, tbPaiOri.Text, tbPaiRes.Text, tbDep.Text, tbCiu.Text, tbBar.Text, tbTel.Text, tbDir.Text, tbTelMov.Text, tbPerCon.Text,
            tbNumPerCon.Text, tbCarApl.Text, tbAspSal.Text, rutaFoto);

                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "File uploaded successfully.";
                    // Response.Redirect(Request.Url.AbsoluteUri);
                }

            }//cierre maximo bytes
            else
                Label1.Text = "La imagen debe tener un tamaño menor a 1mb";
        }//cierre hashfile    
        
        
        
    }
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        
        int ad = Negocio.DatosPersonales.verificarExistencia(Convert.ToInt32(tbDocumento.Text));
        if (ad == 1)
        {
            System.Windows.Forms.MessageBox.Show("No se puede registrar, este documento ya existe en la base de datos.");
        }
        else
        {     
            Negocio.DatosPersonales.insertDatosPersona(tbDocumento.Text, tbNombre.Text, tbApellidos.Text, tbTipoDoc.Text, Convert.ToDateTime(tbFecNac.Text), tbGruSan.Text, tbEstCiv.Text, tbGen.Text, tbNumLib.Text,
                tbClaLib.Text, tbNumHij.Text, tbPaiOri.Text, tbPaiRes.Text, tbDep.Text, tbCiu.Text, tbBar.Text, tbTel.Text, tbDir.Text, tbTelMov.Text, tbPerCon.Text,
                tbNumPerCon.Text, tbCarApl.Text, tbAspSal.Text, tbFot.Text);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["login"] != null)
            {
                //Label1.Text = Session["login"].ToString();
                string log = Session["doc"].ToString();

                //int ad = Negocio.DatosPersonales.verificarExistencia(Convert.ToInt32(log));
                // if (ad == 0)
                //  {
                //System.Windows.Forms.MessageBox.Show("No hay ningun usuario con este documento");
                // }
                // else
                // {

                System.Data.DataTable tabla2 = new System.Data.DataTable();
                tabla2 = Negocio.DatosPersonales.tablaDatos(Convert.ToInt32(log));

                // gv1.DataSource = tabla2;
                // gv1.DataBind();

                string numDoc = tabla2.Rows[0]["numDocumento"].ToString();
                tbDocumento.Text = numDoc;

                string nombres = tabla2.Rows[0]["nombres"].ToString();
                tbNombre.Text = nombres;

                string apellidos = tabla2.Rows[0]["apellidos"].ToString();
                tbApellidos.Text = apellidos;

                string tipoDocumento = tabla2.Rows[0]["tipoDocumento"].ToString();
                tbTipoDoc.Text = tipoDocumento;

                string fechaNacimiento = tabla2.Rows[0]["fechaNacimiento"].ToString();
                tbFecNac.Text = fechaNacimiento;

                string grupoSanguineo = tabla2.Rows[0]["grupoSanguineo"].ToString();
                tbGruSan.Text = grupoSanguineo;

                string estadoCivil = tabla2.Rows[0]["estadoCivil"].ToString();
                tbEstCiv.Text = estadoCivil;

                string genero = tabla2.Rows[0]["genero"].ToString();
                tbGen.Text = genero;

                string numLibretaMilitar = tabla2.Rows[0]["numLibretaMilitar"].ToString();
                tbNumLib.Text = numLibretaMilitar;

                string claseLibreta = tabla2.Rows[0]["claseLibreta"].ToString();
                tbClaLib.Text = claseLibreta;

                string numeroHijos = tabla2.Rows[0]["numeroHijos"].ToString();
                tbNumHij.Text = numeroHijos;

                string paisOrigen = tabla2.Rows[0]["paisOrigen"].ToString();
                tbPaiOri.Text = paisOrigen;

                string paisResidencia = tabla2.Rows[0]["paisResidencia"].ToString();
                tbPaiRes.Text = paisResidencia;

                string departamento = tabla2.Rows[0]["departamento"].ToString();
                tbDep.Text = departamento;

                string ciudad = tabla2.Rows[0]["ciudad"].ToString();
                tbCiu.Text = ciudad;

                string barrio = tabla2.Rows[0]["barrio"].ToString();
                tbBar.Text = barrio;

                string telefono = tabla2.Rows[0]["telefono"].ToString();
                tbTel.Text = telefono;

                string direccion = tabla2.Rows[0]["direccion"].ToString();
                tbDir.Text = direccion;

                string telefonoMovil = tabla2.Rows[0]["telefonoMovil"].ToString();
                tbTelMov.Text = telefonoMovil;

                string personaContacto = tabla2.Rows[0]["personaContacto"].ToString();
                tbPerCon.Text = personaContacto;

                string numPersonaContacto = tabla2.Rows[0]["numPersonaContacto"].ToString();
                tbNumPerCon.Text = numPersonaContacto;

                string cargoAplica = tabla2.Rows[0]["cargoAplica"].ToString();
                tbCarApl.Text = cargoAplica;

                string aspiracionSalarial = tabla2.Rows[0]["aspiracionSalarial"].ToString();
                tbAspSal.Text = aspiracionSalarial;

                string foto = tabla2.Rows[0]["foto"].ToString();
                tbFot.Text = foto;

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <table border="1">
        <tr>
            <td>Cedula: </td>
            <td>
    <asp:TextBox ID="tbDocumento" runat="server" MaxLength="10"></asp:TextBox>
            </td>
            <td><asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" />
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Editar" />
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Insertar" />
            </td>
        </tr>
        <tr>
            <td>Nombres:</td>
            <td style="margin-left: 40px">
    <asp:TextBox ID="tbNombre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Apellidos: </td>
            <td>
    <asp:TextBox ID="tbApellidos" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Tipo Documento:</td>
            <td>
    <asp:TextBox ID="tbTipoDoc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Fecha De Nacimiento:</td>
            <td>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbFecNac" Format="yyyy/MM/dd">
                </asp:CalendarExtender>
                <asp:TextBox ID="tbFecNac" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>Grupo Sanguineo:</td>
            <td>
                <asp:TextBox ID="tbGruSan" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Estado Civil:</td>
            <td>
                <asp:TextBox ID="tbEstCiv" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Genero:</td>
            <td>
                <asp:TextBox ID="tbGen" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>No. Libreta Militar:</td>
            <td>
                <asp:TextBox ID="tbNumLib" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Clase Libreta Militar:</td>
            <td>
                <asp:TextBox ID="tbClaLib" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Numero De Hijos:</td>
            <td>
                <asp:TextBox ID="tbNumHij" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Pais De Origen:</td>
            <td>
                <asp:TextBox ID="tbPaiOri" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Pais De Residencia:</td>
            <td>
                <asp:TextBox ID="tbPaiRes" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Departamento:</td>
            <td>
                <asp:TextBox ID="tbDep" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Ciudad:</td>
            <td>
                <asp:TextBox ID="tbCiu" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Barrio:</td>
            <td>
                <asp:TextBox ID="tbBar" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Telefono:</td>
            <td>
                <asp:TextBox ID="tbTel" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Direccion:</td>
            <td>
                <asp:TextBox ID="tbDir" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Telefono Movil:</td>
            <td>
                <asp:TextBox ID="tbTelMov" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Persona De Contacto:</td>
            <td>
                <asp:TextBox ID="tbPerCon" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>No. Persona De Contacto</td>
            <td>
                <asp:TextBox ID="tbNumPerCon" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Cargo Al Que Aplica:</td>
            <td>
                <asp:TextBox ID="tbCarApl" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Aspiracion Salarial:</td>
            <td>
                <asp:TextBox ID="tbAspSal" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Foto:</td>
            <td>
                <asp:TextBox ID="tbFot" runat="server"></asp:TextBox>

                <asp:FileUpload ID="FileUpload1" runat="server" />

             </td>
        </tr>

    </table>
&nbsp;<br />
    <asp:GridView ID="gv1" runat="server">
    </asp:GridView>
    <br />
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SelectorConnectionString %>" SelectCommand="SELECT * FROM [Aspirante]"></asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <br />
    
</asp:Content>