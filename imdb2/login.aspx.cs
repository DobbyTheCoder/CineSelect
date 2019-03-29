using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Security.Cryptography;
using System.Text;

public partial class login : System.Web.UI.Page
{
    private String passwordRet;
    OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\talre\OneDrive\Desktop\CineSelect\imdb2\users.accdb");
    OleDbCommand cmd = new OleDbCommand();
    OleDbDataReader reader = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Visible = false;
        con.Open();
    }

    protected void loginBtn_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        cmd.CommandText = "Select pass from userInfo where email='"+TextBox1.Text+"' ";
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            passwordRet = reader["pass"].ToString();
        }

        if (passwordRet == MD5Hash(TextBox2.Text))
        {
            Session["username"] = TextBox1.Text;
            if (TextBox1.Text == "admin")
            {
                Response.Redirect("dashboard.aspx");
            }

            else
            {
                Response.Redirect("home.aspx");
            }

        }

        else
        {
            //Label1.Text = "Username or Password is wrong!";
            //Label1.Visible = true;
        }
        con.Close();
    }

    public static string MD5Hash(string input)
    {
        StringBuilder hash = new StringBuilder();
        MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
        byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

        for (int i = 0; i < bytes.Length; i++)
        {
            hash.Append(bytes[i].ToString("x2"));
        }
        return hash.ToString();
    }

    protected void register_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }
}