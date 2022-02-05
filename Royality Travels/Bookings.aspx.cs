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
    public partial class Bookings : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
              if(!IsPostBack)
              {
                  BookingsDal obj = new BookingsDal();
                  DropDownList1.DataSource = obj.Availabletrips();
                  DropDownList1.DataValueField = "tripID";
                  DropDownList1.DataBind();
              }    
        }
      
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                BookingsDal obj = new BookingsDal();
                string userID = Session["userID"].ToString();
                string seatsenter = TextBox2.Text.Trim();
                string tripid = DropDownList1.SelectedItem.Value;
                string date = TextBox7.Text.Trim();
                string package = DropDownList2.SelectedItem.Value;
                string password = TextBox3.Text.Trim();
                string realpass = Session["password"].ToString();
                string price = TextBox6.Text.Trim();
                double p = Convert.ToDouble(price);
                int answer=obj.BookTrip(userID, seatsenter, tripid, date, package, password, realpass,p);
                if(answer==2)
                    Response.Write("<script>alert('Booking Done')</script>");
                else if(answer==1)
                    Response.Write("<script>alert('Password invalid')</script>");
                else if(answer==0)
                    Response.Write("<script>alert('Not enough seats')</script>");

            }
            catch (Exception ee)
            {
                Label1.Visible = true;
                Label1.Text = ee.Message;
            }
        }
       
        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                BookingsDal obj = new BookingsDal();
                int i = Convert.ToInt32(DropDownList1.SelectedItem.Value);
                int totalseats = obj.checkSeats(i);
                TextBox1.Text = totalseats.ToString();

            }
            catch (Exception ee)
            {
                Label1.Visible = true;
                Label1.Text = ee.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Length < 1)
                return;

            BookingsDal obj = new BookingsDal();
            string tripid = DropDownList1.SelectedItem.Value;
            int i = Convert.ToInt32(tripid);
            double actualprice = obj.checkPrice(i);
            string seatsenter = TextBox2.Text.Trim();
            int s = Convert.ToInt32(seatsenter);
            string package = DropDownList2.SelectedItem.Value;
            int packageid = Convert.ToInt32(package);
            double priceCalculated = obj.getPrice(actualprice, s, packageid);
            TextBox6.Text = priceCalculated.ToString();
            Label2.Visible = true;
            if (s >= 5 && s <= 10)
                Label2.Text = "5 % discount given";
            else if (s > 10)
                Label2.Text = "10 % discount given";
            else
                Label2.Text = "No discount given";
        }

    }
}