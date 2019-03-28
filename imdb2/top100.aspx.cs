using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class top100 : System.Web.UI.Page
{
    public string name = "Login";
    public string register = "Register";
    public string[] movies1;
   public  OleDbConnection conn = new OleDbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            name = "Welcome " + Session["username"].ToString();
            register = "";
        }
        int i = 0;
        conn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source='C:\Users\Gaurav And Jai\Desktop\1.3\IOT\imdb2\users.accdb'";
        

        conn.Close();
       // Label1.Text = movies1[0];
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("movietemplate.aspx?t=" + TextBox1.Text);
    }
}