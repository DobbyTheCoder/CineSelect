using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;


public partial class register : System.Web.UI.Page
{
    OleDbConnection conn = new OleDbConnection();
    //String cmd = "INSERT into userInfo (email, pass, fname, lname, phone) Values(@email, @pass, @firstName, @lastName, @phone)";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void loginBtn_Click(object sender, EventArgs e)
    {
        //CHANGE PATHNAME
        conn.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\talre\OneDrive\Desktop\CineSelect\imdb2\users.accdb";
        OleDbCommand cmdd = new OleDbCommand("INSERT into userInfo (email, pass, fname, lname) Values(@email, @pass, @firstName, @lastName)"); 
        cmdd.Parameters.Add("@email", OleDbType.VarChar).Value = TextBox1.Text;
        cmdd.Parameters.Add("@pass", OleDbType.VarChar).Value = MD5Hash(TextBox2.Text);
        cmdd.Parameters.Add("@firstName", OleDbType.VarChar).Value = TextBox4.Text;
        cmdd.Parameters.Add("@lastName", OleDbType.VarChar).Value = TextBox5.Text;
        //cmdd.Parameters.Add("@phone", OleDbType.VarChar).Value = Convert.ToInt16(TextBox5.Text);
        cmdd.Connection = conn;
        try
        {
            conn.Open();
            cmdd.ExecuteNonQuery();
           // Label1.Text = "Data Added";
            conn.Close();
            Response.Redirect("login.aspx");
        }

        catch(OleDbException ex)
        {
           // Label1.Text = "Caught Exception";
            conn.Close();
        }

        finally
        {
            conn.Close();
        }
        
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
}