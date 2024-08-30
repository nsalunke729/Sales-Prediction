using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }
        conn=new SqlConnection(cs);
        string id = Request.QueryString["id"].ToString();
        using (SqlCommand cmd = new SqlCommand("delete from customer_master where customer_id=@customer_id", conn))
        {

            cmd.Parameters.AddWithValue("@customer_id", id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("manage_customer.aspx");
        }
    }
}