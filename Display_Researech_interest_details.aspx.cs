using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class Display_Researech_interest_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        private void BindGridView()
        {
            string connectionString = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z";
            string query = "SELECT RESEARCH_ID, RESEARCH_TITLE, FACULTY_ID, CREATED_DATE, MODIFY_DATE, CREATED_BY, IS_ACTIVE FROM FACULTY_RESEARCH_INTEREST";
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                query += " WHERE FACULTY_ID = @FACULTY_ID";
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(txtSearch.Text))
                    {
                        cmd.Parameters.AddWithValue("@FACULTY_ID", Convert.ToInt32(txtSearch.Text));
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }
}