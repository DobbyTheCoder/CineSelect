using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class movietemplate : System.Web.UI.Page
{
    public OleDbConnection conn = new OleDbConnection();
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
    public string id;
    Movie movies;

    public bool disabled = false;
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
        id = movies.imdbID;

        conn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\talre\OneDrive\Desktop\CineSelect\imdb2\users.accdb";
        OleDbCommand cmdd = new OleDbCommand("SELECT rating from rating WHERE id=@id AND username=@name");
        cmdd.Parameters.AddWithValue("@id", id);
        cmdd.Parameters.AddWithValue("@name", Session["username"].ToString());
        cmdd.Connection = conn;

        try
        {
            conn.Open();

            OleDbDataReader reader = cmdd.ExecuteReader();


            while (reader.Read())
            {
                
                    if(reader[0].ToString() != "")
                    {
                        Label1.Text = "Your Rating : " + reader[0].ToString();
                        Label1.Visible = true;
                        Button2.Visible = false;
                        disabled = true;
                    }
                    
                    
               
            }
        }

        catch (OleDbException ex)
        {
            Label1.Text = ex.Message;
            Label1.Visible = true;
            conn.Close();
        }
        finally
        {
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("movietemplate.aspx?t=" + TextBox1.Text);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["username"] == null)
            Response.Redirect("login.aspx?r=noSignUp");

        else
        {
            string i = Request.Form["rate"];
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\talre\OneDrive\Desktop\CineSelect\imdb2\users.accdb";
            OleDbCommand cmdd = new OleDbCommand("INSERT into rating (id, username, rating) Values(@id, @name, @rating)");
            cmdd.Parameters.AddWithValue("@id", id);
            cmdd.Parameters.AddWithValue("@name", Session["username"].ToString());
            cmdd.Parameters.AddWithValue("@rating", i);

            cmdd.Connection = conn;
            try
            {
                conn.Open();
                int it = cmdd.ExecuteNonQuery();
                Label1.Text = "Thanks for Rating!";
                Label1.Visible = true;
                disabled = true;
                Button2.Visible = false;
                conn.Close();
                //Response.Redirect("login.aspx");
            }

            catch (OleDbException ex)
            {
                Label1.Text = ex.Message;
                Label1.Visible = true;
                conn.Close();
            }

            finally
            {
                conn.Close();
            }
        }
    }
}
