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
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["buyitems"]==null)
                {
                    Button1.Enabled = false;
                }
                else
                {
                    Button1.Enabled = true;
                }

                //Adding product to gridview
                Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("pid");
                dt.Columns.Add("pname");
                dt.Columns.Add("pimage");
                dt.Columns.Add("pprice");
                dt.Columns.Add("pquantity");
                dt.Columns.Add("ptotalprice");


                if(Request.QueryString["id"]!=null)
                {
                    if(Session["buyitems"]==null)
                    {
                        dr = dt.NewRow();
                        SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True");
                        SqlDataAdapter sda = new SqlDataAdapter("select * from PDetail_tbl where ProductId=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["ProductName"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Image"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price=Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                        int quantity = Convert.ToInt32(Request.QueryString["quantity"]);
                        int totalprice = price * quantity;
                        dr["ptotalprice"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True");
                        SqlDataAdapter sda = new SqlDataAdapter("select * from PDetail_tbl where ProductId=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        dr["sno"] = sr+1;
                        dr["pid"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["ProductName"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Image"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                        int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["ptotalprice"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if(GridView1.Rows.Count>0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                    }
                }
            }
            string Orderdate = DateTime.Now.ToShortDateString();
            Session["Orderdate"] = Orderdate;
            orderid();
        }

        private int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while (i < nrow)
            {
                totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["pprice"].ToString());
                i = i + 1;

            }
            Session["grandtotal"] = totalprice;
            return totalprice;
        }

        protected void orderid()
        {
            String alpha = "abcdEfghIjklmnopqRstuvWxyZ123456789";
            Random r = new Random();
            char[] myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];

            }
            string orderid;
            orderid = "Order-id:" + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
                + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            for(int i=0;i<=dt.Rows.Count-1;i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if(sr==sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //item has deleted from the cart
                    break;
                }
            }

            //5 setting sno . after deleting row item from cart
            for(int i=1;i<=dt.Rows.Count;i++)
            {
                dt.Rows[i - 1]["sno"] = 1;
                dt.AcceptChanges();
               
            }
            Session["buyitem"] = dt;
            Response.Redirect("AddToCart.aspx");

        }

        /*  protected void Button1_Click(object sender, EventArgs e)
          {
              //Response.Redirect("PlaceOrder.aspx");
              DataTable dt;
              dt = (DataTable)Session["buyitems"];
              for (int i = 0; i <= dt.Rows.Count - 1; i++)
              {
                  SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True");
                  con.Open();
                  SqlCommand cmd = new SqlCommand("insert into ODetail_tbl values('" + Session["Orderid"] + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["pid"] + "','" + dt.Rows[i]["pname"] + "','" + dt.Rows[i]["pquantity"] + "','" + Session["Orderdate"] + "','" + Session["grandtotal"] + "')", con);
                  cmd.ExecuteNonQuery();
                  con.Close();
              }
               if (GridView1.Rows.Count.ToString() == "0")
              {

                      Response.Write("<script>alert('Your cart is Empty.You cannot place Order');</script>");
                  }
                          else
                  {
                      Response.Redirect("PlaceOrder.aspx");
                  }

              //    {
              //        Response.Write("<script>alert('Your cart is Empty.You cannot place Order');</script>");
              //    }
              //    else
              //    {
              //        Response.Redirect("PlaceOrder.aspx");
              //    }

              // if (Session) is null redirecting to login else placing oreder
              if (Session["username"] == null)
              {
                  Response.Redirect("Login.aspx");
              }
              else
              {
                  if (GridView1.Rows.Count.ToString() == "0")
                  {
                      Response.Write("<script>alert('Your cart is Empty.You cannot place Order');</script>");
                  }
                  else
                  {
                      Response.Redirect("PlaceOrder.aspx");
                  }
              }
          }*/

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO ODetail_tbl (orderid, sno, productid, productname, price, quantity, orderdate) VALUES (@OrderId, @Sno, @ProductId, @ProductName, @GrandTotal, @Quantity, @OrderDate)", con);

                    cmd.Parameters.AddWithValue("@OrderId", Session["Orderid"]);
                    cmd.Parameters.AddWithValue("@Sno", dt.Rows[i]["sno"]);
                    cmd.Parameters.AddWithValue("@ProductId", dt.Rows[i]["pid"]);
                    cmd.Parameters.AddWithValue("@ProductName", dt.Rows[i]["pname"]);
                    cmd.Parameters.AddWithValue("@Quantity", dt.Rows[i]["pquantity"]);
                    cmd.Parameters.AddWithValue("@OrderDate", Convert.ToDateTime(Session["Orderdate"]));
                    cmd.Parameters.AddWithValue("@GrandTotal", Convert.ToDecimal(Session["grandtotal"]));

                    cmd.ExecuteNonQuery();
                }
            }

            if (GridView1.Rows.Count == 0)
            {
                Response.Write("<script>alert('Your cart is Empty. You cannot place an order.');</script>");
            }
            else
            {
                Response.Redirect("PlaceOrder.aspx");
            }
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}