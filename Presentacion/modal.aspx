<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modal.aspx.cs" Inherits="Presentacion.modal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
  

                

    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.css" />    
    <script src="Scripts/jquery-1.11.0.js"></script>
    <script src="Bootstrap/js/bootstrap.js"></script>
    <link href="Bootstrap/css/dashboard.css" rel="stylesheet" />
    <style type="text/css" id="Style1"></style>

</head>
<body>
    
                

    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />



      <!-- Delete Record Modal Starts here-->
            <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
                <div class="modal-dialog">
				<div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="delModalLabel">Delete Record</h3>
                </div>
                
                   
                        <div class="modal-body">
                            Are you sure you want to delete the record?
                            <asp:HiddenField ID="hfCode" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info"   />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        </div>
                   
                    
</div></div>
            </div>
            <!--Delete Record Modal Ends here -->
        <asp:Label ID="lblOuput" runat="server"></asp:Label>
    </form>
</body>
</html>
