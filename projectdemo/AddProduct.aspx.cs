using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;


namespace projectdemo
{
    public partial class AddProduct : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //SqlConnection cn = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True");
            //if (FileUpload1.HasFile)
            //{
            //    string filename = FileUpload1.PostedFile.FileName;
            //    string filepath = "image/" + filename;

            //    // Save the uploaded file to the server
            //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/AdminPages/image/") + filename);

            //    cn.Open();
            //    // Use a parameterized query to insert data
            //    string query = "INSERT INTO PDetail_tbl (catagory,ProductId,ProductName,ProductDesc, Price,Quantiy,Image) VALUES (@catagory, @ProductId, @ProductName, @ProductDesc, @Price,@Quantiy, @ImagePath)";
            //    SqlCommand cmd = new SqlCommand(query, cn);
            //    cmd.Parameters.AddWithValue("@atagory", DropDownList1.SelectedItem.Text);

            //    cmd.Parameters.AddWithValue("@ProductId", Txtid.Text);

            //    cmd.Parameters.AddWithValue("@ProductName", Txtpname.Text);
            //    cmd.Parameters.AddWithValue("@ProductDesc", TxtDesc.Text);
            //    cmd.Parameters.AddWithValue("@Price", Txtprice.Text);
            //    cmd.Parameters.AddWithValue("@Quantiy", Txtqnt.Text);
            //    cmd.Parameters.AddWithValue("@ImagePath", filepath);

            //    cmd.ExecuteNonQuery();

            //    cn.Close();

            //    Response.Write("<script>alert('Product Added Successfully...')</script>");

            if (FileUpload1.HasFiles)
                {
                    try
                    {
                    // string fname = Path.GetFileName(fileupload.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Images/") + Path.GetFileName(FileUpload1.FileName));
                        string link = "Images/" + Path.GetFileName(FileUpload1.FileName);

                        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectDBConnectionString"].ConnectionString))
                        {
                            cn.Open();
                            SqlCommand cmd = new SqlCommand("insert into PDetail_tbl values('" + DropDownList1.SelectedItem.Text + "', '" + Txtid.Text + "','" + Txtpname.Text + "','" + TxtDesc.Text + "','" + Txtprice.Text + "','" + Txtqnt.Text + "','" + link + "')", cn);
                            int t = cmd.ExecuteNonQuery();
                        
                        if (t > 0)
                            {
                            ShowGrid();
                            Label1.Text = "File has been uploaded successfully....";
                            //Response.Write("<script>alert('File has been uploaded successfully....')</script>");
                            }
                        cn.Close();
                       
                    }
                    }
                    catch (Exception ex)
                    {
                        //    lblmsg.Text = "The file could not upload" + ex.Message;
                    }
            }



                //Response.Redirect("LoginPage.aspx");
              
            }
        public void ShowGrid()
        {
            string str = "Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True";
            SqlConnection cn = new SqlConnection(str);
            SqlDataAdapter sda1 = new SqlDataAdapter("SELECT * FROM PDetail_tbl ", cn);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
    }
        //public void clearControls()
        //{
        //    Txtqnt.Text = "";
        //    Txtprice.Text = "";
        //    Txtpname.Text = "";
        //    Txtid.Text = "";
        //    TxtDesc.Text = "";
        //    DropDownList1.Focus();
        //}
    }
