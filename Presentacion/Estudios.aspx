<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraBootstrap.master" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<script runat="server">
    
    private void limpiarCampos()
    {

        //Limpiar de manera rapida

        foreach (Control c in this.Controls)
        {

            if (c is TextBox)
            {

                TextBox txt = (TextBox)c;

                txt.Text = "";



            }

        }

    }
    


    protected void Guardar_Click(object sender, EventArgs e)
    {
            

          string documento = Session["doc"].ToString();
          Negocio.Estudio.registrarEstudio(documento, TbNivEdu.Text, Convert.ToDateTime(TbFecTer.Text), TbIns.Text, DdlEstAct.Text, TbTitObt.Text);
          limpiarCampos();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void GuardarOtroEstudio_Click(object sender, EventArgs e)
    {
         string documento = Session["doc"].ToString();
         Negocio.Estudio.NregistrarOtroEstudio(documento,TBNombreOtrEst.Text, DDTipOtrEst.Text, Convert.ToDateTime(TBFecTerOtrEst.Text));
        // limpiarCampos();
    }

    protected void BtnGuardarPost_Click(object sender, EventArgs e)
    {
        string documento = Session["doc"].ToString();
        Negocio.Estudio.NregistrarPostgrado(documento, DDAreEst.Text, DDEstAct.Text, TBNumSem.Text, TBTitObtPos.Text, TBNomIns.Text, TBPais.Text, TBCiudad.Text);
    }

    protected void BtnGuardarIdioma_Click(object sender, EventArgs e)
    {
        string documento = Session["doc"].ToString();
        string lectura;
        string conversacion;
        string escritura;
        
        if (RadioButton1.Checked) lectura = "B" ;
        if (RadioButton2.Checked) lectura = "R";
        else lectura = "M";
        if (RadioButton4.Checked) conversacion = "B";
        if (RadioButton5.Checked) conversacion = "R";
        else conversacion = "M";
        if (RadioButton7.Checked) escritura = "B";
        if (RadioButton8.Checked) escritura = "R";
        else escritura = "M";

        Negocio.Estudio.NinsertarIdioma(documento, TBIdioma.Text, lectura, conversacion, escritura, TBNivel.Text, TBInstitucion.Text);
    }
</script>




<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <table border="0" cellspalcing="1">
         <tr>
            <td>
            Estudios
            </td>
        </tr>
        <tr>
            <td>
                Nivel Educativo:
            </td>
            <td>
                <asp:TextBox ID="TbNivEdu" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                Fecha de Terminacion:</td>
            <td>
                <asp:TextBox ID="TbFecTer" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="TbFecTer_CalendarExtender" runat="server" TargetControlID="TbFecTer" Format="yyyy/MM/dd">
                </asp:CalendarExtender>
            </td>
        </tr>
         <tr>
            <td>
                Institucion:</td>
            <td>
                <asp:TextBox ID="TbIns" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                Estudia Actualmente:</td>
            <td>
                <asp:DropDownList ID="DdlEstAct" runat="server">
                    <asp:ListItem>Seleccione</asp:ListItem>
                    <asp:ListItem Value="1">Si</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
         <tr>
            <td>
                Titulo Obtenido:</td>
            <td>
                <asp:TextBox ID="TbTitObt" runat="server"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="Guardar" runat="server" OnClick="Guardar_Click" Text="Guardar" />
            </td>
        </tr>
    </table>

    <br />
    <br />

    <table border="0" cellspalcing="1">
        <tr>
            <td>
            Otros Estudios
            </td>
        </tr>
         <tr>
            <td>
                Nombre:
            </td>
            <td>
                <asp:TextBox ID="TBNombreOtrEst" runat="server"></asp:TextBox>
            </td>
        </tr>

         <tr>
            <td>
                Tipo:</td>
            <td>
                <asp:DropDownList ID="DDTipOtrEst" runat="server">
                    <asp:ListItem>Seleccione</asp:ListItem>
                    <asp:ListItem Value="Cursos">Cursos</asp:ListItem>
                    <asp:ListItem Value="Seminario">Seminario</asp:ListItem>
                    <asp:ListItem>Taller</asp:ListItem>
                    <asp:ListItem>Otros</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

         <tr>
            <td>
                Fecha de Terminacion:<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
             </td>
            <td>
                <asp:TextBox ID="TBFecTerOtrEst" runat="server"></asp:TextBox>
                
                <asp:CalendarExtender ID="TBFecTerOtrEst_CalendarExtender" runat="server" TargetControlID="TBFecTerOtrEst" Format="yyyy/MM/dd">
                </asp:CalendarExtender>
                
            </td>
        </tr>
         
        
        
         <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="GuardarOtroEstudio" runat="server" OnClick="GuardarOtroEstudio_Click" Text="Guardar" />
            </td>
        </tr>
    </table>
    <br />
    <br />
     <table border="0" cellspalcing="1">
        <tr>
            <td>Postgrados - Especializaciones - Maestrias</td>
            
        </tr>
         <tr>
            <td>Area de estudio:</td>
            <td>
                <asp:DropDownList ID="DDAreEst" runat="server">
                    <asp:ListItem>Seleccione</asp:ListItem>
                    <asp:ListItem>Postgrado</asp:ListItem>
                    <asp:ListItem>Maestria</asp:ListItem>
                    <asp:ListItem>Especializacion</asp:ListItem>
                    <asp:ListItem>Doctorado</asp:ListItem>
                </asp:DropDownList>
             </td>
        </tr>
         <tr>
            <td>Estudia Actualmente:</td>
            <td>
                <asp:DropDownList ID="DDEstAct" runat="server">
                    <asp:ListItem>Seleccione</asp:ListItem>
                    <asp:ListItem Value="1">Si</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:DropDownList>
             </td>
        </tr>
         <tr>
            <td>Numero de Semestres Aprobados:</td>
            <td>
                <asp:TextBox ID="TBNumSem" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Titulo Obtenido:</td>
            <td>
                <asp:TextBox ID="TBTitObtPos" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Nombre de la Institucion:</td>
            <td>
                <asp:TextBox ID="TBNomIns" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            <td>Pais:</td>
            <td>
                <asp:TextBox ID="TBPais" runat="server"></asp:TextBox>
             </td>
        </tr>
         <tr>
            
            <td>Ciudad:</td>
             <td>
                 <asp:TextBox ID="TBCiudad" runat="server"></asp:TextBox>
             </td>
        </tr>

         <tr>
            <td></td>
            <td>
                <asp:Button ID="BtnGuardarPost" runat="server" OnClick="BtnGuardarPost_Click" Text="Guardar" />
             </td>
        </tr>

     </table>

    <table border="1" cellspalcing="1">
            <tr>
            <td></td><td colspan="3">Lectura</td><td colspan="3">Conversacion</td><td colspan="3">Escritura</td><td>&nbsp;</td><td>&nbsp;</td><td></td>

            </tr>
            <tr>
            <td>Idioma</td><td>B</td><td>R</td><td>M</td><td>B</td><td>R</td><td>M</td><td>B</td><td>R</td><td>M</td><td>Nivel</td><td>Institucion</td><td>&nbsp;</td>

            </tr>

            <tr>
            <td>
                <asp:TextBox ID="TBIdioma" runat="server"></asp:TextBox>
                </td><td>
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="uno"   />
                </td><td>
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="uno" />
                </td><td>
                    <asp:RadioButton ID="RadioButton3" runat="server"  GroupName="uno"/>
                </td><td>
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="Dos" />
                </td><td>
                    <asp:RadioButton ID="RadioButton5" runat="server" GroupName="Dos"/>
                </td><td>
                    <asp:RadioButton ID="RadioButton6" runat="server" GroupName="Dos"/>
                </td><td>
                    <asp:RadioButton ID="RadioButton7" runat="server" GroupName="Tres"/>
                </td><td>
                    <asp:RadioButton ID="RadioButton8" runat="server" GroupName="Tres"/>
                </td><td>
                    <asp:RadioButton ID="RadioButton9" runat="server" GroupName="Tres"/>
                </td><td>
                    <asp:TextBox ID="TBNivel" runat="server"></asp:TextBox>
                </td><td>
                    <asp:TextBox ID="TBInstitucion" runat="server"></asp:TextBox>
                </td><td>
                    <asp:Button ID="BtnGuardarIdioma" runat="server" Text="Guardar" OnClick="BtnGuardarIdioma_Click" />
                </td>

            </tr>
     </table>

   
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    
</asp:Content>


