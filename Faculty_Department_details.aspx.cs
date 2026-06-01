using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class Faculty_Department_details : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFacultyStats();
            }
        }
        private void LoadFacultyStats()
        {
            string query = @"
                SELECT 
                    d.FACULTY_NAME,
                    dep.DEPT_NAME,
                    COUNT(f.FACULTY_ID) AS ActiveFacultyCount
                FROM FACULTY f
                INNER JOIN DEPARTMENTS dep ON f.DEPARTMENT_ID = dep.DEPT_ID
                LEFT JOIN DEPARTMENTS d ON dep.FACULTY_NAME = d.DEPT_NAME
                WHERE f.IS_ACTIVE = 1
                GROUP BY d.FACULTY_NAME, dep.DEPT_NAME
                ORDER BY d.FACULTY_NAME, ActiveFacultyCount DESC";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvFacultyStats.DataSource = dt;
                    gvFacultyStats.DataBind();
                    lblStatus.Text = string.Format("Loaded {0} department stats successfully.", dt.Rows.Count);
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error: " + ex.Message;
            }
        }
    }
}