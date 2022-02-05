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
    public partial class logInForm : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
                Session["role"] = "";
            Session["UpdateButtonClick"] = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session["UpdateButtonClick"] = false;
            string username = txtUserName.Text.Trim();
            string pass = txtPassword.Text.Trim();
            if (user.Checked.Equals(true))
            {
                if (checkUser())
                {
                    Response.Write("<script> alert('Login Done') </script>");
                    Response.Redirect("userProfile.aspx");
                }
                else 
                    Response.Write("<script> alert('Wrong Info') </script>");


                user.Checked = false;
            }
            else if(admin.Checked.Equals(true))
            {
                if(checkAdmin())
                {
                    Response.Write("<script> alert('Login Done') </script>");
                    Response.Redirect("adminProfile.aspx");
                }
                else
                    Response.Write("<script> alert('Wrong Info') </script>");
                admin.Checked = false;
            }
           

        }
        public bool checkUser()
        {
            try
            {
                int uID = Convert.ToInt32(txtUserName.Text);
                string pass = txtPassword.Text;



                myDal objMyDAL = new myDal();
                DataTable dt = objMyDAL.checkUserExist(uID, pass);


                if (dt.Rows.Count > 0)
                {
                    Session["userID"] = txtUserName.Text.ToString();
                    Session["role"] = "user";
                    Session["name"] = dt.Rows[0][1].ToString();
                    Session["password"] = dt.Rows[0][4].ToString();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script> alert('"+ex.Message+"') </script>");
                // Response.Write("<script> alert('none') </script>");
                Label1.Visible = true;
                Label1.Text = ex.Message;
                return false;
            }
        }

        public bool checkAdmin()
        {
            try
            {
                int uID = Convert.ToInt32(txtUserName.Text);
                string pass = txtPassword.Text;


                myDal objMyDAL = new myDal();
                DataTable dt = objMyDAL.checkAdminExist(uID, pass);




                if (dt.Rows.Count > 0)
                {
                    Session["userID"] = txtUserName.Text.ToString();
                    Session["role"] = "admin";
                    Session["name"] = dt.Rows[0][1].ToString();
                    Session["password"] = dt.Rows[0][4].ToString();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script> alert('"+ex.Message+"') </script>");
                // Response.Write("<script> alert('none') </script>");
                Label1.Visible = true;
                Label1.Text = ex.Message;
                return false;
            }
        }
    }
}