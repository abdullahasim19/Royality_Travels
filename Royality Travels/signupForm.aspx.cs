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
    public partial class signupForm : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
                Session["role"] = "";
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string name= txtUserName.Text.Trim();
            string username= fullname.Text.Trim();
            string phone= txtPhNo.Text.Trim();
            string country = txtCountry.Text.Trim();
            string password= txtPassword.Text.Trim();
            string email= txtEmail.Text.Trim();

            myDal obj = new myDal();
            if (obj.checkUser(name))
                Response.Write("<script> alert('Sorry! This userID is already taken') </script>");
            else
            {
                obj.AddUser(name, username, phone, country, password, email);
                Response.Redirect("logInForm.aspx");
            }
        }
    }
}