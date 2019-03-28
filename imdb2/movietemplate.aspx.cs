using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class movietemplate : System.Web.UI.Page
{
    public string name = "Login";
    public string register = "Register";
    private string jsonString;
    public string rated;
    public string title;
    public string time;
    public string genre;
    public string releaseDate;
    public string poster;
    public string directors;
    public string writers;
    public string actors;
    public string plot;
    public string rating;
    Movie movies;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            name = Session["username"].ToString();
            register = "";
        }
        title = Request.QueryString["t"].ToString();
        HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(string.Format("http://www.omdbapi.com/?apikey=84739f5e&t="+title));
        WebReq.Method = "GET";
        HttpWebResponse WebResp = (HttpWebResponse)WebReq.GetResponse();

        using (Stream stream = WebResp.GetResponseStream())
        {
            StreamReader reader = new StreamReader(stream, System.Text.Encoding.UTF8);
            jsonString = reader.ReadToEnd();
        }

        movies = JsonConvert.DeserializeObject<Movie>(jsonString);

        title = movies.Title;
        rated = movies.Rated;
        time = movies.Runtime;
        genre = movies.Genre;
        releaseDate = movies.Released;
        poster = movies.Poster;
        directors = movies.Director;
        writers = movies.Writer;
        actors = movies.Actors;
        plot = movies.Plot;
        rating = movies.imdbRating;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("movietemplate.aspx?t=" + TextBox1.Text);
    }
}
