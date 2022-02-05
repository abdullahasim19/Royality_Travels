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
    public partial class adminProfile : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].ToString() != "")
            {
                if(!IsPostBack)
                    AdminDetails();
            }
        }
        void AdminDetails()
        {
            try
            {
                DataTable dt = new DataTable();
                myDal obj = new myDal();
                string id = Session["userID"].ToString();
                int ID = Convert.ToInt32(id);
                string pass = Session["password"].ToString();
                dt = obj.checkAdminExist(ID, pass);

                if (dt.Rows.Count > 0)
                {
                    txtUserName.Text = dt.Rows[0][0].ToString();
                    fullname.Text = dt.Rows[0][1].ToString();
                    txtPhNo.Text = dt.Rows[0][2].ToString();
                    txtCountry.Text = dt.Rows[0][3].ToString();
                    txtEmail.Text = dt.Rows[0][5].ToString();
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userID = txtUserName.Text.Trim();
            string name = fullname.Text.Trim();
            string phone = txtPhNo.Text.Trim();
            string country = txtCountry.Text.Trim();
            string mail = txtEmail.Text.Trim();
            int id = Convert.ToInt32(userID);
            myDal obj = new myDal();
            obj.updateAdmin(id, name, phone, country, mail);
            AdminDetails();
        }
       
    }
}