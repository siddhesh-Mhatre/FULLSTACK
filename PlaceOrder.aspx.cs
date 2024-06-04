using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using iText.Layout.Borders;
using Razorpay;
using Razorpay.Api;
namespace Ecom2
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["DBconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();
            Button1.Enabled = false;
            Button2.Enabled = false;
            if (!IsPostBack)
            {
                FetchDetails();
            }


        }

        protected void FetchDetails()
        {
            string su = Session["User"].ToString();
            //string q = "SELECT * FROM cart WHERE suser='"+su+"'";
            //SqlCommand cmd = new SqlCommand(q, conn);
            //SqlDataReader r = cmd.ExecuteReader();
            //r.Read();
            Label1.Text = "Inv" + GenerateOrderID();
            Label2.Text = su;
            Label4.Text = Session["Address"].ToString();
            Label3.Text = Session["Contact"].ToString();
            Label5.Text = Session["GrandTotal"].ToString();

        }


        protected string GenerateOrderID()
        {
            Random random = new Random();
            return random.Next(100, 999).ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(sw);
            Panel1.RenderControl(writer);
            StringReader stringReader = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker worker = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            worker.Parse(stringReader);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SendInvoiceToEmail(Session["User"].ToString());
        }

        public void SendInvoiceToEmail(string toEmail)
        {
            try
            {
                // Generate the PDF invoice
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter writer = new HtmlTextWriter(sw);
                    Panel1.RenderControl(writer);
                    StringReader stringReader = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A3, 10f, 10f, 100f, 0f);
                    HTMLWorker worker = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, memoryStream);
                    pdfDoc.Open();
                    worker.Parse(stringReader);
                    pdfDoc.Close();

                    byte[] bytes = memoryStream.ToArray();
                    memoryStream.Close();

                    // Send the PDF via email
                    string fromMail = "thakurtcsceduanjali@gmail.com";
                    string fromPassword = "dwhjomndmsrefzfx";

                    MailMessage message = new MailMessage();
                    message.From = new MailAddress(fromMail);
                    message.Subject = "Your Order Invoice";
                    message.To.Add(new MailAddress(toEmail));
                    message.Body = "<html><body>Please find attached your order invoice.</body></html>";
                    message.IsBodyHtml = true;
                    message.Attachments.Add(new Attachment(new MemoryStream(bytes), "OrderInvoice.pdf"));

                    var smtpClient = new SmtpClient("smtp.gmail.com")
                    {
                        Port = 587,
                        Credentials = new NetworkCredential(fromMail, fromPassword),
                        EnableSsl = true,
                    };

                    smtpClient.Send(message);
                }
            }
            catch (Exception ex)
            {
                // Log the exception if needed
                // Display an alert to the user
                string script = $"alert('Error sending email: {ex.Message}');";
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", script, true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button1.Enabled = true;
            Button2.Enabled = true;
            string keyId = "rzp_test_hlMJ5id9i80Pzn";
            string secret = "Tnvvt2xwZW6I20nPpsR0fGCm";
            RazorpayClient client = new RazorpayClient(keyId, secret);

            double amount = double.Parse(Session["GrandTotal"].ToString());

            // Create an order
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amount * 100); // Amount should be in paisa (multiply by 100)
            options.Add("currency", "INR");
            options.Add("receipt", "order_receipt_123");
            options.Add("payment_capture", 1); // Auto capture payment

            Razorpay.Api.Order order = client.Order.Create(options);
            string orderId = order["id"].ToString();
            // Genrate chekout form and redirect user to Razorpay  payment page
            string razorpayScript = $@"
               var options = {{
    'key': '{keyId}',  
    'amount': {amount * 100}, // Amount is in currency subunits. Default is INR. Hence, 100 refers to 100 paise
    'currency': 'INR',
    'name': 'Shivam vasuli bhai pvt ltd',
    'description': 'Checkout Payment',
    'order_id': '{orderId}',  
    'handler': function (response){{
       
        alert('Payment successful. Payment ID: ' + response.razorpay_payment_id);
    }},
    'prefill': {{
        'name': 'Shivam vasuli bhai ke aage koi bol sakta h ky ayeeeeeee !!!',
        'email': 'Shivam_BHai@gmail.com',
        'contact': '7045019635'
    }},
    'theme': {{
        'color': '#F37254'
    }}
     }}; 
   var rzp1 = new Razorpay(options);
            rzp1.open();
            e.preventDefault();";
            //Register the script on the page
            //
            ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);
        }

 


    }
}