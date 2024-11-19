using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace projectdemo
{
    public partial class AddCategory : System.Web.UI.Page
    {
        string str = "Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from catagory where CatagoryName='" + TextBox1.Text.ToString() + "' ", con1);
            sda.SelectCommand.Parameters.AddWithValue("@CategoryName", TextBox1.Text.Trim());
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1) 
            {
                Response.Write("<script>alert('This catagory is already present');</script>");
            }
            else
            {
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("insert into catagory (CatagoryName)values(@CatagoryName)", con);
                cmd1.Parameters.AddWithValue("@CatagoryName", TextBox1.Text.Trim());
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('One Record added');</script>");
                TextBox1.Text = "";
                ShowGrid();
            }
           
        }
        public void ShowGrid()
        {
            SqlConnection cn = new SqlConnection(str);
            SqlDataAdapter sda1 = new SqlDataAdapter("SELECT * FROM catagory ", cn);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            //GridView1.DataSource = dt1;
            //GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowGrid();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //SqlConnection con = new SqlConnection(str);
            //int CId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            //con.Open();
            //SqlCommand cmd3 = new SqlCommand("DELETE FROM catagory WHERE CategoryId=@CategoryId", con);
            //cmd3.Parameters.AddWithValue("@CategoryId", CId);
            //cmd3.ExecuteNonQuery();
            //con.Close();
            //Response.Write("<script>alert('Category deleted successfully...')</script>");
            //ShowGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowGrid();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //SqlConnection con = new SqlConnection(str);
            //GridViewRow row = GridView1.Rows[e.RowIndex];
            //int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            //String categoryName = (row.FindControl("TextBox2") as TextBox).Text;
            //con.Open();
            //SqlCommand cmd2 = new SqlCommand("update catagory SET CategoryName=@CategoryName WHERE CategoryId=@CategoryId", con);
            //cmd2.Parameters.AddWithValue("@CategoryName", categoryName);
            //cmd2.Parameters.AddWithValue("@CategoryId", cId);
            //cmd2.ExecuteNonQuery();
            //con.Close();
            //Response.Write("<script>alert('Category updated successfully...')</script>");
            //GridView1.EditIndex = -1;

        }
    }
}