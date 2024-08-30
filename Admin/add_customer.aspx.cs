using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Session["admin_id"] == null)
            {
                Response.Redirect("admin_login.aspx");
            }

            conn = new SqlConnection(cs);
            if (Request.QueryString["msg"] != null)
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {

                    using (SqlCommand cmd = new SqlCommand(
                                " select * from customer_master where customer_id=@customer_id", conn))
                    {

                        cmd.Parameters.AddWithValue("@customer_id", id);
                        DataTable dt = new DataTable();
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                        if (dt.Rows.Count > 0)
                        {
                           txtname.Text = dt.Rows[0]["custname"].ToString();

                            txtemail.Text= dt.Rows[0]["custemail"].ToString();
                             txtmobile.Text= dt.Rows[0]["custcontact"].ToString();
                            txtage.Text = dt.Rows[0]["custage"].ToString();
                            

                        }
                    }
                }
            }


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
                //sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    //ddcategory.DataSource = dt;
                    //ddcategory.DataValueField = "cat_id";
                    //ddcategory.DataTextField = "name";
                    //ddcategory.DataBind();

                }
            }
        }
        //ddcategory.Items.Insert(0,new ListItem("--Select Category--",""));

    }
    public void bindbrand()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from brand_master", conn))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                //sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    //ddbrand.DataSource = dt;
                    //ddbrand.DataValueField = "brand_id";
                    //ddbrand.DataTextField = "name";
                    //ddbrand.DataBind();

                }
            }
        }
        //ddbrand.Items.Insert(0, new ListItem("--Select Brand--", ""));

    }

    public void bindcolor()
    {
        conn = new SqlConnection(cs);
        using (SqlCommand cmd = new SqlCommand("select * from color_master", conn))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                //sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    //ddcolor.DataSource = dt;
                    //ddcolor.DataValueField = "color_id";
                    //ddcolor.DataTextField = "name";
                    //ddcolor.DataBind();

                }
            }
        }
        //  ddcolor.Items.Insert(0, new ListItem("--Select Color--", ""));

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);

        string msg1 = Request.QueryString["msg"] != null ? Request.QueryString["msg"].ToString() : "";
        if (msg1 == "edit")
        {

            using (
                SqlCommand cmd =
                    new SqlCommand(
                        "update customer_master set custname=@custname,custemail=@custemail,custcontact=@custcontact,custage=@custage,custgender=@custgender,custoccupation=@custoccupation,custtype=@custtype where customer_id=@customer_id",
                        conn))
            {

                cmd.Parameters.AddWithValue("@customer_id", id);
                cmd.Parameters.AddWithValue("@custname", txtname.Text);
                cmd.Parameters.AddWithValue("@custemail", txtemail.Text);
                cmd.Parameters.AddWithValue("@custcontact", txtmobile.Text);
                cmd.Parameters.AddWithValue("@custage",txtage.Text);
                cmd.Parameters.AddWithValue("@custgender", ddgender.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@custoccupation",ddoccupation.SelectedItem.Text);
               

                //string dateString = txtdate.Text;
                //DateTime date1 = Convert.ToDateTime(dateString, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("manage_customer.aspx");

            }
        }

        else
        {

            DataTable dt = new DataTable();

            using (SqlCommand cmd1 = new SqlCommand("select * from customer_master where custemail=@custemail and custcontact=@custcontact", conn))
            {

                cmd1.Parameters.AddWithValue("@custemail",txtemail.Text);
                cmd1.Parameters.AddWithValue("@custcontact",txtmobile.Text);


                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Customer already exist')</script>");
                }
                else
                {

                    using (SqlCommand cmd = new SqlCommand("insert into customer_master(custname,custemail,custcontact,custage,custgender,custoccupation,custtype) values(@custname,@custemail,@custcontact,@custage,@custgender,@custoccupation,@custtype)", conn))
                    {

                        cmd.Parameters.AddWithValue("@custname",txtname.Text);
                        cmd.Parameters.AddWithValue("@custemail",txtemail.Text);
                        cmd.Parameters.AddWithValue("@custcontact",txtmobile.Text);

                        cmd.Parameters.AddWithValue("@custage",txtage.Text);

                        cmd.Parameters.AddWithValue("@custgender",ddgender.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@custoccupation",ddoccupation.SelectedItem.Text);
                      

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
                        mail.To.Add(txtemail.Text);
                        mail.Subject = "Shopping Mall Prediction";
                        mail.Body = "Your user name :" + txtemail.Text + "," + "Contact No :" + txtmobile.Text;
                        smtpserver.Send(mail);
                        Response.Redirect("manage_customer.aspx");
                    }
                }


            }
        }
    }
}
        

        
    

    
