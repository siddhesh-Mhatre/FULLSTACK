using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceApp
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["DBconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string user = TextBox1.Text, pass = TextBox2.Text , email = TextBox3.Text;
            string query = "exec IfExist '" + email + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.HasRows)
            {
                Response.Write("<script>alert('User Already Exist')</script>");
            }
            else
            {
                string q = "exec AuthReg '" + email + "','" + user + "','" + pass + "','User'";
                SqlCommand c = new SqlCommand(q, conn);
                c.ExecuteNonQuery();

                Response.Write("<script>alert('Registered Successfully')</script>");
                Response.Redirect("Default.aspx");
                
            }

        }
    }
}