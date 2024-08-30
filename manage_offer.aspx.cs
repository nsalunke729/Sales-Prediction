using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["shop_id"] == null)
        {
            Response.Redirect("vendorlogin.aspx");
        }
        conn = new SqlConnection(cs);
        dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand("select * from  offer_details om inner join category_master cm on om.cat_id=cm.cat_id", conn))
        {

            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                flag = true;
            }
        }
    }
}