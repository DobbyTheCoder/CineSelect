<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel ="stylesheet" href="StyleSheet.css" />

    <style>
        body{
            background-image: url("blurred.jpg");
     
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div>

            <div class = "container" style="margin-top:10%;">
                <center><div class="col">
                    <div class="row-6">
                        <img src="avatar-01.jpg" style="width:100px; height: 100px" class=""/>
                    <h1 style="font-size:50px"class="mt-3">Welcome</h1>
                    <h5 class="text-muted">Please Log In</h5>
                    
                    </div>
                    <div class="mt-5">
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" Width="25%" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            &nbsp;<asp:TextBox ID="TextBox2" runat="server" type="password" class="form-control" Width="25%" placeholder="Password"></asp:TextBox>
                         </div><br />
                        <div class="form-group">
                           <asp:button class="btnSubmit bg-success text-center text-white shadow"  runat="server" Text="Login" ID="loginBtn"   Width ="35%" OnClick="loginBtn_Click"/></p>
                           <asp:Button  class="btnSubmit bg-primary text-center text-white shadow" ID="register" runat="server" Width ="25%" Text="OR Register with us!" OnClick="register_Click"></asp:Button>
                        </div>
                        
                        </div>
                </div>
            </center></div>         
    </form>

     
                           
</body>
</html>
