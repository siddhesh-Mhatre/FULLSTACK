using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecom2.AdminPanel
{
    public partial class OrderHIstory : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["DBconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();

            if (!IsPostBack)
            {
                FetchUserList();
            }
        }

        protected void FetchUserList()
        {
            string q = "SELECT * FROM placeOrder";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView2.DataSource = rdr;
            GridView2.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Response.Write("Hello");
        }

        protected void GridView2_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            string q;
            if (e.CommandName == "Status")
            {
                string id = e.CommandArgument.ToString();
                Response.Write(id);
                q = "SELECT * FROM placeOrder WHERE pid='" + id + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                string Status = rdr["Status"].ToString();


                if (Status.Equals("In Process"))
                {
                    string q1 = "UPDATE placeOrder SET Status='Delivered' WHERE pid='" + id + "'";
                    SqlCommand c = new SqlCommand(q1, conn);
                    c.ExecuteNonQuery();
                    Response.Redirect("OrderHistory.aspx");
                }
                else if (Status.Equals("Delivered"))
                {
                    string q2 = "UPDATE placeOrder SET Status='In Process' WHERE pid='" + id + "'";
                    SqlCommand c = new SqlCommand(q2, conn);
                    c.ExecuteNonQuery();
                    Response.Redirect("OrderHistory.aspx");
                }



                //string q = "exec UserFindById '" + id + "'";
                //SqlCommand cmd = new SqlCommand(q, conn);
                //SqlDataReader dr = cmd.ExecuteReader();
                //dr.Read();

                //string Status = dr["pid"].ToString();

                //if(Status.Equals(""))

            }
        }
    }
}