using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Royality_Travels
{
    public partial class Wishlistt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
                Session["role"] = "";
            if (Session["role"].Equals(""))
                Response.Redirect("HomePage.aspx");
            GridView1.DataBind();
            string text = "Wishlist of user ";
            text += Session["name"].ToString();
            Label1.Visible = true;
            Label1.Text = text;
        }
    }
}