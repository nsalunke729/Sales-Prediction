using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

public partial class Admin_Default : System.Web.UI.Page
{

    
    private string constr, query;

    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }
        if(!IsPostBack)
        {
            Bindchart();
        }
    }

    private void Bindchart()
    {
        conn = new SqlConnection(cs);

        query = "select count(History) as product_count,History from Dataset group by History";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        DataTable ChartData = ds.Tables[0];

       
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {

            XPointMember[count] = ChartData.Rows[count]["History"].ToString();

            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["product_count"]);


        }
      
        Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);

     
        Chart1.Series[0].BorderWidth = 1;
      
        Chart1.Series[0].ChartType = SeriesChartType.Line;
       


       

    }  
}