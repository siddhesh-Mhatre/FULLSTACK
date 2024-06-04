using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecom2
{
    public partial class Users : System.Web.UI.MasterPage
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["DBconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();
            if (!IsPostBack)
            {
                Cunt_CartItems();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void Cunt_CartItems()
        {
            string su = Session["User"].ToString();
            string q = "SELECT COUNT(*) FROM cart WHERE suser='"+su+"' ";
            SqlCommand command = new SqlCommand(q, conn);
            int count_it = (int)command.ExecuteScalar();
            Label1.Text = count_it.ToString();
        }
    }
}