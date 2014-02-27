using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for Connect
/// </summary>
public class Connect
{
    public Connect()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public SqlConnection Getconn()
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ToString());
        return conn;

    }

}