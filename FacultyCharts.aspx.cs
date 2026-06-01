using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class FacultyCharts : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;
        private string currentSortExpression = "DEPT_ID";
        private string currentSearchTerm = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid(string sortExpression = "", string searchTerm = "")
        {
            // Use provided values or fall back to stored values
            if (!string.IsNullOrEmpty(sortExpression))
                currentSortExpression = sortExpression;
            if (!string.IsNullOrEmpty(searchTerm))
                currentSearchTerm = searchTerm;

            string query = @"
                SELECT d.DEPT_NAME, ISNULL(COUNT(f.FACULTY_ID), 0) AS FacultyCount
                FROM DEPARTMENTS d
                LEFT JOIN FACULTY f ON d.DEPT_ID = f.DEPARTMENT_ID AND f.IS_ACTIVE = 1
                WHERE d.IS_ACTIVE = 1";

            // Add search filter
            if (!string.IsNullOrEmpty(currentSearchTerm))
            {
                query += " AND d.DEPT_NAME LIKE @SearchTerm";
            }

            query += " GROUP BY d.DEPT_ID, d.DEPT_NAME";
            query += " ORDER BY " + currentSortExpression;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(currentSearchTerm))
                    {
                        cmd.Parameters.AddWithValue("@SearchTerm", "%" + currentSearchTerm + "%");
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvDeptStats.DataSource = dt;
                        gvDeptStats.DataBind();

                        // Update status labels - FIXED STRING CONCATENATION
                        UpdateStatusLabels(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error: " + ex.Message;
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            currentSearchTerm = txtSearch.Text.Trim();
            BindGrid();
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            currentSearchTerm = "";
            BindGrid();
        }

        protected void gvDeptStats_Sorting(object sender, GridViewSortEventArgs e)
        {
            BindGrid(e.SortExpression);
        }

        protected void gvDeptStats_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            gvDeptStats.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        private void UpdateStatusLabels(DataTable dt)
        {
            int totalCount = dt.Rows.Count;

            // FIXED: Using string concatenation instead of string interpolation
            if (totalCount != 1)
                lblStatus.Text = "Loaded " + totalCount + " departments.";
            else
                lblStatus.Text = "Loaded " + totalCount + " department.";

            if (!string.IsNullOrEmpty(currentSearchTerm))
            {
                lblSearchCount.Text = "Search: '" + currentSearchTerm + "' (" + totalCount + " results)";
            }
            else
            {
                lblSearchCount.Text = "";
            }
        }
    }
}
