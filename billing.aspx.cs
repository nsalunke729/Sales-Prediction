using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
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
           
            bindcustomer();
            bindcategory();
            bindproduct();
           
        }
        

    }
    public void bindcustomer()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from customer_master", conn))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddcustomer.DataSource = dt;
                    ddcustomer.DataValueField = "customer_id";
                    ddcustomer.DataTextField = "custname";
                    ddcustomer.DataBind();

                }
            }
        }
        ddcustomer.Items.Insert(0, new ListItem("--Select Customer--", ""));

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
        ddcategory.Items.Insert(0, new ListItem("--Select Category--", ""));

    }
   
    protected void ddcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
    
        //conn = new SqlConnection(cs);
        //using (SqlCommand cmd = new SqlCommand("select * from Product_master where cat_id=@cat_id", conn))
        //{
        //    cmd.Parameters.AddWithValue("@cat_id",ddcategory.SelectedValue);
        //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //    {
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        if (dt.Rows.Count > 0)
        //        {
        //            ddproduct.DataSource = dt;
        //            ddproduct.DataValueField = "P_id";
        //            ddproduct.DataTextField = "product_name";
        //            ddproduct.DataBind();

        //        }
        //    }
        //}
        //ddproduct.Items.Insert(0, new ListItem("--Select Product--", ""));

    
    }

    public void bindproduct()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from Product_master", conn))
        {
            
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddproduct.DataSource = dt;
                    ddproduct.DataValueField = "P_id";
                    ddproduct.DataTextField = "product_name";
                    ddproduct.DataBind();

                }
            }
        }
        ddproduct.Items.Insert(0, new ListItem("--Select Product--", ""));
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        if (ddcustomer.SelectedItem.Text == "--Select Customer--" || ddcategory.SelectedItem.Text == "--Select Category--" || ddproduct.SelectedItem.Text == "--Select Product--")
        {
            Response.Write("<script>alert('Select All Field')</script>");
        }
        else
        {

            string age="", gender="", occupation = "",Season="",user_email="";
            int bill_amount=0;
            using (SqlCommand cmd = new SqlCommand("select * from customer_master where customer_id=@customer_id", conn))
            {
                cmd.Parameters.AddWithValue("@customer_id",ddcustomer.SelectedValue);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        age = dt.Rows[0]["custage"].ToString();
                        gender = dt.Rows[0]["custgender"].ToString();
                        occupation = dt.Rows[0]["custoccupation"].ToString();
                        user_email = dt.Rows[0]["custemail"].ToString();

                    }
                }
            }

             using (SqlCommand cmd = new SqlCommand("select * from Season_Master where cast(getdate() as date) between From_Date and To_Date", conn))
            {
               
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Season = dt.Rows[0]["Season"].ToString();
                        

                    }
                }
            }





            using (SqlCommand cmd = new SqlCommand("insert into buying_master(Age,Gender,P_id,Quantity,user_id,amount,Bill,shop_id) values(@Age,@Gender,@P_id,@Quantity,@user_id,@amount,@Bill,@shop_id)", conn))
            {

                cmd.Parameters.AddWithValue("@Age",age);
                cmd.Parameters.AddWithValue("@Gender",gender);

                cmd.Parameters.AddWithValue("@P_id",ddproduct.SelectedValue);
                cmd.Parameters.AddWithValue("@Quantity",txtqty.Text);
                cmd.Parameters.AddWithValue("@user_id",ddcustomer.SelectedValue);
                cmd.Parameters.AddWithValue("@amount", txtamount.Text);
                 bill_amount=((Convert.ToInt32(txtqty.Text))*(Convert.ToInt32(txtamount.Text)));
                cmd.Parameters.AddWithValue("@Bill",bill_amount);
                cmd.Parameters.AddWithValue("@shop_id", Session["shop_id"]);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

               
            }
            using (SqlCommand cmd = new SqlCommand("insert into Dataset(User_Id,Gender,Age,Occupation,History,Shop_Id,Season) values(@User_Id,@Gender,@Age,@Occupation,@History,@Shop_Id,@Season)", conn))
            {

                cmd.Parameters.AddWithValue("@User_Id",ddcustomer.SelectedValue);
                cmd.Parameters.AddWithValue("@Gender",gender);
                cmd.Parameters.AddWithValue("@Age",age);
                cmd.Parameters.AddWithValue("@Occupation",occupation);
               
                cmd.Parameters.AddWithValue("@History",ddcategory.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Shop_Id", Session["shop_id"]);
                cmd.Parameters.AddWithValue("@Season", Season);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


                SmtpClient smtpserver = new SmtpClient();
                MailMessage mail = new MailMessage();
                smtpserver.UseDefaultCredentials = false;
                smtpserver.Credentials = new System.Net.NetworkCredential("togale4@gmail.com", "tej@12345");
                smtpserver.Port = 25;
                smtpserver.EnableSsl = true;
                smtpserver.Host = "smtp.gmail.com";
                mail = new MailMessage();
                mail.From = new MailAddress("togale4@gmail.com");
                mail.To.Add(user_email);
                mail.Subject = "Bill Details";
                mail.Body = "Your Shopping Bill,Product:" + ddproduct.SelectedItem.Text + "," + "Amount:" + bill_amount;
                smtpserver.Send(mail);


                Response.Write("<script>alert('Bill Create Successfull')</script>");
                txtamount.Text = "";
                txtqty.Text = "";


            }
        }
    }
}