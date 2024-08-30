using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["shop_id"] == null)
        {
            Response.Redirect("vendorlogin.aspx");
        }
        conn = new SqlConnection(cs);
        string id = Request.QueryString["id"].ToString();
        using (SqlCommand cmd = new SqlCommand("delete from offer_details where offer_id=@offer_id", conn))
        {

            cmd.Parameters.AddWithValue("@offer_id", id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("manage_offer.aspx");
        }

    }
}