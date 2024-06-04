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
    public partial class Default : System.Web.UI.Page
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
            string user = TextBox1.Text, pass = TextBox2.Text;
            string q = "exec AuthLogin '" + user + "','" + pass + "'";
            SqlCommand command = new SqlCommand(q, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    if ((reader["username"].Equals(user) || reader["email"].Equals(user)) && reader["pass"].Equals(pass) && reader["urole"].Equals("Admin"))
                    {
                        Session["User"] = reader["email"];
                        Response.Redirect("AdminHome.aspx");
                    }

                    if ((reader["username"].Equals(user) || reader["email"].Equals(user)) && reader["pass"].Equals(pass) && reader["urole"].Equals("User"))
                    {
                        Session["User"] = reader["email"];
                        Response.Redirect("UserHome.aspx");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials!!')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}