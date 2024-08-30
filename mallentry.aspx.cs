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

public partial class MallEntry : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected DataTable dt1;
    protected static string msg = "",Season="";
    protected static string id,cat_name,user_email;
    protected static int buy_id,cat_id;
    protected static bool flag = false;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        int user_id=0;

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

        

        if(Season!="")
        {

            using (SqlCommand cmd = new SqlCommand("select * from customer_master where custcontact=@custcontact", conn))
            {
                cmd.Parameters.AddWithValue("@custcontact", txtmobile.Text);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        user_id = Convert.ToInt32(dt.Rows[0]["customer_id"].ToString());
                        user_email = dt.Rows[0]["custemail"].ToString();

                    }
                }
            }
            using (SqlCommand cmd = new SqlCommand("select top 1 count(User_Id) as buy_count,History,season from Dataset where User_Id=@User_Id and season=@season group by History,season order by buy_count desc", conn))
            {
                cmd.Parameters.AddWithValue("@User_Id", user_id);
                cmd.Parameters.AddWithValue("@season", Season);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        buy_id = Convert.ToInt32(dt.Rows[0]["buy_count"].ToString());
                        cat_name = dt.Rows[0]["History"].ToString();


                    }
                    else
                    {
                        Response.Write("<script>alert('No Data')</script>");
                    }
                }
            }

            using (SqlCommand cmd = new SqlCommand("select * from category_master where category=@category", conn))
            {
                cmd.Parameters.AddWithValue("@category", cat_name);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        cat_id = Convert.ToInt32(dt.Rows[0]["cat_id"].ToString());


                    }
                }
            }



            using (SqlCommand cmd = new SqlCommand("select om.offer_id as Id,om.offname as offer,om.offprice as price,om.offstartdate as start_date,om.offlastdate as last_date,cm.category,sm.name as shop_name from offer_details om  inner join category_master cm on om.cat_id=cm.cat_id inner join shop_master sm on om.vendor_id=sm.shop_id  where cm.cat_id=@cat_id", conn))
            {
                cmd.Parameters.AddWithValue("@cat_id", cat_id);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    dt1 = new DataTable();
                    sda.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        flag = true;

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
                        mail.Subject = "Shopping Mall Prediction";
                        mail.Body = "Offer For You :" + dt1;
                        smtpserver.Send(mail);



                    }
                    else
                    {
                        Response.Write("<script>alert('No Offer Available')</script>");
                    }
                }
                txtmobile.Text = "";

            }

        }
        else
        {

             using (SqlCommand cmd = new SqlCommand("select * from customer_master where custcontact=@custcontact", conn))
            {
                cmd.Parameters.AddWithValue("@custcontact", txtmobile.Text);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        user_id = Convert.ToInt32(dt.Rows[0]["customer_id"].ToString());
                        user_email = dt.Rows[0]["custemail"].ToString();

                    }
                }
            }
            using (SqlCommand cmd = new SqlCommand("select top 1 count(User_Id) as buy_count,History from Dataset where User_Id=@User_Id  group by History order by buy_count desc", conn))
            {
                cmd.Parameters.AddWithValue("@User_Id", user_id);
              
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        buy_id = Convert.ToInt32(dt.Rows[0]["buy_count"].ToString());
                        cat_name = dt.Rows[0]["History"].ToString();


                    }
                    else
                    {
                        Response.Write("<script>alert('No Data')</script>");
                    }
                }
            }

            using (SqlCommand cmd = new SqlCommand("select * from category_master where category=@category", conn))
            {
                cmd.Parameters.AddWithValue("@category", cat_name);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        cat_id = Convert.ToInt32(dt.Rows[0]["cat_id"].ToString());


                    }
                }
            }



            using (SqlCommand cmd = new SqlCommand("select om.offer_id as Id,om.offname as offer,om.offprice as price,om.offstartdate as start_date,om.offlastdate as last_date,cm.category,sm.name as shop_name from offer_details om  inner join category_master cm on om.cat_id=cm.cat_id inner join shop_master sm on om.vendor_id=sm.shop_id  where cm.cat_id=@cat_id", conn))
            {
                cmd.Parameters.AddWithValue("@cat_id", cat_id);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    dt1 = new DataTable();
                    sda.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        flag = true;

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
                        mail.Subject = "Shopping Mall Prediction";
                        mail.Body = "Offer For You :" + dt1;
                        smtpserver.Send(mail);



                    }
                    else
                    {
                        Response.Write("<script>alert('No Offer Available')</script>");
                    }
                }
                txtmobile.Text = "";

            }



        
       }



    }


    }
