using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace projectdemo
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        string str = "Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True";

        public int Productid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                ShowProduct();
            }
            //ShowProduct();

        }
        public void ShowProduct()
        {
            SqlConnection conn = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from PDetail_tbl", conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowProduct();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
           // DropDownList1.SelectedValue = "Select Category";
            ShowProduct();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            int index = e.NewEditIndex;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];
            Label ProductId = (Label)row.FindControl("Label1");
            Productid = int.Parse(ProductId.Text.ToString());
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from PDetail_tbl where ProductId='" + Productid + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();


        }

       

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = Productid;
            GridViewRow row = (GridViewRow)GridView1.Rows[index];

            FileUpload fu = (FileUpload)row.FindControl("FileUpload1");
            if(fu.HasFile)
            {
                Label ProductId = (Label)row.FindControl("Label1");
                TextBox ProductName = (TextBox)row.FindControl("TextBox1");
                TextBox ProductDesc = (TextBox)row.FindControl("TextBox2");
                TextBox Price = (TextBox)row.FindControl("TextBox3");
                TextBox Quantiy = (TextBox)row.FindControl("TextBox4");
                string catagory = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[6].FindControl("DropDownList2")).Text;

                fu.SaveAs(Server.MapPath("~/Images/") + Path.GetFileName(fu.FileName));
                String Image = "Images/" + Path.GetFileName(fu.FileName);

                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("update PDetail_tbl set Category=@6, ProductName=@1, ProductDetails=@2, Price=@3, Quantity=@4, Image=@5 where ProductId=@7", con);
                cmd.Parameters.AddWithValue("@1", ProductName.Text);
                cmd.Parameters.AddWithValue("@2", ProductDesc.Text);
                cmd.Parameters.AddWithValue("@3", Price.Text);
                cmd.Parameters.AddWithValue("@4", Quantiy.Text);
                cmd.Parameters.AddWithValue("@5", Image);
                cmd.Parameters.AddWithValue("@6", catagory);

                cmd.Parameters.AddWithValue("@7", ProductId.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                Response.Write("<script>alert('Product Update Successsfullly');</script>");
                ShowProduct();
           //     DropDownList1.SelectedValue = "Select Category";





            }
            else
            {
                Response.Write("<script>alert('Please Select Product Image');</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from PDetail_tbl where catagory='" + DropDownList1.SelectedValue.ToString() + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();


            string Cname = "";
             if (Cname ==DropDownList1.SelectedValue.ToString())
            {
                SqlConnection con1 = new SqlConnection(str);
                SqlDataAdapter sda1 = new SqlDataAdapter("select * from PDetail_tbl where catagory='" + Cname + "'", con);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                //SqlConnection con1 = new SqlConnection(str);
                //SqlDataAdapter sda1 = new SqlDataAdapter("select * from PDetail_tbl where catagory='" + Cname + "'", con);
                //DataTable dt1 = new DataTable();
                //sda1.Fill(dt1);
                //GridView1.DataSource = dt;
                //GridView1.DataBind();
                ShowProduct();
            }
        }
    }
}