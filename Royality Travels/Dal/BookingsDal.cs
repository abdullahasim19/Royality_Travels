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
    public class BookingsDal
    {

        private static readonly string connString =
System.Configuration.ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        public bool AddTrip(string id,string name,string seats,string sdate,string edate,string price)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("addtrips", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                cmd.Parameters.Add("@seats", SqlDbType.Int).Value = Convert.ToInt32(seats);
                cmd.Parameters.Add("@aseats", SqlDbType.Int).Value = Convert.ToInt32(seats);
                cmd.Parameters.Add("@sdate", SqlDbType.Date).Value = sdate;
                cmd.Parameters.Add("@edate", SqlDbType.Date).Value = edate;
                cmd.Parameters.Add("@price", SqlDbType.Int).Value = Convert.ToInt32(price);

                cmd.ExecuteNonQuery();
                con.Close();

                return true;
            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                return false;
            }
        }
        public bool AddPlan(string id,string plan)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("addplan", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                cmd.Parameters.Add("@plan", SqlDbType.VarChar).Value =plan;


                cmd.ExecuteNonQuery();
                con.Close();
                return true;

            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                return false;
            }
        }
        public DataTable Availabletrips()
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("showtrips", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                con.Close();
                return dt;

            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                DataTable dt = new DataTable();
                return dt;
            }
        }
        public int BookTrip(string userid,string seatsentered,string trip, string date, string package,string password,string realpass,double price)
        {

            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("booktrips", con);
                cmd.CommandType = CommandType.StoredProcedure;
                int id = Convert.ToInt32(userid);//userid

                int s = Convert.ToInt32(seatsentered);//seats entered
                int i = Convert.ToInt32(trip); //trip id
                int totalseats = checkSeats(i);
                int packageid = Convert.ToInt32(package);
                if (s <= totalseats)
                {
                   
                    cmd.Parameters.Add("@user", SqlDbType.Int).Value = id;
                    cmd.Parameters.Add("@trip", SqlDbType.Int).Value = Convert.ToInt32(trip);
                    cmd.Parameters.Add("@seat", SqlDbType.Int).Value = Convert.ToInt32(seatsentered);
                    cmd.Parameters.Add("@date", SqlDbType.Date).Value = date;
                    cmd.Parameters.Add("@package", SqlDbType.Int).Value =packageid ;
                    cmd.Parameters.Add("@price", SqlDbType.Float).Value = price;

                    if (password.Equals(realpass))
                    {
                        cmd.ExecuteNonQuery();
                        updateseats(i, totalseats - s);

                        addToHistory(i, id);
                        con.Close();
                        return 2;
                    }
                    else
                    {
                        con.Close();
                        return 1;
                    }
                }
                else
                {
                    con.Close();
                    return 0;
                }

            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                return -1;
            }
        }
        void updateseats(int tripid, int nseats)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("updateseats", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@seat", SqlDbType.Int).Value = nseats;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = tripid;


                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
            }
        }
        public int checkSeats(int tripID)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("showeverytrips ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = tripID;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int s = Convert.ToInt32(dt.Rows[0][3].ToString());
                con.Close();

                return s;

            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                return -1;
            }
        }
        void addToHistory(int trip, int user)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("addtoHistory", con);
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add("@userID", SqlDbType.Int).Value = user;
                cmd.Parameters.Add("@trip", SqlDbType.Int).Value = trip;


                cmd.ExecuteNonQuery();


                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }

        public bool addtoWishList(string user,string trip)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();


                SqlCommand cmd = new SqlCommand("addtowish", con);
                cmd.CommandType = CommandType.StoredProcedure;
                int id = Convert.ToInt32(user);
                int idtrip = Convert.ToInt32(trip);
                cmd.Parameters.Add("@user",SqlDbType.Int).Value=id;
                cmd.Parameters.Add("@trip", SqlDbType.Int).Value = idtrip;

               
                cmd.ExecuteNonQuery();
             
                con.Close();
                return true;
            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
               
                return false;
            }
        }

        public double checkPrice(int tripID)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("showeverytrips ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = tripID;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                double s = Convert.ToDouble(dt.Rows[0][6].ToString());
                con.Close();
                return s;

            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                return -1;
            }
        }
        public double getPrice(double orignalTripPrice, int noOfSeats, int packageID)
        {
            double price = 0;

            //calculating price according to package
            if (packageID == 1)
                price = orignalTripPrice;
            else if (packageID == 2)
                price = orignalTripPrice + (orignalTripPrice * 0.1);
            else if (packageID == 3)
                price = orignalTripPrice + (orignalTripPrice * 0.2);
            price *= noOfSeats;

            //calculating discounts
            if (noOfSeats >= 5 && noOfSeats <= 10)
                price -= (price * 0.05);
            else if (noOfSeats >= 10)
                price -= (noOfSeats * 0.1);

            return price;
        }
        public DataTable userHistory(int id)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("userTrips", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@userID", SqlDbType.Int).Value = Convert.ToInt32(id);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                con.Close();
                return dt;

            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                DataTable dt = new DataTable();
                return dt;
            }
        }
        public bool userRating(int userID,int trip,int rat)
        {
            try
            {
                SqlConnection con = new SqlConnection(connString);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlCommand cmd = new SqlCommand("userRating", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@userID", SqlDbType.Int).Value = userID;
                cmd.Parameters.Add("@tripID", SqlDbType.Int).Value =trip;
                cmd.Parameters.Add("@rat", SqlDbType.Int).Value = rat;

                cmd.ExecuteNonQuery();
              
                con.Close();

                return true;
            }
            catch (Exception ee)
            {
                Console.WriteLine(ee.Message);
                return false;
            }
        }
    }
}

