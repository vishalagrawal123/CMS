using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

public partial class Employee_AddEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack != true)
        {
            Location objloc = new Location();
            DataSet ds = new DataSet();
            ds = objloc.GetLocation();
            ddlocation.DataSource = ds;
            ddlocation.DataTextField = "LocationName";
            ddlocation.DataBind();
          
        }
    }
    protected void ddlistaccCate_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
  
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            Employee emp_obj = new Employee();
            emp_obj.MID=txtmid.Text;
            emp_obj.Name = txtname.Text;
            emp_obj.Competency = txtcompetency.Text;
            emp_obj.Location = ddlocation.SelectedItem.Text;
            emp_obj.Vertical = txtvertical.Text;
            emp_obj.CustomerName = txtcustname.Text;
            emp_obj.ProjectName = txtprojname.Text;
            emp_obj.DeliveryManager = txtdeliverymanager.Text;
            emp_obj.AccountCategory = txtaccCate.Text;
            emp_obj.IsActive = Convert.ToInt32(txtIsactive.Text);
            emp_obj.SaveEmployee(emp_obj.MID, emp_obj.Name, emp_obj.Competency, emp_obj.Location, emp_obj.Vertical, emp_obj.CustomerName, emp_obj.ProjectName, emp_obj.DeliveryManager, emp_obj.AccountCategory, emp_obj.IsActive);
            lblmsg.Text = "Record Saved Sucessfuly";
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message.ToString();
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        txtname.Text = "";
        txtmid.Text = "";
        txtcustname.Text = "";
        txtcompetency.Text = "";
        txtdeliverymanager.Text = "";
        txtprojname.Text = "";
        txtvertical.Text = "";
        txtIsactive.Text = "";
        txtaccCate.Text = "";
        ddlocation.Text = "";
    }
    protected void txtaccCate_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtcustname_TextChanged(object sender, EventArgs e)
    {

    }
}