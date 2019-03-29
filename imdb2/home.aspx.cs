using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{   
    public string name = "Login";
    public string register = "Register";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null) {
            name = "Welcome " + Session["username"].ToString();
            register = "";
           }
    }

    protected void clickRedirect(object sender, ImageClickEventArgs e)
    {
        ImageButton img = sender as ImageButton;
        string param = img.Attributes["alt"].ToString();

        Response.Redirect("movietemplate.aspx?t="+param);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("movietemplate.aspx?t=" + TextBox1.Text);
    }
}