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
    public partial class ShowOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowGrid();
            ShowGrid1();
        }
        public void ShowGrid()
        {
            string str = "Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True";
            SqlConnection cn = new SqlConnection(str);
            SqlDataAdapter sda1 = new SqlDataAdapter("SELECT * FROM ODetail_tbl ", cn);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
        public void ShowGrid1()
        {
            string str = "Data Source=SUMESH;Initial Catalog=ProjectDB;Integrated Security=True";
            SqlConnection cn1 = new SqlConnection(str);
            SqlDataAdapter sda1 = new SqlDataAdapter("SELECT * FROM CardDetail_tbl ", cn1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            GridView2.DataSource = dt1;
            GridView2.DataBind();
        }
        }
}