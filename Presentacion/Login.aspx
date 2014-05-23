<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentacion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.css" />
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >

                <div class="panel-heading">
                    <div class="panel-title">Inicia sesion</div>
                    <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
                </div>     

                <div style="padding-top:30px" class="panel-body" >
                    <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <form id="loginform" class="form-horizontal" role="form" runat="server">

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="tbEmail" runat="server" Cssclass="form-control" placeholder="E-mail"></asp:TextBox>        
                            </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox ID="tbpass" Type="password" runat="server"  class="form-control" placeholder="Contraseña"></asp:TextBox>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </div>
                                                              
                            <div style="margin-top:10px" class="form-group">
                                <div class="col-sm-12 controls">
                                    <asp:Button ID="Button1" runat="server" OnClick="Ingresar_Click" Text="Ingresar" Width="81px"  Cssclass="btn btn-success" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                        Todavia no te haz registrado! 
                                        <a href="NuevoUsuario.aspx" >Registrate aqui</a>
                                    </div>
                                </div>
                            </div>   
                             
                        </form>   
                </div><!--panel body-->
            </div>  <!--Panel info-->
        </div><!--Cierre loginbox-->
    </div><!--Cierre container-->
</body>
</html>


