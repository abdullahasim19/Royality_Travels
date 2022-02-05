using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Royality_Travels.Dal;

namespace Royality_Travels
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BookingsDal obj = new BookingsDal();
            int userID = Convert.ToInt32(Session["userID"].ToString());
            if (!IsPostBack)
            {
                DropDownList1.DataSource = obj.userHistory(userID);
                DropDownList1.DataTextField = "tripID";
                DropDownList1.DataBind();
            }
            Rating1.CurrentRating = 0;
            Rating1.MaxRating = 10;
            if (Session["role"] == null)
                Session["role"] = "";
            if (Session["role"].Equals(""))
                Response.Redirect("HomePage.aspx");
            GridView1.DataBind();
            string text = "History of User ";
            text += Session["name"].ToString();
            Label1.Visible = true;
            Label1.Text = text;

           
        }
        
        protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            
            if (DropDownList1.Items.Count == 0)
            {
                Response.Write("<script>alert('No Trip In History')</script>");
                return;
            }
            BookingsDal obj = new BookingsDal();
            int userID = Convert.ToInt32(Session["userID"].ToString());
            int tripID = Convert.ToInt32(DropDownList1.SelectedItem.Value);
            int rat = Convert.ToInt32(e.Value);
            if(obj.userRating(userID,tripID,rat))
                Response.Write("<script>alert('Trip Rated')</script>");
            else
                Response.Write("<script>alert('Trip Already Rated')</script>");
        }
    }
}