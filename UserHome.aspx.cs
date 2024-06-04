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
    public partial class UserHome : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["DBconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                FetchAllProducts();
            }
        }

        protected void FetchAllProducts()
        {
            string q = "select * from Products";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DataList1.DataSource = dr;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string pname,pic, dt, suser = Session["User"].ToString();
                double price, total_price;
                int qty;
                string id = e.CommandArgument.ToString();
                string q = "exec FindProductDetailsById '" + id + "' ";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rd = cmd.ExecuteReader();


                if (rd.HasRows)
                {
                    rd.Read();
                    pname = rd["ProductName"].ToString();
                    price = double.Parse(rd["ProductPrice"].ToString());
                    pic = rd["ProductImg"].ToString();

                    DropDownList dl = (DropDownList)e.Item.FindControl("DropDownList1");
                    qty = int.Parse(dl.SelectedValue.ToString());
                    total_price = price * qty;
                    dt = DateTime.Now.ToString("d-M-yyyy");
                    Response.Write($"{pname} {price} {qty} {suser}");
                    string q1 = "exec AddToCartProc '" + pname + "', '" + total_price + "', '" + qty + "',  '" + pic + "' ,'" + dt + "', '" + suser + "', '" + price + "'   ";
                    SqlCommand c = new SqlCommand(q1, conn);
                    c.ExecuteNonQuery();
                    Response.Redirect("Cart.aspx");
                }
            }

        }
    }
}