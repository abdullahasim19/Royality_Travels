using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Royality_Travels.Dal
{
    public class myDal
    {
        private static readonly string connString =
System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        public void AddUser(string username, string fullname, string phonenum, string country, string password, string email)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("forinsert", con);
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = username;
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = fullname;
                cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = phonenum;
                cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = country;
                cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;

                cmd.ExecuteNonQuery();


                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
        public bool checkUserMail(int userName,string email)
        {
            SqlConnection con = new SqlConnection(connString);
            try
            {
                if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlCommand cmd = new SqlCommand("CheckUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(userName);
                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows[0][5].Equals(email))
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return true;
            }
        }
        public bool checkUser(string userName)
        {
            SqlConnection con = new SqlConnection(connString);
            try
            {
                if (con.State == ConnectionState.Closed)
                    con.Open();
                SqlCommand cmd = new SqlCommand("CheckUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(userName);
                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return true;
            }
        }
        public DataTable checkUserExist(int uID, string pass)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(connString);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand();
            try
            {
                cmd = new SqlCommand("UserLogIn", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@userID", SqlDbType.Int);
                cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);

                cmd.Parameters["@userID"].Value = uID;
                cmd.Parameters["@password"].Value = pass;

                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);           
            }
            return dt;
        }
        public DataTable checkAdminExist(int uID, string pass)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(connString);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand();
            try
            {
                cmd = new SqlCommand("AdminLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@adminID", SqlDbType.Int);
                cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);

                cmd.Parameters["@adminID"].Value = uID;
                cmd.Parameters["@password"].Value = pass;

                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return dt;
        }

        public string updatePassword(int uID, string email)
        {
            SqlConnection con = new SqlConnection(connString);
            if (con.State == ConnectionState.Closed)
                con.Open();
            string newpassword = "";
            SqlCommand cmd = new SqlCommand();
            try
            {
                Random rd = new Random();
                int num1 = rd.Next(200);
                int num2 = rd.Next(200, 300);
                int num3 = rd.Next(100, 400);
                newpassword = Convert.ToString(num1);
                newpassword += Convert.ToString(num2);
                newpassword += Convert.ToString(num3);

                cmd = new SqlCommand("ResetPassword", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@userID", SqlDbType.Int);
                cmd.Parameters.Add("@emailID", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@newpassword", SqlDbType.VarChar, 50);

                cmd.Parameters["@userID"].Value = uID;
                cmd.Parameters["@emailID"].Value = email;
                cmd.Parameters["@newpassword"].Value = newpassword;

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);

            }
            return newpassword;
        }
        public DataTable updateUserInfo(int uID, string oldpass, string newpass, string newname, string newcountry, string newemail, string newphone)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(connString);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand();
            try
            {
                cmd = new SqlCommand("UpdateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@userID", SqlDbType.Int);
                cmd.Parameters.Add("@oldPass", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@newPass", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@newName", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@newEmail", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@newCountry", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@newPhone", SqlDbType.Char, 11);

                cmd.Parameters["@userID"].Value = uID;
                cmd.Parameters["@oldPass"].Value = oldpass;
                cmd.Parameters["@newPass"].Value = newpass;
                cmd.Parameters["@newName"].Value = newname;
                cmd.Parameters["@newEmail"].Value = newemail;
                cmd.Parameters["@newCountry"].Value = newcountry;
                cmd.Parameters["@newPhone"].Value = newphone;

                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);

            }
            return dt;
        }
        public void updateAdmin(int uID,string name,string phone,string country,string mail)
        {
            SqlConnection con = new SqlConnection(connString);
            if (con.State == ConnectionState.Closed)
                con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("UpdateAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@adminID", SqlDbType.Int).Value = uID;
                cmd.Parameters.Add("@newName", SqlDbType.VarChar).Value = name;
                cmd.Parameters.Add("@newCountry", SqlDbType.VarChar).Value = country;
                cmd.Parameters.Add("@newPhone", SqlDbType.VarChar).Value = phone;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = mail;

                cmd.ExecuteNonQuery();
               
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
        }
    }
}