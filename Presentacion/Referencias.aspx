
<%@ Page Title="" Language="C#" CodeBehind="Referencias.aspx.cs"  MasterPageFile="~/MaestraBootstrap.master"  %>



<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">

 

   <script runat="server">

   
       protected void Page_Load(object sender, EventArgs e)
       {
           BindGrid();
       }

       public void BindGrid()
       {
           System.Data.DataTable GVReferencias = new System.Data.DataTable();
           GVReferencias = Negocio.Referencia.NDatosReferencia();
           GridView1.DataSource = GVReferencias;
           GridView1.DataBind();

       }

       protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
       {
           int index = Convert.ToInt32(e.CommandArgument);

           if (e.CommandName.Equals("editRecord"))
           {
               GridViewRow gvrow = GridView1.Rows[index];
               //lblCountryCode.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
               TBCodRef.Text = HttpUtility.HtmlEncode(gvrow.Cells[2].Text);
               TBNombres.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text); //las celdas se cuentan a partir del cero en la tabla del navegador
               TBApellidos.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
               DDLTipRef.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text);
               TBTelefono.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text);
               TBMovil.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text);
               lblResult.Visible = false;
               System.Text.StringBuilder sb = new System.Text.StringBuilder();
               sb.Append(@"<script type='text/javascript'>");
               sb.Append("$('#editModal').modal('show');</");
               sb.Append(@"script>");
               lblOuput.Text = sb.ToString();
               ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

           }

           else if (e.CommandName.Equals("deleteRecord"))
           {

               string code = GridView1.DataKeys[index].Value.ToString();
               hfCode.Value = code;
               System.Text.StringBuilder sb = new System.Text.StringBuilder();
               sb.Append(@"<script type='text/javascript'>");
               sb.Append("$('#deleteModal').modal('show');</");
               sb.Append(@"script>");
               lblOuput.Text = sb.ToString();
               ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
           }

       }

       protected void btnDelete_Click(object sender, EventArgs e)
       {           
           string code = hfCode.Value;
           executeDelete(code);
           Response.Redirect("Referencias.aspx");
       }

       protected void btnSave_Click(object sender, EventArgs e)
       {
           string documento = Session["doc"].ToString();
           string idReferencia = TBCodRef.Text;
           string nombres = TBNombres.Text;
           string apellidos = TBApellidos.Text;
           string tipoReferencia = DDLTipRef.Text;
           string telefono = TBTelefono.Text;
           string movil = TBMovil.Text;

           executeUpdate(idReferencia, documento, nombres, apellidos, tipoReferencia, telefono, movil);
           Response.Redirect("Referencias.aspx");
       }


       private void executeDelete(string code)
       {
           
           Negocio.Referencia.NDeleteReferencia(code);
       }
       private void executeUpdate(string idReferencia, string documento, string nombre, string apellidos, string tipoReferencia, string telefono, string movil)
       {
           Negocio.Referencia.NactualizarReferencia(idReferencia,documento,nombre,apellidos,tipoReferencia,telefono,movil);
       }
    
</script>
    
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"  AutoGenerateColumns="false" AllowPaging="true"
     CssClass="table table-hover table-striped" OnRowCommand="GridView1_RowCommand" DataKeyNames="idReferencia" >
        <Columns>
                 <asp:ButtonField  CommandName="editRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                 </asp:ButtonField>
                 <asp:ButtonField CommandName="deleteRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Delete" HeaderText="Delete Record">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                 </asp:ButtonField>                            
                 <asp:BoundField DataField="idReferencia" HeaderText="Codigo Referencia"  />
                 <asp:BoundField DataField="nombres" HeaderText="Nombres"  />
                 <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
                 <asp:BoundField DataField="tipoReferencia" HeaderText="Tipo Referencia" />
                 <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                 <asp:BoundField DataField="movil" HeaderText="Movil" />                            
        </Columns>
    </asp:GridView>
                   

     <!-- Delete Record Modal Starts here-->
            <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
                <div class="modal-dialog">
				    <div class="modal-content">
                        <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                             <h3 id="delModalLabel">Delete Record</h3>
                        </div>
                        <asp:UpdatePanel ID="upDel" runat="server">
                            <ContentTemplate>
                                <div class="modal-body">
                                    Are you sure you want to delete the record?
                                    <asp:HiddenField ID="hfCode" runat="server" />
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info"  OnClick="btnDelete_Click"    />
                                    <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <!--Delete Record Modal Ends here -->


        <!-- Edit Modal Starts here -->
            <div id="editModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog">
				    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 id="editModalLabel">Edit Record</h3>
                        </div>
                            
                                <div class="modal-body">
                                    <table class="table">
                                         <tr>
                                            <td><label>Codigo</label></td>
                                            <td><asp:TextBox ID="TBCodRef" runat="server" Cssclass="form-control input-sm" Enabled="false"></asp:TextBox></td>
                                        </tr>                                
                                        <tr>
                                            <td><label>Nombre :</label></td>
                                            <td><asp:TextBox ID="TBNombres" runat="server" Cssclass="form-control input-sm"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Apellidos:</td>
                                            <td><asp:TextBox ID="TBApellidos" runat="server" Cssclass="form-control input-sm"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Tipo Referencia</td>
                                            <td><asp:DropDownList ID="DDLTipRef" runat="server" class="form-control input-sm">
                                                <asp:ListItem>Seleccione</asp:ListItem>
                                                <asp:ListItem Value="Familiar">Familiar</asp:ListItem>
                                                <asp:ListItem Value="Personal">Personal</asp:ListItem>
                                            </asp:DropDownList>   
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Telefono:</td>
                                            <td><asp:TextBox ID="TBTelefono" runat="server" Cssclass="form-control input-sm"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Telefono Movil:</td>
                                            <td><asp:TextBox ID="TBMovil" runat="server" Cssclass="form-control input-sm"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                    <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnSave_Click"  />
                                    <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                </div>
                            
                    </div>
                </div>
            </div>
            <!-- Edit Modal Ends here -->



            <asp:Label ID="lblOuput" runat="server"></asp:Label>
    
                       
    </asp:Content>

