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
    protected static string msg = "";
    protected static string id;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Session["shop_id"] == null)
            {
                Response.Redirect("vendorlogin.aspx");
            }


            conn = new SqlConnection(cs);
            if (Request.QueryString["msg"] != null)
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {

                    using (SqlCommand cmd = new SqlCommand("select * from offer_details where offer_id=@offer_id", conn))
                    {

                        cmd.Parameters.AddWithValue("@offer_id", id);
                        DataTable dt = new DataTable();
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                        if (dt.Rows.Count > 0)
                        {
                          txtoffername.Text = dt.Rows[0]["offname"].ToString();
                          txtprice.Text = dt.Rows[0]["price"].ToString();
                          txtofferprice.Text = dt.Rows[0]["offprice"].ToString();
                          txtoffdesc.Text = dt.Rows[0]["offdescription"].ToString();
                          showimge.ImageUrl = dt.Rows[0]["image"].ToString();
                          

                        }
                    }
                }
            }

            bindcategory();
        }

    
    }

    public void bindcategory()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from category_master", conn))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddcategory.DataSource = dt;
                    ddcategory.DataValueField = "cat_id";
                    ddcategory.DataTextField = "category";
                    ddcategory.DataBind();

                }
            }
        }
       ddcategory.Items.Insert(0,new ListItem("--Select Category--",""));

    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {


        conn = new SqlConnection(cs);

        string msg1 = Request.QueryString["msg"] != null ? Request.QueryString["msg"].ToString() : "";
        if (msg1 == "edit")
        {

            if (fileuplogo.HasFile)
            {
                string str = fileuplogo.FileName;
                fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
                string image = "img/" + str.ToString();

                using (SqlCommand cmd = new SqlCommand("update offer_details set cat_id=@cat_id,offname=@offname,price=@price,offprice=@offprice,offdescription=@offdescription,offstartdate=@offstartdate,offlastdate=@offlastdate,image=@image where offer_id=@offer_id",
                            conn))
                {

                    cmd.Parameters.AddWithValue("@offer_id",id);
                    cmd.Parameters.AddWithValue("@offname",txtoffername.Text);
                    cmd.Parameters.AddWithValue("@price", txtprice.Text);
                    cmd.Parameters.AddWithValue("@offprice",txtofferprice.Text);
                    cmd.Parameters.AddWithValue("@offdescription",txtoffdesc.Text);
                    cmd.Parameters.AddWithValue("@cat_id", ddcategory.SelectedValue);

                    string dateString = txtsdate.Text;
                    DateTime date1 = Convert.ToDateTime(dateString, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);


                    cmd.Parameters.AddWithValue("@offstartdate", date1);

                    string dateString1 = txtldate.Text;
                    DateTime date2 = Convert.ToDateTime(dateString1, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

                    cmd.Parameters.AddWithValue("@offlastdate", date2);
                    cmd.Parameters.AddWithValue("@image", image);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("manage_offer.aspx");

                }
            }
            else
            {
                using (
                    SqlCommand cmd =
                        new SqlCommand(
                            "update offer_details set cat_id=@cat_id,offname=@offname,price=@priceoffprice=@offprice,offdescription=@offdescription,offstartdate=@offstartdate,offlastdate=@offlastdate where offer_id=@offer_id",
                            conn))
                {

                    cmd.Parameters.AddWithValue("@offer_id", id);
                    cmd.Parameters.AddWithValue("@offname", txtoffername.Text);
                    cmd.Parameters.AddWithValue("@price",txtprice.Text);
                    cmd.Parameters.AddWithValue("@offprice", txtofferprice.Text);
                    cmd.Parameters.AddWithValue("@offdescription", txtoffdesc.Text);
                    cmd.Parameters.AddWithValue("@cat_id", ddcategory.SelectedValue);

                    string dateString = txtsdate.Text;
                    DateTime date1 = Convert.ToDateTime(dateString, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);


                    cmd.Parameters.AddWithValue("@offstartdate", date1);

                    string dateString1 = txtldate.Text;
                    DateTime date2 = Convert.ToDateTime(dateString1, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

                    cmd.Parameters.AddWithValue("@offlastdate", date2);


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("manage_offer.aspx");

                }
            }

        }
        else
        {

            DataTable dt = new DataTable();

            //using (SqlCommand cmd1 =new SqlCommand("select * from product_master where name=@name and cat_id=@cat_id and brand_id=@brand_id and color_id=@color_id and price=@price",conn))
            //{

            //    cmd1.Parameters.AddWithValue("@name", txtproductname.Text);
            //    cmd1.Parameters.AddWithValue("@cat_id", ddcategory.SelectedValue);
            //    cmd1.Parameters.AddWithValue("@brand_id", ddbrand.SelectedValue);
            //    cmd1.Parameters.AddWithValue("@color_id", ddcolor.SelectedValue);
            //    cmd1.Parameters.AddWithValue("@price", txtprice.Text);


            //SqlDataAdapter sda = new SqlDataAdapter(cmd1);
            //sda.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    Response.Write("<script>alert('Product already exist')</script>");
            //}
            //else
            //{

            if (fileuplogo.HasFile)
            {

                string str = fileuplogo.FileName;
                fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
                string image = "img/" + str.ToString();


                using (SqlCommand cmd = new SqlCommand("insert into offer_details(cat_id,vendor_id,offname,price,offprice,offdescription,offstartdate,offlastdate,image) values(@cat_id,@vendor_id,@offname,@price,@offprice,@offdescription,@offstartdate,@offlastdate,@image)", conn))
                {
                    cmd.Parameters.AddWithValue("@vendor_id", Session["shop_id"]);
                    cmd.Parameters.AddWithValue("@offname",txtoffername.Text);
                    cmd.Parameters.AddWithValue("@price",txtprice.Text);
                    cmd.Parameters.AddWithValue("@offprice", txtofferprice.Text);
                    cmd.Parameters.AddWithValue("@offdescription",txtoffdesc.Text);
                    cmd.Parameters.AddWithValue("@cat_id", ddcategory.SelectedValue);

                    string dateString = txtsdate.Text;
                    DateTime date1 = Convert.ToDateTime(dateString, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);


                    cmd.Parameters.AddWithValue("@offstartdate", date1);

                    string dateString1 = txtldate.Text;
                    DateTime date2 = Convert.ToDateTime(dateString1, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

                    cmd.Parameters.AddWithValue("@offlastdate", date2);
                    cmd.Parameters.AddWithValue("@image", image);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("manage_offer.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Please Choose Photo')</script>");
            }

            // }
            // }

        }


    }
}