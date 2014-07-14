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
        int operacion = 1;
        StringBuilder sb = new StringBuilder();
        switch (operacion)
        {
            case 1:

                sb.Append(string.Format(@"Texto del stringBuilder"));
                break;

            default:
                sb.Append(string.Format(@"No agrego nada"));
                break;
        }
        LabelSb.Text = sb.ToString();
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
        string lectura ="";
        string conversacion ="";
        string escritura ="";
        
        if (RadioButton1.Checked) lectura = "B" ;
        if (RadioButton2.Checked) lectura = "R";
        if (RadioButton3.Checked) lectura = "M";    
        if (RadioButton4.Checked) conversacion = "B";
        if (RadioButton5.Checked) conversacion = "R";
        if (RadioButton6.Checked) conversacion = "M";
        if (RadioButton7.Checked) escritura = "B";
        if (RadioButton8.Checked) escritura = "R";
        if (RadioButton9.Checked) escritura = "M";

        Negocio.Estudio.NinsertarIdioma(documento, TBIdioma.Text, lectura, conversacion, escritura, TBNivel.Text, TBInstitucion.Text);
    }
</script>




<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
            <h1 class="page-header">Estudios</h1>
            <div class="row" style="padding-top:5px;">          
                <div class="col-md-3" style="background-color:;">
                    <div class="row">
                        <div class="col-md-12">
                            <label>Nivel Educativo</label>
                            <asp:TextBox ID="TbNivEdu" class="form-control input-sm" runat="server"></asp:TextBox>                     
                        </div>
                        <div class="col-md-12">
                            <label>Fecha De Terminacion</label>
                            <asp:TextBox ID="TbFecTer" class="form-control input-sm" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="TbFecTer_CalendarExtender" runat="server" TargetControlID="TbFecTer" Format="yyyy/MM/dd">   
                            </asp:CalendarExtender>                     
                        </div>
                        <div class="col-md-12">
                            <label>Institucion</label>
                            <asp:TextBox ID="TbIns" class="form-control input-sm" runat="server"></asp:TextBox>                     
                        </div>                        
                        <div class="col-md-12">
                            <label>Estudial Actualmente</label>
                            <asp:DropDownList ID="DdlEstAct" class="form-control input-sm" runat="server">
                                <asp:ListItem>Seleccione</asp:ListItem>
                                <asp:ListItem Value="1">Si</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>                    
                        </div>
                        <div class="col-md-12">
                            <label>Titulo obtenido</label>
                            <asp:TextBox ID="TbTitObt" class="form-control input-sm" runat="server"></asp:TextBox>                      
                        </div> 
                        <div class="col-md-12" style="padding-top:8px;">
                            <asp:Button ID="Guardar" class="btn btn-primary" runat="server" OnClick="Guardar_Click" Text="Guardar"  />
                        </div>                                           
                    </div>                
                </div>
            <div class="col-md-9" ></div>
            </div>

    <br />
            <h1 class="page-header">Otros Estudios</h1>
            <div class="row" style="padding-top:5px;">          
                <div class="col-md-3" style="background-color:;">
                    <div class="row">
                        <div class="col-md-12">
                            <label>Nombre</label>
                            <asp:TextBox ID="TBNombreOtrEst" runat="server" class="form-control input-sm"></asp:TextBox>                      
                        </div>
                        <div class="col-md-12">
                            <label>Tipo</label>
                            <asp:DropDownList ID="DDTipOtrEst" runat="server" class="form-control input-sm">
                                <asp:ListItem>Seleccione</asp:ListItem>
                                <asp:ListItem Value="Cursos">Cursos</asp:ListItem>
                                <asp:ListItem Value="Seminario">Seminario</asp:ListItem>
                                <asp:ListItem>Taller</asp:ListItem>
                                <asp:ListItem>Otros</asp:ListItem>
                            </asp:DropDownList>                  
                        </div>
                        <div class="col-md-12">
                            <label>Fecha De Terminacion</label>
                            <asp:TextBox ID="TBFecTerOtrEst" class="form-control input-sm" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="TBFecTerOtrEst_CalendarExtender" runat="server" TargetControlID="TBFecTerOtrEst" Format="yyyy/MM/dd">
                            </asp:CalendarExtender>                   
                        </div>                        

                        <div class="col-md-12" style="padding-top:8px;">
                            <asp:Button ID="GuardarOtroEstudio" class="btn btn-primary" runat="server" OnClick="GuardarOtroEstudio_Click" Text="Guardar" /> 
                        </div>                        
                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>                  
                    </div>                
                </div>
            <div class="col-md-9" ></div>
            </div>

    <br />
    
    <h1 class="page-header">Postgrados Especializaciones Maestrias</h1>
            <div class="row" style="padding-top:5px;">          
                <div class="col-md-3" style="background-color:;">
                    <div class="row">
                        <div class="col-md-12">
                            <label>Area de Estudio</label>
                            <asp:DropDownList ID="DDAreEst" class="form-control input-sm" runat="server">
                                <asp:ListItem>Seleccione</asp:ListItem>
                                <asp:ListItem>Postgrado</asp:ListItem>
                                <asp:ListItem>Maestria</asp:ListItem>
                                <asp:ListItem>Especializacion</asp:ListItem>
                                <asp:ListItem>Doctorado</asp:ListItem>
                            </asp:DropDownList>                
                        </div>
                         <div class="col-md-12">
                            <label>Estudial Actualmente</label>
                            <asp:DropDownList ID="DDEstAct" class="form-control input-sm" runat="server">
                                <asp:ListItem>Seleccione</asp:ListItem>
                                <asp:ListItem Value="1">Si</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>                     
                        </div>
                        <div class="col-md-12">
                            <label>No. Semestres Aprobados</label>
                            <asp:TextBox ID="TBNumSem" class="form-control input-sm" runat="server"></asp:TextBox>                      
                        </div>
                        <div class="col-md-12">
                            <label>Titulo Obtenido</label>
                            <asp:TextBox ID="TBTitObtPos" class="form-control input-sm" runat="server"></asp:TextBox>                     
                        </div>
                        <div class="col-md-12">
                            <label>Nombre de la Institucion</label>
                            <asp:TextBox ID="TBNomIns" class="form-control input-sm" runat="server"></asp:TextBox>                    
                        </div>
                        <div class="col-md-12">
                            <label>Pais</label>
                            <asp:TextBox ID="TBPais" class="form-control input-sm" runat="server"></asp:TextBox>                    
                        </div>  
                        <div class="col-md-12">
                            <label>Ciudad</label>
                            <asp:TextBox ID="TBCiudad" class="form-control input-sm" runat="server"></asp:TextBox>                    
                        </div>                          

                        <div class="col-md-12" style="padding-top:8px;">
                            <asp:Button ID="BtnGuardarPost" class="btn btn-primary" runat="server" OnClick="BtnGuardarPost_Click" Text="Guardar" /> 
                        </div>                        
                        <asp:Label ID="LabelSb" runat="server" Text=""></asp:Label>                   
                    </div>                
                </div>
            <div class="col-md-9" ></div>
            </div>


        <br/>

            <h1 class="page-header">Idiomas</h1>
            
            <div class="panel panel-primary" style="margin-top:40px;">
                <div class="panel-heading">
                    <div class="panel-title">Idioma</div>
                </div>   
                <table border="1" cellspalcing="1" class="table table-bordered table-hover tableh table-condensed">
                  <tr>
                    <td></td>
                    <td colspan="3" class="centrado">Lectura</td>
                    <td colspan="3" class="centrado">Conversacion</td>
                    <td colspan="3" class="centrado">Escritura</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td >Idioma</td>
                    <td class="centrado">B</td>
                    <td class="centrado">R</td>
                    <td class="centrado">M</td>
                    <td class="centrado">B</td>
                    <td class="centrado">R</td>
                    <td class="centrado">M</td>
                    <td class="centrado">B</td>
                    <td class="centrado">R</td>
                    <td class="centrado">M</td>
                    <td>Nivel</td>
                    <td>Institucion</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>
                      <asp:TextBox ID="TBIdioma" class="form-control input-sm" runat="server"></asp:TextBox> 
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="uno"   />
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="uno"   />  
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="uno"   />
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="dos"   />
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton5" runat="server" GroupName="dos"   />
                    </td>
                    <td class="centrado">
                       <asp:RadioButton ID="RadioButton6" runat="server" GroupName="dos"   />
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton7" runat="server" GroupName="tres"   />
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton8" runat="server" GroupName="tres"   />
                    </td>
                    <td class="centrado">
                        <asp:RadioButton ID="RadioButton9" runat="server" GroupName="tres"   />
                    </td>
                    <td>
                        <asp:TextBox ID="TBNivel" class="form-control input-sm" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TBInstitucion" class="form-control input-sm" runat="server"></asp:TextBox>
                    </td>
                    <td class="centrado">
                        <asp:Button ID="BtnGuardarIdioma" class="btn btn-primary" runat="server" Text="Guardar" OnClick="BtnGuardarIdioma_Click" />
                    </td>
                  </tr>
                 <!-- <tr>
                      <td>Ingles</td>
                      <td>B</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td>R</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td>M</td>
                      <td>Medio</td>
                      <td>Sena</td>
                      <td></td>
                  </tr>-->
                </table>
            </div>

   
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    
</asp:Content>


