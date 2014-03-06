using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Location
/// </summary>
public class Location
{
    SqlConnection con=null;
	public Location()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string locationName { set; get; }
      public DataSet GetAllLocation()
    {
        Connect objcon = new Connect();
        SqlConnection con = objcon.Getconn();

        DataSet DSGetLoc = new DataSet();
        SqlCommand cmd = new SqlCommand("GetAllLocation_SP", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(DSGetLoc);
        return DSGetLoc;
    }
      public DataSet GetLocation()
      {
          Connect con_obj = new Connect();
          con = con_obj.Getconn();
          DataSet dsL = new DataSet();
          SqlCommand cmd = new SqlCommand("GetLocation_SP", con);
          cmd.CommandType = CommandType.StoredProcedure;
          SqlDataAdapter da = new SqlDataAdapter(cmd);
          da.Fill(dsL);
         return dsL;
      }
      public void SaveLocation(string locationName)
      {
          try
        {
            

            Connect con_obj = new Connect();
            con = con_obj.Getconn();
            SqlCommand cmd = new SqlCommand("SaveLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;
           
            cmd.Parameters.AddWithValue("@LocationName",locationName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }

          catch (Exception ex)
          {
              ex.Message.ToString();
          }

      }
}