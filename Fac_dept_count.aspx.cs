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
    public partial class Fac_dept_count : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid(string sortExpression = "DEPT_ID")
        {
            string query = @"
                SELECT d.DEPT_NAME, ISNULL(COUNT(f.FACULTY_ID), 0) AS FacultyCount
                FROM DEPARTMENTS d
                LEFT JOIN FACULTY f ON d.DEPT_ID = f.DEPARTMENT_ID AND f.IS_ACTIVE = 1
                WHERE d.IS_ACTIVE = 1
                GROUP BY d.DEPT_ID, d.DEPT_NAME
                ORDER BY " + sortExpression;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvDeptStats.DataSource = dt;
                    gvDeptStats.DataBind();
                    lblStatus.Text = "Loaded " + dt.Rows.Count + " departments.";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error: " + ex.Message;
            }
        }

        protected void gvDeptStats_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDeptStats.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvDeptStats_Sorting(object sender, GridViewSortEventArgs e)
        {
            BindGrid(e.SortExpression);
        }
    }
}