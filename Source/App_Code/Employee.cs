using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;
using System.Data.OleDb;
/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    SqlConnection con = null;
    public Employee()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int EmpId { set; get; }
    public string MID { set; get; }
    public string Name { set; get; }
    public string Competency { set; get; }
    public string Location { set; get; }
    public string Vertical { set; get; }
    public string CustomerName { set; get; }
    public string ProjectName { set; get; }
    public string DeliveryManager { set; get; }
    public string AccountCategory { set; get; }
    public int IsActive { set; get; }

    public DataSet GetEmployee()
    {
        Connect objcon = new Connect();
        SqlConnection con = objcon.Getconn();

        DataSet DSJobListed = new DataSet();
        SqlCommand cmd = new SqlCommand("GetEmplyee_SP", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(DSJobListed);
        return DSJobListed;
    }
    public void SaveEmployee(string MID, string Name, string Competency, string Location, string Vertical, string CustomerName, string ProjectName, string DeliveryManager, string AccountCategory, int IsActive)
    {
        try
        {

            Connect con_obj = new Connect();
            con = con_obj.Getconn();
            SqlCommand cmd = new SqlCommand("SaveEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MID", MID);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@Competency", Competency);
            cmd.Parameters.AddWithValue("@Location", Location);
            cmd.Parameters.AddWithValue("@Vertical", Vertical);
            cmd.Parameters.AddWithValue("@CustomerName", CustomerName);
            cmd.Parameters.AddWithValue("@ProjectName", ProjectName);
            cmd.Parameters.AddWithValue("@DeliveryManager", DeliveryManager);
            cmd.Parameters.AddWithValue("@AccountCategory", AccountCategory);
            cmd.Parameters.AddWithValue("@IsActive", IsActive);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }

        catch (Exception ex)
        {
            ex.Message.ToString();
        }


    }


    //public DataSet showEmpid()
    //{
    //    DataSet ds = new DataSet();
    //    try
    //    {


    //        Connect con_obj = new Connect();
    //        con = con_obj.Getconn();
    //        SqlCommand cmd = new SqlCommand("ShowEmpid", con);
    //        SqlDataAdapter ad = new SqlDataAdapter(cmd);
    //        con.Open();
    //        cmd.ExecuteScalar();
    //        ad.Fill(ds, "Emp");
    //        con.Close();
    //        return ds;
    //    }
    //    catch (Exception ex)
    //    {
    //        ex.Message.ToString();
    //    }
    public void importdatafromexcel(string excelfilepath)
    {
        excelfilepath = "D:\\SVNYoujobs_21-2-2014\\trunk\\Projects\\CMS\\Uploads\\dataupload.xlsx";
        //declare variables - edit these based on your particular situation
        string ssqltable = "tdatamigrationtable";
        // make sure your sheet name is correct, here sheet name is sheet1, so you can change your sheet name if have  different

        string myexceldataquery = "select student,rollno,course from [sheet1$]";
        try
        {


            //create our connection strings
            //  string sexcelconnectionstring = " SELECT * INTO XLImport3 FROM OPENDATASOURCE('Microsoft.Jet.OLEDB.4.0','Data Source=D:\\SVNYoujobs_21-2-2014\\trunk\\Projects\\CMS\\Uploads\\dataupload.xlsx;Extended Properties=Excel 8.0')...[Sheet1$]'";
            string sexcelconnectionstring = (@"Provider=Microsoft.Jet.OLEDB.4.0;DataSource=D:\\SVNYoujobs_21-2-2014\\trunk\\Projects\\CMS\\Uploads\\dataupload.xlsx;Extended Properties='Excel 8.0;HDR=NO;IMEX=1'");
            //string sexcelconnectionstring = String.Format(@"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("template.xlsx") + ";Extended Properties="Excel 12.0 Xml;HDR=YES";", excelfilepath);
            //string sexcelconnectionstring = @"provider=microsoft.jet.oledb.4.0;data source=" + excelfilepath +";extended properties=" + "\"excel 8.0;hdr=yes;\"";
            //execute a query to erase any previous data from our destination table
            string sclearsql = "delete from " + ssqltable;

            Connect con_obj = new Connect();
            SqlConnection sqlconn = con_obj.Getconn();
            SqlCommand sqlcmd = new SqlCommand(sclearsql, sqlconn);
            sqlconn.Open();
            sqlcmd.ExecuteNonQuery();
            sqlconn.Close();

            //series of commands to bulk copy data from the excel file into our sql table
            OleDbConnection oledbconn = new OleDbConnection(sexcelconnectionstring);
            OleDbCommand oledbcmd = new OleDbCommand(myexceldataquery, oledbconn);
            oledbconn.Open();
            OleDbDataReader dr = oledbcmd.ExecuteReader();
            SqlBulkCopy bulkcopy = new SqlBulkCopy(sqlconn);
            bulkcopy.DestinationTableName = ssqltable;

            while (dr.Read())
            {
                bulkcopy.WriteToServer(dr);
            }

            oledbconn.Close();
        }
        catch (Exception ex)
        {
            //handle exception
        }
    }
    public int Update_Emp(int Empid, string lmid, string Name, string ProjectName, string Competency, string Location, string Vertical, string CustomerName, string DeliveryManager, string AccountCategory, string IsActive)
    {
        try
        {
            Connect con_obj = new Connect();
            SqlConnection con = con_obj.Getconn(); ;
            SqlCommand cmd = new SqlCommand("UpdateEmp_SP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmpId", SqlDbType.NVarChar, 50).Value = Empid;
            cmd.Parameters.Add("@MID", SqlDbType.NVarChar, 50).Value = lmid;
            cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 50).Value = Name;
            cmd.Parameters.Add("@ProjectName", SqlDbType.NVarChar, 50).Value = ProjectName;
            cmd.Parameters.Add("@Competency", SqlDbType.NVarChar, 50).Value = Competency;
            cmd.Parameters.Add("@Location", SqlDbType.NVarChar, 50).Value = Location;
            cmd.Parameters.Add("@Vertical", SqlDbType.NVarChar, 50).Value = Vertical;
            cmd.Parameters.Add("@CustomerName", SqlDbType.NVarChar, 50).Value = CustomerName;
            cmd.Parameters.Add("@DeliveryManager", SqlDbType.NVarChar, 50).Value = DeliveryManager;
            cmd.Parameters.Add("@AccountCategory", SqlDbType.NVarChar, 50).Value = AccountCategory;
            cmd.Parameters.Add("@IsActive", SqlDbType.NVarChar, 50).Value = IsActive;


            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
        finally
        {
            con.Close();
        }

        return -1;
    }

    public int FillInDB(DataSet ds)
    {


        DataTable dt = new DataTable();
        dt = ds.Tables[0];
        BulkInsertDataTable("tdatamigrationtable", dt);
        return 1;


    }
    public bool BulkInsertDataTable(string tableName, DataTable dataTable)
    {
        //bool isSuccuss;
        //try
        //{
        //    Connect con_obj = new Connect();


        //    SqlConnection SqlConnectionObj = con_obj.Getconn();
        //    SqlConnectionObj.Open();
        //    SqlBulkCopy bulkCopy = new SqlBulkCopy(SqlConnectionObj, SqlBulkCopyOptions.TableLock | SqlBulkCopyOptions.FireTriggers | SqlBulkCopyOptions.UseInternalTransaction, null);
        //    bulkCopy.DestinationTableName = tableName;
        //    bulkCopy.WriteToServer(dataTable);
        //    SqlConnectionObj.Close();
        //    isSuccuss = true;
        //}
        //catch (Exception ex)
        //{
        //    isSuccuss = false;
        //}
        //return isSuccuss;

        Connect con_obj = new Connect();
        SqlConnection connection = con_obj.Getconn();
        // Open a connection to the AdventureWorks database. 
        using (connection)
        {

            connection.Open();
            // Perform an initial count on the destination table.
            SqlCommand commandRowCount = new SqlCommand("SELECT COUNT(*) FROM " + "dbo.tdatamigrationtable;", connection);
            long countStart = System.Convert.ToInt32(
                commandRowCount.ExecuteScalar());


            Console.WriteLine("Starting row count = {0}", countStart);

            // Create a table with some rows. 
            DataTable newProducts = dataTable;

            // Create the SqlBulkCopy object.  
            // Note that the column positions in the source DataTable  
            // match the column positions in the destination table so  
            // there is no need to map columns.  
            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(connection))
            {
                bulkCopy.DestinationTableName ="dbo.tdatamigrationtable";

                try
                {
                    // Write from the source to the destination.
                    bulkCopy.WriteToServer(newProducts);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }

            // Perform a final count on the destination  
            // table to see how many rows were added. 
            long countEnd = System.Convert.ToInt32(
                commandRowCount.ExecuteScalar());
            Console.WriteLine("Ending row count = {0}", countEnd);
            Console.WriteLine("{0} rows were added.", countEnd - countStart);
            Console.WriteLine("Press Enter to finish.");
            Console.ReadLine();



            return true
               ;
        }

    }
}
