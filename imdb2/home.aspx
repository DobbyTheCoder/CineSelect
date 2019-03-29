<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

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
  <a class="navbar-brand rounded p-2" href="#" style="background-color:#fbc02d;">CineSelect</a>
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

    <div class="container shadow-lg border border-left-0 border-right-0 border-bottom-0 border-dark" id="divDark">
        

    
          <h3 class="text-white text-center pt-3">Trending Right Now</h3>
    

    <div class="row pt-3">
        <div class="carousel slide border border-dark" id="slideshowMain" data-ride="carousel">
          <ul class="carousel-indicators">
            <li data-target="#slideshowMain" data-slide-to="0" class="active"></li>
            <li data-target="#slideshowMain" data-slide-to="1"></li>
            <li data-target="#slideshowMain" data-slide-to="2"></li>
          </ul>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <asp:ImageButton ImageUrl="endgame.jpg" class="imageFocus" alt="Avengers-endgame" runat="server" Onclick="clickRedirect"/>
              <div class="carousel-caption">
                <h3 >Avengers : Endgame</h3>
              </div>   
            </div>
            <div class="carousel-item">
              <asp:ImageButton ImageUrl="shazam.jpg" class="imageFocus" alt="Shazam" runat="server" Onclick="clickRedirect"/>
              <div class="carousel-caption">
                <h3>Shazam</h3>
              </div>   
            </div>
            <div class="carousel-item">
              <asp:ImageButton ImageUrl="https://static1.squarespace.com/static/51b3dc8ee4b051b96ceb10de/t/5c2274e08985837cb690b246/1545762021789/?format=2500w" class="imageFocus" alt="Captain-Marvel" runat="server" Onclick="clickRedirect"/>
              <div class="carousel-caption">
                <h3>Captain Marvel</h3>
              </div>   
            </div>
          </div>
          <a class="carousel-control-prev" href="#slideshowMain" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </a>
          <a class="carousel-control-next" href="#slideshowMain" data-slide="next">
            <span class="carousel-control-next-icon"></span>
          </a>
        </div>
    </div>

        <div class="row pt-3 pb-3 pl-3" id="divLight">
            <h1>TOP STORIES</h1>
        </div>
        
       <!-- <div class="row pb-3 pt-3 text-center border border-top-0 border-right-0 border-left-0 border-dark" id="divLight">
            <div class="col">
                <img onmouseover="shadow(this)" onmouseout="normal(this)" class="rounded imgSmall" src="interstellar.jpg"  />
            </div>
            <div class="col">
                <img onmouseover="shadow(this)" onmouseout="normal(this)" class="rounded imgSmall" src="interstellar.jpg"  />
            </div>
            <div class="col">
                <img onmouseover="shadow(this)" onmouseout="normal(this)" class="rounded imgSmall" src="interstellar.jpg"  />
            </div>
            <div class="col">
                <img onmouseover="shadow(this)" onmouseout="normal(this)" class="rounded imgSmall" src="interstellar.jpg"  />
            </div>
        </div>-->

        <div class="row pt-3 pb-3 border border-top-0 border-right-0 border-left-0 border-dark" id="divLight">
            <div class="col-9">
                <h3>Angelina Jolie may soon make Marvel debut with 'The Eternals'</h3>
                <h5>March 27, 2019</h5>
               
                <p>The Oscar-winning actor has chosen the project based on the Jack Kirby-created title about superpowered and near-immortal beings known as Eternals and a more monstrous offshoot known as the Deviants that were created by the cosmic beings called Celestials.</p>
                <p>The details about the movie are being kept under wraps but one of the insiders has revealed one aspect to the story involves the love story between Ikaris, a man fuelled by cosmic energy, and Sersi, who relishes moving amongst humans. </p>
            </div>
            <div class ="col-3">
                <img src="aj.jpg" onmouseover="shadow(this)" onmouseout="normal(this)" class="rounded imgSmall"/>
            </div>
        </div>

        <div class="row pt-3 pb-3 border border-top-0 border-right-0 border-left-0 border-dark" id="divLight">
            <div class="col-9">
                <h3>'Get Out' Director Jordan Peele Not Interested in Casting a 'White Dude' as the Lead in His Movie</h3>
                <h5>March 27, 2019</h5>
               
                <p>Hollywood writer-director and comedian Jordan Peele (Get Out and Us) has claimed in an interview that he does not see a white man playing a lead role in his films. Peele said, "I don’t see myself casting a white dude as the lead in my movie. Not that I don’t like white dudes. But I’ve seen that movie."</p>
                <p>Peele's statement comes when Hollywood has seemingly reached a saturation point and formula films featuring the conventional white man as the lead actor is slowly weeding out of fashion. Recently, there were reports that Christopher Nolan is also planning to cast a non-white lead actor, a first for the director.</p>
            </div>
            <div class ="col-3">
                <img src="jp.jpg" onmouseover="shadow(this)" onmouseout="normal(this)" class="rounded imgSmall"/>
            </div>
        </div>

        <div class="row pt-3 pb-3 border border-top-0 border-right-0 border-left-0 border-dark" id="divLight">
            <div class="col">
                <h3>Posters Drop For “Avengers: Endgame” And Our Heroes Will Avenge The Fallen</h3>
                <h5>March 27, 2019</h5>
               
                <p>Earlier today, a series of New Posters were released for next month’s epic Marvel Cinematic Universe entry Avengers: Endgame. With that recent Trailer likely being it, in terms of new looks at the MCU effort, we should probably expect things like this to suffice until the April release date. Pundits like myself have already received our press screening invitations, so it’s basically a waiting game now. A month away, this end to the latest phase of the MCU will undoubtedly change everything. As such, it’s an incredible cinematic event, one that pop culture itself will be awaiting. Few movies can create the sort of wave in the zeitgeist that this can.</p>
               
            </div>
        </div>
    </div>

            <div class="text-center p-5" style="width:100%; bottom:0; background-color:#eeeeee">
      <h3>CineSelect</h3>
        <%if (Session["username"] != null)
            { %>
                <a href="login.aspx">Log Out</a>
        <%}  %>
    </div>
    
    </form>

    <script>
        function shadow(x) {
            x.className = "rounded imgSmall shadow-lg border border-primary";
            x.style.width = "256px";
            x.style.height = "384px";
        }

        function normal(x) {
            x.className = "rounded imgSmall";
            x.style.width = "180px";
            x.style.height = "256px";
        }
    </script>
</body>
</html>
