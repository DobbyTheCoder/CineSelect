<%@ Page Language="C#" AutoEventWireup="true" CodeFile="movietemplate.aspx.cs" Inherits="movietemplate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        #mainDiv{

        }
        #divDark{
            background-color: #616161;
        }

        .imageSmall{
            height:350px;
            width:216px;
            
            //margin-bottom: 25px;
        }

        ul.item {
          list-style-type: none;
          margin: 0;
          padding: 0px 0px 10px 0px;
          overflow: hidden;
         
        }

        li.item {
          float: left;
          display: block;
          color: white;
          text-align: center;
          padding-right: 16px;
          text-decoration: none;
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
<div class="container shadow-lg rounded" id="divDark" style="margin-top:30px">
  <div class="row border border-dark">
    <div class="col">
      <h1 class="text-white font-weight-bold" id="movieTitle"><% =title %></h1><br />
        <ul class="item">
            <li class="item"><%=rated %></li>
            <li class="item"><%=time %></li>
            <li class="item"><%=genre %></li>
            <li class="item"><%=releaseDate %></li>
        </ul>
      </div>
    
      <div class="col text-center">
          <h5 class="text-white text-center pt-3">Rating : <%=rating %></h5>
          <div class="">
             <%if (disabled == false)
                 { %>
          <span class="text-white mr-3">Rate out of 5</span>
         
          <select class="" name="rate">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
           </select>
              <%} %>

              <%else
    {%>
               <span class="text-white"></span>
              <%} %>
            <asp:Button ID="Button2" class="ml-1" runat="server" Text="Rate" OnClick="Button2_Click" />
              <asp:Label ID="Label1" runat="server" Text="Thanks for rating!" ForeColor="#00CC00" Visible="False"></asp:Label>
              </div>
      </div>
      
   </div>

   <div class="row">
       <div class="col-2.5" style="padding:0 !important;margin:0 !important">
         <img src="<%=poster %>" class="imageSmall">
           </div>
  

    <div class="col bg-white pt-3 border border-light" >
        
          <h5><%=plot %></h5>
          <br>

          <h6>Director : <%=directors %></h6>
           <h6>Writers: <%=writers %><h6>
            <h6>Stars: <%=actors %></h6>

     </div>
        </div>
    </div>
<br />
 
    <div class="text-center p-5" style="position:fixed;width:100%; bottom:0; background-color:#eeeeee">
      <h3>CineSelect</h3>
        <%if (Session["username"] != null)
            { %>
                <a href="login.aspx">Log Out</a>
        <%}  %>
    </div>

</div>
</form>
</body>
</html>
