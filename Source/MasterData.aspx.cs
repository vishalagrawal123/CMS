using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class MasterData : System.Web.UI.Page
{
    SqlConnection con = null; 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack != true)
        {
            Load_Location();
        }

    }
    protected void btnaddlocation_Click(object sender, EventArgs e)
    {
        Location emp_obj = new Location();
        emp_obj.locationName = txtlocaname.Text;
        emp_obj.SaveLocation(emp_obj.locationName);
        
    }
    public void Load_Location()
    {
        try
        {
            Location emp_obj = new Location();
            DataSet ds = new DataSet();
            ds = emp_obj.GetAllLocation();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        catch(Exception ex)
        {

        }

    }

}