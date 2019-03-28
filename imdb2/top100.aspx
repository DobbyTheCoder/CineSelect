<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top100.aspx.cs" Inherits="top100" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="StyleSheet.css" />

    <style>
        #divDark{
            background-color: #616161;
        }
        #divLight{
            background-color: #eeeeee;
        }

        .imageFocus{
            height:648px;
            width:1138px;
            transition:0.3s;
        }
        .imgSmall{
            height:256px;
            width:180px;
            transition: 0.3s;
        }
        .imageFocus:hover{
            opacity:0.7;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
      
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color:#424242">
  <a class="navbar-brand rounded p-2" href="home.aspx" style="background-color:#fbc02d;">CineSelect</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse " id="collapsibleNavbar">
    <ul class="navbar-nav ">
      <li class="nav-item">
        <a class="nav-link" href="#">Movies</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="top100.aspx">Top 100</a>
      </li>
        <li class="nav-item">
            <asp:TextBox ID="TextBox1" runat="server" class="mt-1 ml-4"></asp:TextBox>
        </li>
        <li class="nav-item">
            <asp:Button ID="Button1" runat="server" Text="Search" Class="btn btn-success ml-2" OnClick="Button1_Click" />
        </li> 
    </ul>
  </div>  
    <span class="pr-5"><a href="login.aspx"><%=name %></a></span>
    <span><a href="register.aspx"><%=register %></a></span>
</nav>
            <div class="container">
             
                    <%
                        int i = 1;
                        conn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\talre\OneDrive\Desktop\CineSelect\imdb2\users.accdb";
                        System.Data.OleDb.OleDbCommand cmdd = new System.Data.OleDb.OleDbCommand("SELECT title,release,poster,plot from top100", conn);
                        conn.Open();
                        System.Data.OleDb.OleDbDataReader reader = cmdd.ExecuteReader();
                        while(reader.Read())
                        { %>
                        <div class="row p-3 ml-3 border bg-dark">
                            <div class="col-3" style="margin:0 !important; padding:0 !important">
                            <img src="<%=reader[1]%>" class="" style="height:256px;width:180px;" />
                                </div>
                            <div class="col-6 p-2">
                                <a class="text-white p-2" style="font-size:30px" href="#"><% =reader[0].ToString()%></a>
                                <h5 class="text-white mt-3 ml-2"><%=reader[2] %></h5>
                                <h6 class="text-white mt-3 ml-2">Rating : <%=reader[3] %></h6>
                            </div>
                            <div class="col-2">
                                <h1 class="text-white ml-5 mt-5" style="font-size:100px"><%=i %></h1>
                                </div>
                        </div>
                    <%
                            i++;
                        } %>
                </div>

                    
            </div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
