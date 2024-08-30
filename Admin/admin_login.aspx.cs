using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_login : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Abandon();
            Session.Clear();
          
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from admin where username=@username and password=@password", conn))
        {
            DataTable dt = new DataTable();
            cmd.Parameters.AddWithValue("@username",txtusername.Text);
            cmd.Parameters.AddWithValue("@password",txtpassword.Text);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                Session["admin_id"] = dt.Rows[0]["admin_id"].ToString();
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Login')</script>");
            }
        } 
    }
}