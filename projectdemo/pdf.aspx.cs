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
    public partial class pdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Orderid = Session["orderid"].ToString();
            Label1.Text = Orderid;
            findorderdate(Label2.Text);
            string Address = Session["address"].ToString();
            Label3.Text = Address;
            showgrid(Label1.Text);
        }
        private void findorderdate(String Orderid)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("SELECT orderdate FROM ODetail_tbl WHERE Orderid=@Orderid", con);
                cmd.Parameters.AddWithValue("@Orderid", Orderid);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Label2.Text = ds.Tables[0].Rows[0]["orderdate"].ToString();
                }
            }
        }


        /* private void findorderdate(String Orderid)
         {
             SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True");
             SqlCommand cmd = new SqlCommand("select * from ODetail_tbl where Orderid='" + Label1.Text + "'", con);
             cmd.Connection = con;
             SqlDataAdapter da = new SqlDataAdapter();
             da.SelectCommand = cmd;
             DataSet ds = new DataSet();
             da.Fill(ds);
             if (ds.Tables[0].Rows.Count > 0)
             {
                 Label2.Text = ds.Tables[0].Rows[0]["Orderdate"].ToString();
             }
             con.Close();

         }*/
        /* protected void showgrid(String Orderid)
         {
             DataTable dt = new DataTable();
             DataRow dr;
             dt.Columns.Add("sno");
             dt.Columns.Add("pid");
             dt.Columns.Add("pname");
             dt.Columns.Add("pquantity");
             dt.Columns.Add("price");
             dt.Columns.Add("totalprice");

             SqlConnection scon = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True");
             SqlCommand cmd = new SqlCommand("select * from ODetail_tbl where Orderid='" + Label1.Text + "'");
             cmd.Connection = scon;
             SqlDataAdapter da = new SqlDataAdapter();
             da.SelectCommand = cmd;
             DataSet ds = new DataSet();
             da.Fill(ds);
             int totalrows = ds.Tables[0].Rows.Count;
             int i = 0;
             int grandtotal = 0;
             while (i < totalrows)
             {
                 dr = dt.NewRow();
                 dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
                 dr["pid"] = ds.Tables[0].Rows[i]["pid"].ToString();
                 dr["pname"] = ds.Tables[0].Rows[i]["pname"].ToString();
                 dr["pquantity"] = ds.Tables[0].Rows[i]["pquantity"].ToString();
                 dr["price"] = ds.Tables[0].Rows[i]["price"].ToString();

                 int price = Convert.ToInt32(ds.Tables[0].Rows[i]["price"].ToString());
                 int quantity = Convert.ToInt32(ds.Tables[0].Rows[i]["pquantity"].ToString());
                 int totalprice = price * quantity;
                 dr["totalprice"] = totalprice;
                 grandtotal = grandtotal + totalprice;
                 dt.Rows.Add(dr);
                 i = i + 1;


             }
             GridView1.DataSource = dt;
             GridView1.DataBind();
             Label4.Text = grandtotal.ToString();
         }*/
        protected void showgrid(String Orderid)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("sno");
            dt.Columns.Add("productid");
            dt.Columns.Add("productname");
            dt.Columns.Add("quantity");
            dt.Columns.Add("price");
            dt.Columns.Add("totalprice");

            using (SqlConnection scon = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=projectdb;Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("SELECT sno, productid, productname, quantity, price FROM ODetail_tbl WHERE Orderid=@Orderid", scon);
                cmd.Parameters.AddWithValue("@Orderid", Orderid);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    int grandtotal = 0;
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        DataRow dr = dt.NewRow();
                        dr["sno"] = row["sno"].ToString();
                        dr["productid"] = row["productid"].ToString(); // Corrected to productid
                        dr["productname"] = row["productname"].ToString(); // Corrected to productname
                        dr["quantity"] = row["quantity"].ToString(); // Corrected to quantity
                        dr["price"] = row["price"].ToString();

                        int price = Convert.ToInt32(row["price"]);
                        int quantity = Convert.ToInt32(row["quantity"]); // Corrected to quantity
                        dr["totalprice"] = price * quantity;

                        grandtotal += price * quantity;
                        dt.Rows.Add(dr);
                    }

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Label4.Text = grandtotal.ToString();
                }
                else
                {
                    Label4.Text = "No records found.";
                }
            }
        }


    }
}