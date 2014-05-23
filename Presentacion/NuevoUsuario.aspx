<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="Presentacion.NuevoUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="container">
          <div class="row" Style="margin-top:60px;">
              <div class="col-md-3" ></div><!--columna amarilla-->
                  <div class="col-md-6" style="background-color:;"><!--columna blanca-->
                      <div class="row">
                            <form id="form1" runat="server">     
                            <div id="legend">
                             <legend>Registro</legend> 
                            </div> 
                              <div class="col-md-6">                 
                                  <label for="InputName">Tipo de identificacion</label>
                                  <asp:DropDownList ID="DropDownTI" runat="server" Cssclass="form-control" name="InputName"  placeholder="Enter Name">
                                      <asp:ListItem Value="">Seleccione</asp:ListItem>
                                      <asp:ListItem Value="Ciudadania">Cedula De Ciudadania</asp:ListItem>
                                      <asp:ListItem Value="Extranjeria">Cedula de Extranjeria</asp:ListItem>                    
                                  </asp:DropDownList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="DropDownTI" ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>

                            <div class="col-md-6">    
                                <label for="InputEmail">Documento de identidad</label>
                                <asp:TextBox ID="TbDocIde" runat="server" MaxLength="10"  Cssclass="form-control" placeholder="Documento de identidad"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TbDocIde" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TbDocIde" ErrorMessage="No valido" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>                                
                            </div>
                 
                            <div class="col-md-6">
                                <label for="InputReal">Nombres</label>
                                <asp:TextBox ID="TbNom" runat="server" CssClass="form-control" placeholder="Nombres"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="TbNom" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                    
                            <div class="col-md-6">
                                <label for="InputReal">Apellidos</label>
                                <asp:TextBox ID="TbApellidos" runat="server" CssClass="form-control" placeholder="Apellidos"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TbApellidos" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>                

                            <div class="col-md-6">
                                <label for="InputReal">E-mail</label>
                                <asp:TextBox ID="TbEmail" runat="server" CssClass="form-control" placeholder="E-mail"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TbConEmail"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TbEmail" ControlToValidate="TbConEmail" ErrorMessage="No coinciden" ForeColor="Red"></asp:CompareValidator>
                            </div>

                            <div class="col-md-6">
                                <label for="InputReal">Confirmar E-mail</label>
                                <asp:TextBox ID="TbConEmail" runat="server" CssClass="form-control" placeholder="Confirmar E-mail"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TbConEmail">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TbEmail" ControlToValidate="TbConEmail" ErrorMessage="No coinciden" ForeColor="Red"></asp:CompareValidator>
                            </div>

                            <div class="col-md-6">
                                <label for="InputReal">Clave</label>
                                <asp:TextBox ID="TbClave" runat="server" CssClass="form-control input-sm" placeholder="Clave" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TbClave" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-6">
                                <label for="InputReal">Confirmar Clave</label>
                                <asp:TextBox ID="TbconfClave" runat="server" CssClass="form-control input-sm" placeholder="Confirmar clave"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TbconfClave"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="TbClave" ControlToValidate="TbconfClave" ErrorMessage="No coinciden" ForeColor="Red"></asp:CompareValidator>
                            </div>
                  
                            <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="RegUsu" Cssclass="btn btn-info pull-left" Style="margin-left:15px;" />         
                        </form>    
                    </div><!--row-->
                </div><!--columna blanca-->
            <div class="col-md-3" ></div><!--columna roja-->
        </div><!--cierre row-->
    </div><!--cierre container-->
</body>
</html>
