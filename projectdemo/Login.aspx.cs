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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string a = "Admin@gmail";
            string b = "1234";
            if (TextBox1.Text == a && TextBox2.Text == b)
            {
                Session["Admin"] = a;
                Response.Redirect("AdminHome.aspx");
             
            }
            else
            {
                SqlConnection cn = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Register_tbl1 where EmailId='" + TextBox1.Text + "'and PassWord='" + TextBox2.Text + "'", cn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count==1)
            {
                Label1.Text = "Login Successfull..!";
                Label1.ForeColor = System.Drawing.Color.Green;
                    Session["username"] = TextBox1.Text;
                    Response.Redirect("Products.aspx");
                
            }
            else
            {
                Label1.Text = "Login Unsuccessfull..!";
                Label1.ForeColor = System.Drawing.Color.Red;
                Session["username"] ="";
            }
            }
        }
    }
}