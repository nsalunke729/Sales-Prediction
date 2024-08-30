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
                                " select * from shop_master where shop_id=@shop_id", conn))
                    {

                        cmd.Parameters.AddWithValue("@shop_id", id);
                        DataTable dt = new DataTable();
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                        if (dt.Rows.Count > 0)
                        {

                            txtshopname.Text = dt.Rows[0]["name"].ToString();
                            txtpassword.Text = dt.Rows[0]["password"].ToString();
                            txtcontact.Text = dt.Rows[0]["contact"].ToString();
                            txtdescription.Text = dt.Rows[0]["description"].ToString();
                            txtemailid.Text = dt.Rows[0]["email"].ToString();
                           

                        }
                    }
                }
            }


        }
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
                        "update shop_master set name=@name,contact=@contact,description=@description,email=@email,password=@password where shop_id=@shop_id",
                        conn))
            {

                cmd.Parameters.AddWithValue("@shop_id", id);
                cmd.Parameters.AddWithValue("@name", txtshopname.Text);
                cmd.Parameters.AddWithValue("@contact", txtcontact.Text);
                cmd.Parameters.AddWithValue("@description",txtdescription.Text);
                cmd.Parameters.AddWithValue("@email", txtemailid.Text);
                cmd.Parameters.AddWithValue("@password",txtpassword.Text);
                
              
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("manage_shop.aspx");

            }
        }

        else
        {

            DataTable dt = new DataTable();

            using (SqlCommand cmd1 = new SqlCommand("select * from shop_master where email=@email and contact=@contact", conn))
            {

                cmd1.Parameters.AddWithValue("@email", txtemailid.Text);
                cmd1.Parameters.AddWithValue("@contact", txtcontact.Text);


                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('shop already exist')</script>");
                }
                else
                {

                    using (SqlCommand cmd = new SqlCommand("insert into shop_master(name,contact,description,email,password) values(@name,@contact,@description,@email,@password)", conn))
                    {

                        cmd.Parameters.AddWithValue("@name",txtshopname.Text);
                        cmd.Parameters.AddWithValue("@contact",txtcontact.Text);
                        cmd.Parameters.AddWithValue("@description",txtdescription.Text);

                        cmd.Parameters.AddWithValue("@email", txtemailid.Text);

                        cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                       

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
                        mail.To.Add(txtemailid.Text);
                        mail.Subject = "Shopping Mall Prediction";
                        mail.Body = "Your user name :" + txtemailid.Text + "," + "Password :" + txtpassword.Text;
                        smtpserver.Send(mail);
                        Response.Redirect("manage_shop.aspx");
                    }
                }




            }
        }
    }
}