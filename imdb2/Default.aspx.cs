using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Data.OleDb;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
    }



    private void start_get()
    {
        Movie movies;
        //CHANGE PATH
        string text = File.ReadAllText(@"C:\Users\Gaurav And Jai\Desktop\1.3\IOT\imdb2\movies.txt");
        HttpWebRequest WebReq;

        HttpWebResponse WebResp;

        string jsonString;
        /*using (Stream stream = WebResp.GetResponseStream())   //modified from your code since the using statement disposes the stream automatically when done
        {
            StreamReader reader = new StreamReader(stream, System.Text.Encoding.UTF8);
            jsonString = reader.ReadToEnd();
        }*/

        List<Item> items = JsonConvert.DeserializeObject<List<Item>>(text);
        string[] result;

        conn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source='C:\Users\Gaurav And Jai\Desktop\1.3\IOT\imdb2\users.accdb'";

        
        for (int i = 0; i < items.Count; i++)
        {
            result = items[i].url.Split(new string[] { "/" }, StringSplitOptions.RemoveEmptyEntries);

            WebReq = (HttpWebRequest)WebRequest.Create(string.Format("http://www.omdbapi.com/?apikey=84739f5e&i="+result[1]));
            WebReq.Method = "GET";
            WebResp = (HttpWebResponse)WebReq.GetResponse();

            using (Stream stream = WebResp.GetResponseStream())
            {
                StreamReader reader = new StreamReader(stream, System.Text.Encoding.UTF8);
                jsonString = reader.ReadToEnd();
            }

            movies = JsonConvert.DeserializeObject<Movie>(jsonString);

            Label1.Text = "Adding " + i;

            OleDbCommand cmdd = new OleDbCommand("INSERT into top100(imdbId,title,plot,poster,release,rating,pos) Values(@id,@name,@plot,@poster,@date,@rating,@pos)");

            cmdd.Parameters.Add("@Id", OleDbType.VarChar).Value = movies.imdbID;
            cmdd.Parameters.Add("@name", OleDbType.VarChar).Value = movies.Title;
            cmdd.Parameters.Add("@rating", OleDbType.VarChar).Value = movies.imdbRating;
            //cmdd.Parameters.AddWithValue("@rated", movies.Rated);
            cmdd.Parameters.Add("@date", OleDbType.VarChar).Value = movies.Released;
            //cmdd.Parameters.AddWithValue("@genre",  movies.Genre);
            cmdd.Parameters.Add("@poster", OleDbType.VarChar).Value = movies.Poster;
            cmdd.Parameters.Add("@plot", OleDbType.VarChar).Value = movies.Plot;
            cmdd.Parameters.Add("@pos", OleDbType.VarChar).Value = items[i].position;
            /* cmdd.Parameters.AddWithValue("@director", movies.Director);
             cmdd.Parameters.AddWithValue("@writer", movies.Writer);
             cmdd.Parameters.AddWithValue("@actors", movies.Actors);*/

            cmdd.Connection = conn;
            try
            {
                conn.Open();
                cmdd.ExecuteNonQuery();
               Label1.Text = "Data Added";
                conn.Close();
                //Response.Redirect("login.aspx");
            }

            catch (OleDbException ex)
            {
               Label1.Text = ex.Message;
                conn.Close();
            }

            finally
            {
                conn.Close();
            }

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        start_get();
    }
}

public class Item
{
        public string url { get; set; }
    public string position { get; set; }
    //  public string Year { get; set; }
    //public string Rated { get; set; }
    //public string imdbID { get; set; }
}

