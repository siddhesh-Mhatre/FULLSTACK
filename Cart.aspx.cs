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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection conn;
        string Address, Contact;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["DBconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            if (!IsPostBack)
            {

                fetchcart();
               GradTotal();
            }
                Address = TextBox1.Text;
                Contact = TextBox2.Text;

            Session["Address"] = Address;
            Session["Contact"] = Contact;
        }


        protected void GradTotal()
        {
            string total_price;
            if (Session["User"] != null)
            {
                string suser = Session["User"].ToString();
                string q = " select sum(price) as total from cart where suser='" + suser + "' ";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                total_price = rdr["total"].ToString();
                Label8.Text = total_price;
                Session["GrandTotal"]= total_price;

            }
            else
            {
                Response.Redirect("Default.aspx");
            }


        }

        protected void fetchcart()
        {
            if (Session["User"] != null)
            {

                string suser = Session["User"].ToString();
                string q = "exec FindCartDetailBySession  '" + suser + "'  ";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                GridView1.DataSource = rdr;
                GridView1.DataBind();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHome.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Response.Redirect("PlaceOrder.aspx");

            
            if (Session["User"]!=null)
            {

                string Address, Contact;
                Address = TextBox1.Text;
                Contact = TextBox2.Text;
                string us = Session["User"].ToString();
                string q = "INSERT INTO PlaceOrder (pname,price,qty,pic,dt,suser,perprice,Address,Contact,Status) SELECT pname,price,qty,pic,dt,suser,perprice,'" + Address+"','"+Contact+ "','In Process' FROM cart WHERE suser = '" + us + "' ";
                SqlCommand c = new SqlCommand(q, conn);
                int row=c.ExecuteNonQuery();

                if (row > 0)
                {
                    string q1 = "DELETE FROM cart WHERE suser = '"+us+"'";
                    SqlCommand cmd2= new SqlCommand(q1, conn);
                    cmd2.ExecuteNonQuery();
                    Response.Redirect("PlaceOrder.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Something Went Wrong')</script>");
                }
            }
            else
            {
                Response.Redirect("Dfault.aspx");
            }


            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label l1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label7");
            string id = l1.Text;

            string q = "exec DeleteCartProductProc '" + id + "' ";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            fetchcart();
            Response.Redirect("Cart.aspx");

        }
    }
}