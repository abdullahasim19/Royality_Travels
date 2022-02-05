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
    public partial class userProfile : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UpdateButtonClick"].Equals(false))
                showUser();
            Session["UpdateButtonClick"] = true;
        }

        protected void userUpdate_Click(object sender, EventArgs e)
        {
            int uID = Convert.ToInt32(Session["userID"].ToString());
            string oldPassword = Session["password"].ToString();
            string newPassword;

            if (oldPasswordtxt.Text == "")
            {
                newPassword = Session["password"].ToString();
            }
            else if (oldPasswordtxt.Text == Session["password"].ToString())
            {
                if (newPasswordtxt1.Text == newPasswordtxt2.Text)
                {
                    newPassword = newPasswordtxt1.Text;
                    Response.Write("<script> alert('Password Changed') </script>");
                }
                else
                {
                    newPassword = Session["password"].ToString();
                    Response.Write("<script> alert('New Password does not match') </script>");
                }
            }
            else
            {
                newPassword = Session["password"].ToString();
                Response.Write("<script> alert('Current Password does not match') </script>");
            }

            string newname = TextBox1.Text;
            string newmail = txtEmail.Text;
            string newphonenum = txtPhNo.Text;
            string newCountry = txtCountry.Text;
            string newemail = txtEmail.Text;


            myDal objMyDAL = new myDal();
            DataTable dt = objMyDAL.updateUserInfo(uID, oldPassword, newPassword, newname, newCountry, newemail, newphonenum);

            Session["name"] = newname;
            Session["password"] = newPassword;
            showUser();

        }

        void showUser()
        {
            try
            {
                int uID = Convert.ToInt32(Session["userID"].ToString());
                string pass = Session["password"].ToString();


                myDal objMyDAL = new myDal();
                DataTable dt = objMyDAL.checkUserExist(uID, pass);

                if (dt.Rows.Count > 0)
                {

                    txtUserName.Text = dt.Rows[0][0].ToString();
                    TextBox1.Text = dt.Rows[0][1].ToString();
                    txtPhNo.Text = dt.Rows[0][2].ToString();
                    txtCountry.Text = dt.Rows[0][3].ToString();
                    txtEmail.Text = dt.Rows[0][5].ToString();

                }

            }
            catch (Exception ex)
            {
                //Response.Write("<script> alert('"+ex.Message+"') </script>");
                // Response.Write("<script> alert('none') </script>");
                Label1.Visible = true;
                Label1.Text = ex.Message;

            }
        }
    }
}