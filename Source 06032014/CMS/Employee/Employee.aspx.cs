using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml.Xsl;
using System.Collections;
using System.IO;
using System.Data.OleDb;
using System.Data.Common;
using System.Web.Configuration;

public partial class Employee_Employee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack != true)
        {

            GetEmployee();

            }
        }

      
   
    protected void gvemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
   
    protected void btnimport_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            //string FilePath = "D:\\upload";
            //bool blSucces = false;
            string filename = string.Empty;
            //string[] allowdFile = { ".pdf" };
            ////Here we are allowing only pdf file so verifying selected file pdf or not
            //string FileExt = System.IO.Path.GetExtension(FileUploadToServer.PostedFile.FileName);
            //bool isValidFile = allowdFile.Contains(FileExt);
            //if (!isValidFile)
            //{
            //    lblMsg.ForeColor = System.Drawing.Color.Red;
            //    lblMsg.Text = "Please upload only exl ";
            //}
            if(fileuploademp.HasFile)
            {
                //string[] allowdFile = { ".xlsx" };
                //Get file name of selected file
                filename = System.IO.Path.GetFileName(fileuploademp.FileName);
                fileuploademp.PostedFile.SaveAs(Server.MapPath("~/Uploads/" + filename));


                ArrayList alist = new ArrayList();
                string connString = "";
                string strFileType = Path.GetExtension(fileuploademp.FileName).ToLower();
                string fileBasePath = Server.MapPath("~/Uploads/");
                string fileName = Path.GetFileName(this.fileuploademp.FileName);
                string fullFilePath = fileBasePath + fileName;

                //Connection String to Excel Workbook
                if (strFileType.Trim() == ".xls")
                {
                    connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fullFilePath +
                                  ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=1\"";
                }
                else if (strFileType.Trim() == ".xlsx")
                {
                    connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fullFilePath +
                                 ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=1\"";
                }
                if (fileuploademp.HasFile)
                {
                   

                    //string query = "select student,rollno,course from [sheet1$]";
                    string query = "select EmployeeID,Name,Competency,Location,Vertical,CustomerName,ProjectName,DeliveryManager,AccountCategory from [sheet1$]";
                    using (OleDbConnection conn = new OleDbConnection(connString))
                    {
                        if (conn.State == ConnectionState.Closed)
                            conn.Open();
                        OleDbCommand cmd = new OleDbCommand(query, conn);
                        OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        FillInDB( ds);
                        Validate_UploadedData();
                        Session["griddata"] = ds.Tables[0];
                        GridViewImport.DataSource = Session["griddata"];
                        GridViewImport.DataBind();
                        
                    }
                }

               
            }
        }
        catch(Exception ex)
        {
            lblmsg.Text = ex.Message.ToString();
        }
     }
    public int Validate_UploadedData()
    {
        Employee objemp = new Employee();
        DataSet ds = new DataSet();
        ds=objemp.ValidateUploadedData();
        return 1;
    }
    public int FillInDB(DataSet ds)
    {
        Employee objEmp = new Employee();
        int res = objEmp.FillInDB(ds);
        return res;
 
    }
    protected void gvemp_RowEditing(object sender, GridViewEditEventArgs e)
    {
       
    }

    private void GetEmployee()
    {
            Employee objemp = new Employee();
            DataSet ds = new DataSet();
            ds = objemp.GetEmployee();
            gvemp.DataSource = ds;
            gvemp.DataBind();
    }

    protected void gvemp_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GetEmployee();
    }

    protected void gvemp_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        gvemp.EditIndex = e.NewEditIndex;

        GetEmployee();
    }
    protected void gvemp_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Employee emp_obj = new Employee();
        int empid = int.Parse(((Label)gvemp.Rows[e.RowIndex].FindControl("lblEmpId")).Text);
        string lmid = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtMID")).Text;
        string Name = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtName")).Text;
        string ProjectName = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtProjectName")).Text;
        string Competency = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtCompetency")).Text;
        string Location = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtLocation")).Text;
        string Vertical = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtVertical")).Text;
        string CustomerName = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtCustomerName")).Text;
        string DeliveryManager = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtDeliveryManager")).Text;
        string AccountCategory = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtAccountCategory")).Text;
        string IsActive = ((TextBox)gvemp.Rows[e.RowIndex].FindControl("txtIsActive")).Text;
        int i = emp_obj.Update_Emp(empid,lmid, Name, ProjectName, Competency, Location, Vertical, CustomerName, DeliveryManager, AccountCategory, IsActive);
        gvemp.EditIndex = -1;
        GetEmployee();

    }
    protected void gvemp_Disposed(object sender, EventArgs e)
    {

    }
    protected void gvemp_RowUpdated1(object sender, GridViewUpdatedEventArgs e)
    {
        GetEmployee();
    }
    protected void btnaddemp_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddEmployee.aspx");
    }
    protected void gvemp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvemp.EditIndex = -1;
        GetEmployee();
    }
}
