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
    public partial class Packages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            if (!IsPostBack)
            {
                BookingsDal obj = new BookingsDal();
                DropDownList1.DataSource = obj.Availabletrips();
                DropDownList1.DataValueField = "tripID";
                DropDownList1.DataBind();
            }
        }
      
        protected void Button_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["userID"]==null || Session["userID"].Equals("") || Session["role"].Equals("") || Session["role"].Equals("admin"))
                {
                    Response.Write("<script>alert('Login First to add to Wishlist')</script>");
                    return;
                }
                string userid = Session["userID"].ToString();
                string trip = DropDownList1.SelectedItem.Value;
                BookingsDal obj = new BookingsDal();
                
                if(obj.addtoWishList(userid, trip))
                    Response.Write("<script>alert('Trip Added to Wishlist')</script>");
                else
                    Response.Write("<script>alert('Trip Already in Wishlist')</script>");

            }
            catch (Exception ee)
            {
                Label1.Visible = true;
                Label1.Text = ee.Message;
            }
        }
    }
}