using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using Royality_Travels.Dal;

namespace Royality_Travels
{
    public partial class forgetPasswordForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void resetBtn_Click(object sender, EventArgs e)
        {
            sendemail();
        }
        private void sendemail()
        {
            int uID = Convert.ToInt32(userID.Text);
            string email = emailtxt.Text;
            myDal objMyDAL = new myDal();
            if(!objMyDAL.checkUser(uID.ToString()))
            {
                Response.Write("<script> alert('No Such User Exists') </script>");
                return;
            }
            if(!objMyDAL.checkUserMail(uID,email))
            {
                 Response.Write("<script> alert('Wrong Email') </script>");
                return;
            }
            string newpassword = objMyDAL.updatePassword(uID, email);
            Session["password"] = newpassword;
            String message = "Your account new password: ";
            message += newpassword;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("abdullahasimlhe@gmail.com", "Barcaisgreat15");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Body = "Dear Customer:  \n\n" + message + "\n\nThanks & Regards\nTeam Royality Travels";
            string toaddress = email;
            msg.To.Add(toaddress);
            string fromaddress = "Team Royality Travels <abdullahasimlhe@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
                Response.Redirect("logInForm.aspx");
            }
            catch
            {
                throw;
            }
        }
    }
}