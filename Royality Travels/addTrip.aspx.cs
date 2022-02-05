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
    public partial class addTrip : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                BookingsDal obj = new BookingsDal();
                string id = tripid.Text.Trim();
                string name = location.Text.Trim();
                string seat = seats.Text.Trim();

                string sdate = TextBox3.Text.Trim();
                string edate = TextBox5.Text.Trim();
                string price = cost.Text.Trim();
                if(obj.AddTrip(id, name, seat, sdate, edate, price))
                    Response.Write("<script>alert('Trip Added')</script>");

            }
            catch (Exception ee)
            {
                Label1.Visible = true;
                Label1.Text = ee.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                BookingsDal obj = new BookingsDal();
                if(obj.AddPlan(TextBox1.Text.Trim(),TextBox2.Text.Trim()))
                    Response.Write("<script>alert('Plan Added')</script>");

            }
            catch (Exception ee)
            {
                Label1.Visible = true;
                Label1.Text = ee.Message;
            }
        }
    }
}