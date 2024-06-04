using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Xml.Linq;

namespace Ecom2.AdminPanel.Functionality
{
    public partial class AddProducts : System.Web.UI.Page
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
            string Pname, Pimg;
            double Pprice;

            Pname = TextBox1.Text;
            Pprice = double.Parse(TextBox2.Text);

            // Get the directory path
            string imagesPath = Server.MapPath("~/Images/");

            // Check if the directory exists, if not, create it
            if (!Directory.Exists(imagesPath))
            {
                Directory.CreateDirectory(imagesPath);
            }

            // Save the uploaded file to the directory
            string fileName = Path.GetFileName(FileUpload1.FileName);
            string filePath = Path.Combine(imagesPath, fileName);
            FileUpload1.SaveAs(filePath);

            // Prepare the path for saving in the database
            Pimg = "Images/" + fileName;

            // SQL query to insert the product details
            string q = "EXEC InsertProduct @Pname, @Pprice, @Pimg";

            using (SqlCommand cmd = new SqlCommand(q, conn))
            {
                cmd.Parameters.AddWithValue("@Pname", Pname);
                cmd.Parameters.AddWithValue("@Pprice", Pprice);
                cmd.Parameters.AddWithValue("@Pimg", Pimg);
                cmd.ExecuteNonQuery();
              
            }

            Response.Write("<script>alert('Product Added Successfully')</script>");
        }

    }
}