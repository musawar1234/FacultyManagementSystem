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
    public partial class FacultylatestPublication : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDepartments();
            }
        }

        private void BindDepartments()
        {
            try
            {
                string query = @"
                    SELECT DEPT_ID, DEPT_NAME 
                    FROM DEPARTMENTS 
                    WHERE ISNULL(IS_ACTIVE, 1) = 1 
                    ORDER BY ISNULL(DEPARTMENT_PRIORITY, 999), DEPT_NAME";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlDepartments.DataSource = dt;
                    ddlDepartments.DataTextField = "DEPT_NAME";
                    ddlDepartments.DataValueField = "DEPT_ID";
                    ddlDepartments.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<div class='alert alert-danger'>Error loading departments: " + ex.Message + "</div>");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlDepartments.SelectedValue))
            {
                LoadFacultyPublications(ddlDepartments.SelectedValue);
            }
        }

        private void LoadFacultyPublications(string deptId)
        {
            try
            {
                string query = @"
            SELECT 
                f.FIRST_NAME + ' ' + ISNULL(f.MIDDLE_NAME + ' ', '') + COALESCE(f.LAST_NAME, '') AS FacultyName,
                ISNULL(f.TITLE, '') AS Title,
                ISNULL(f.FACULTY_EMAIL, '') AS Email,
                ISNULL(f.MOBILE_NO, '') AS Mobile,
                ISNULL(f.RESEARCH_INTEREST, '') AS ResearchInterest,  -- ✅ ADDED THIS
                fp.PUBLICATION AS LatestPublication,
                fp.PUBLICATION_YEAR
            FROM FACULTY f
            LEFT JOIN (
                SELECT FACULTY_ID, PUBLICATION, PUBLICATION_YEAR,
                       ROW_NUMBER() OVER (PARTITION BY FACULTY_ID 
                                        ORDER BY PUBLICATION_YEAR DESC, PUBLICATION_ID DESC) as rn
                FROM FACULTY_PUBLICATIONS 
                WHERE ISNULL(IS_ACTIVE, 1) = 1
            ) fp ON f.FACULTY_ID = fp.FACULTY_ID AND fp.rn = 1
            WHERE f.DEPARTMENT_ID = @DeptId 
            AND ISNULL(f.IS_ACTIVE, 1) = 1
            ORDER BY ISNULL(f.FACULTY_ORDER, 999), f.FIRST_NAME";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    da.SelectCommand.Parameters.AddWithValue("@DeptId", deptId);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvFacultyPublications.DataSource = dt;
                    gvFacultyPublications.DataBind();
                }
            }
            catch (Exception ex)
            {
                gvFacultyPublications.EmptyDataText = "Error loading data: " + ex.Message;
                gvFacultyPublications.DataBind();
            }
        }


        protected string GetResearchInterestPreview(string interest)
        {
            if (string.IsNullOrEmpty(interest))
                return "No research interests listed";

            if (interest.Length > 120)
                return interest.Substring(0, 120) + " ...";

            return interest;
        }

        protected string GetLatestPublicationDisplay(object publication, object year)  // 👈 2 parameters
        {
            if (publication == null || string.IsNullOrEmpty(publication.ToString()))
                return "No publications found";

            string result = publication.ToString();

            int y;
            if (year != null && int.TryParse(year.ToString(), out y) && y > 1900)
            {
                result += " (" + y + ")";
            }

            return result;
        }



        protected void gvFacultyPublications_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFacultyPublications.PageIndex = e.NewPageIndex;
            if (!string.IsNullOrEmpty(ddlDepartments.SelectedValue))
            {
                LoadFacultyPublications(ddlDepartments.SelectedValue);
            }
        }
    }
}