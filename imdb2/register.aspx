<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

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
            background:#f8bbd0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div>
            <div class = "container shadow-lg bg-dark rounded" style="margin-top:3%;">
                <div class="row">
                 <div class="col-6" style="padding:0 !important; margin:0 !important">
                     <img src="bg-heading-03.jpg" class="rounded" style="height:inherit; width:inherit;"/>
                   </div>
                    <div class="col-6 mt-5 pl-5">
                    <h1 class="text-white">Register</h1><br />
                    
                        <div class="form-group">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control"  Width="85%" placeholder="Email*"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="TextBox2" runat="server" type="password" class="form-control"  Width="85%" placeholder="Password*"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                         </div>
                    <div class="form-group">
                            <asp:TextBox ID="TextBox3" runat="server" type="password" class="form-control" Width="85%" placeholder="Re-Enter Password*"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please re enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                         </div>
                    <div class="form-group">
                            <asp:TextBox ID="TextBox4" runat="server" class="form-control"  Width="85%" placeholder="First Name*"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please enter your first name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group">
                            <asp:TextBox ID="TextBox5" runat="server" class="form-control"  Width="85%" placeholder="Last Name*"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please enter your last name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group">
                            <asp:TextBox ID="TextBox6" runat="server" class="form-control" Width="85%" placeholder="Phone"></asp:TextBox>
                        </div>
                    <br />
                        <div class="form-group">
                            <asp:button class="btnSubmit bg-primary text-white"  runat="server" Text="Register" ID="regBtn"   Width ="35%" OnClick="loginBtn_Click"/>
                           
                            </div>
                        </div>
                    </div>
                </div>
            </div></center>
        </div>
    </form>
</body>
</html>
