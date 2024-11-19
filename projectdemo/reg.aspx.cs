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
    public partial class reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True");
            cn.Open();
            SqlCommand cmd = new SqlCommand("insert into Register_tbl1 values('" + Request.Form["txtfName"] + "','" + Request.Form["txtlname"] + "','" + Request.Form["txtpass"] + "','" + Request.Form["txtmail"] + "','" + Request.Form["txtmobile"] + "','" + Request.Form["txtaddress"] + "')", cn); 
            cmd.ExecuteNonQuery();
            Label1.Text = "Register Successfully..";
            Response.Write("<script>alert('Record Saved......')</script>");
            cn.Close();

        }
    }
}