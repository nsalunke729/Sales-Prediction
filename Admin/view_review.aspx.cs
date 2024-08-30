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
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //dt = new DataTable();
        //using (SqlCommand cmd = new SqlCommand("select rm.rev_id,rm.uid,rm.product_id,rm.sentiment_result,pm.product_id,pm.name,um.uid,um.name as username from dbo.review_master rm inner join product_master pm on rm.product_id=pm.product_id inner join user_master um on rm.uid=um.uid", conn))
        //{

        //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //    {
        //        sda.Fill(dt);
        //    }
        //    if (dt.Rows.Count > 0)
        //    {
        //        flag = true;
        //    }
        //}
        if (!IsPostBack)
        {
            if (Session["aid"] == null)
            {
                Response.Redirect("admin_login.aspx");
            }
            conn = new SqlConnection(cs);
            using (SqlCommand cmd1 = new SqlCommand("select * from product_master", conn))
            {
                using (SqlDataAdapter sda1=new SqlDataAdapter(cmd1))
                {
                    DataTable dt1=new DataTable();
                    sda1.Fill(dt1);
                    if (dt1.Rows.Count>0)
                    {
                        ddproduct.DataSource = dt1;
                        ddproduct.DataValueField = "product_id";
                        ddproduct.DataTextField = "name";
                       ddproduct.DataBind();
                    }
                }
            }
            ddproduct.Items.Insert(0,new ListItem("--Select Product--","0"));
        }
        Chart1.Visible = false;
    }
    protected void ddproduct_SelectedIndexChanged(object sender, EventArgs e)
    {
           conn = new SqlConnection(cs);
        int positive, neutral, negative;
          using (SqlCommand cmd = new SqlCommand("getreview", conn))
                        {

                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@product_id", ddproduct.SelectedValue);
                            using (SqlDataAdapter da=new SqlDataAdapter(cmd))
                            {
                                DataTable dt=new DataTable();
                                da.Fill(dt);
                                if (dt.Rows.Count>0)
                                {
                                    if (dt.Rows[0]["possitive"].ToString()=="")
                                    {
                                        positive =0;
                                    }
                                    else
                                    {
                                        positive = Convert.ToInt32(dt.Rows[0]["possitive"].ToString());
                                    }
                                    if (dt.Rows[0]["neutral"].ToString()=="")
                                    {
                                        neutral =0;
                                    }
                                    else
                                    {
                                        neutral = Convert.ToInt32(dt.Rows[0]["neutral"].ToString());
                                    }
                               
                                    if (dt.Rows[0]["negative"].ToString() == "")
                                    {
                                         negative =0;
                                    }
                                    else
                                    {
                                         negative = Convert.ToInt32(dt.Rows[0]["negative"].ToString());
                                    }
                                        

                                        //int[] x = {positive,neutral,negative};
                                        //string[] y = {"Positive","Neutral","Negative"};
                                    int[] x = { positive,negative };
                                    string[] y = { "Positive","Negative" };

                                        Chart1.Series["Series1"].Points.DataBindXY(y,x);
                                        Chart1.DataBind();
                                        Chart1.Visible = true;
                                }
                                else
                                {
                                    Response.Write("<script>alert('No Data Found')</script>");
                                }
                            }

                        }
                    }
    }

