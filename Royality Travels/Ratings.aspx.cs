using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Royality_Travels
{
    public partial class Ratings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string text = "Ratings of User ";
            text += Session["name"].ToString();
            Label1.Visible = true;
            Label1.Text = text;

        }
    }
}

    
