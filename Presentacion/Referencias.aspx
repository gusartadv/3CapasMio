<%@ Page Title="" Language="C#" MasterPageFile="~/MaestraBootstrap.master" %>

<script runat="server">

   /* protected void BtnGuardar_Click(object sender, EventArgs e)
    {
        string documento = Session["doc"].ToString();
        Negocio.Referencia.NregistrarReferencia(documento, TBNombres.Text, TBApellidos.Text, DDLTipRef.Text, TBTelefono.Text, TBMovil.Text);
    }*/
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
   
</script>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">

  



    <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center"  AutoGenerateColumns="false" AllowPaging="true"
     CssClass="table table-hover table-striped" >
        <Columns>
                 <asp:ButtonField CommandName="editRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                 </asp:ButtonField>
                 <asp:ButtonField CommandName="deleteRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Delete" HeaderText="Delete Record">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                 </asp:ButtonField>
                            <asp:BoundField DataField="nombres" HeaderText="Nombres" />
                            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
                            <asp:BoundField DataField="tipoReferencia" HeaderText="Tipo Referencia" />
                            <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                            <asp:BoundField DataField="movil" HeaderText="Movil" />
                            
        </Columns>
    </asp:GridView>
    </asp:Content>