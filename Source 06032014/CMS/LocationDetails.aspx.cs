using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class LocationDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack != true)
        {
           
                 Location objemp = new Location();
                 DataSet ds = new DataSet();
                 ds = objemp.GetLocation();
                 gvlocation.DataSource = ds;
                 gvlocation.DataBind();

            }
        }

    }
