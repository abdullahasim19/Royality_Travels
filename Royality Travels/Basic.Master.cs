using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace Royality_Travels
{
    public partial class Basic : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
                Session["role"] = "";
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton1.Visible = false;
                    LinkButton10.Visible = false; //add tour
                }
                else
                {
                    LinkButton2.Visible = false; //sign in
                    LinkButton3.Visible = false; //sign up
                    LinkButton9.Visible = true; //signout
                    if (Session["role"].Equals("admin"))
                    {
                        LinkButton1.Visible = true; //welcome
                        LinkButton1.Text = "Hello Admin " + Session["name"];
                        LinkButton8.Visible = true; //admin profile
                        LinkButton10.Visible = true; //add tour
                        LinkButton12.Visible = true;//all users
                    }
                    else
                    {
                        LinkButton1.Visible = true; //welcome
                        LinkButton1.Text = "Hello User " + Session["name"];
                        LinkButton7.Visible = true; //userProfile
                        LinkButton10.Visible = false; //tour add
                        LinkButton4.Visible = true; //bookings
                        LinkButton5.Visible = true;//History
                        LinkButton6.Visible = true;//Wishlist
                        LinkButton11.Visible = true;//rating
                    }
                }
               
            }
            catch(Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'   </script>");
               
            }
        }
        protected void log_out(object sender, EventArgs e)
        {
            LinkButton2.Visible = true; //login form
            LinkButton3.Visible = true; //sign up form
            LinkButton1.Visible = false; //welcome 
            LinkButton9.Visible = false; //signout
            LinkButton8.Visible = false; //admin profile
            LinkButton7.Visible = false; //userProfile
            LinkButton4.Visible = false; //bookings
            LinkButton12.Visible = false;//see users
            LinkButton5.Visible = false;//History
            LinkButton6.Visible = false;//Wishlist
            LinkButton11.Visible = false;//rating
            Session["role"] = "";
            Session["userID"] = "";
            Session["password"] = "";
            Session["name"] = "";
            Response.Redirect("HomePage.aspx");
        }
    }
}