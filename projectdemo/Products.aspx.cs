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
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addproduct"] = "false";
            if (Session["username"] != null)
            {
                Label4.Text = "logged in as" + Session["username"].ToString();
                HyperLink1.Visible = false;
                Button1.Visible = true;
            }
            else
            {
                Label4.Text = "Hello you can Login Here....";
                HyperLink1.Visible = true;
                Button1.Visible = false;
            }

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Products.aspx");
            Label4.Text = "You Have Logged out Successfully...";
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True");
            SqlDataAdapter sda = new SqlDataAdapter("select * from PDetail_tbl where (ProductName like '%" + TextBox1.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList2.DataSourceID = null;
            DataList2.DataSource = dt;
            DataList2.DataBind();
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";

            if (e.CommandName == "AddToCart") 
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                string s = list.SelectedItem.ToString();


                Response.Redirect("AddToCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());

            }
        }
    }
}