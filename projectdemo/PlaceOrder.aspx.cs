using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace projectdemo
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into CardDetail_tbl values(@Fname,@Lname,@cardno,@Expiryno,@cvv,@Billingadd)", con);
            cmd.Parameters.AddWithValue("@Fname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Lname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@cardno", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Expiryno", TextBox4.Text);
            cmd.Parameters.AddWithValue("@cvv", TextBox5.Text);
            cmd.Parameters.AddWithValue("@Billingadd", TextBox6.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Payment made Succesfull');</script>");
            Session["address"] = TextBox6.Text;
            Response.Redirect("Pdf.aspx");

        }
    }
}