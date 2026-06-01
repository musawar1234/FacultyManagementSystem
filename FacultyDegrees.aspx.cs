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
    public partial class FacultyDegrees : System.Web.UI.Page
    {
        private string connectionString = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z;";

protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllFaculty();
        }
    }

    // **NEW: Faculty ID Click Handler**
protected void lnkFacultyID_Click(object sender, EventArgs e)
{
    LinkButton lnk = sender as LinkButton;
    string facultyId = lnk.CommandArgument.ToString();
    
    // Store Faculty ID in Session
    Session["SelectedFacultyID"] = facultyId;
    
    // Redirect to SAME PAGE with Faculty ID filter
    txtFacultyId.Text = facultyId;
    BindGridView(txtDeptName.Text.Trim(), int.Parse(facultyId));
    
    // Or show success message
    ClientScript.RegisterStartupScript(this.GetType(), "success",
    string.Format("alert('Showing Faculty ID: {0}');", facultyId), true);
}

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGridView();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtDeptName.Text = "";
        txtFacultyId.Text = "";
        LoadAllFaculty();
    }

    protected void GridViewFaculty_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewFaculty.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    private void LoadAllFaculty()
    {
        BindGridView(null, null);
    }

    private void BindGridView()
    {
        string deptName = txtDeptName.Text.Trim();
        int? facultyId = string.IsNullOrEmpty(txtFacultyId.Text) ? (int?)null : int.Parse(txtFacultyId.Text);
        BindGridView(deptName, facultyId);
    }

    private void BindGridView(string deptName, int? facultyId)
    {
        string query = @"
            WITH LatestEducation AS (
                SELECT 
                    f.FACULTY_ID, f.FIRST_NAME, f.MIDDLE_NAME, f.LAST_NAME,
                    f.TITLE, d.DEPT_NAME,
                    e.EDUCATION_TITLE, e.UNIVERSITY_NAME, e.SUBJECT_MAJORS,
                    ROW_NUMBER() OVER (
                        PARTITION BY f.FACULTY_ID 
                              ORDER BY 
                               CASE e.EDUCATION_TITLE
                                      WHEN 'Post-Doctorate' THEN 5
                                      WHEN 'MS leading to PhD' THEN 4 
                                      WHEN 'PhD' THEN 3
                                      WHEN 'MS' THEN 2 
                                      WHEN 'BS' THEN 1
                                      ELSE 0
                                      END DESC,
                                      e.MODIFY_DATE DESC
                                      ) as rn
                FROM FACULTY f
                INNER JOIN FACULTY_EDUCATION e ON f.FACULTY_ID = e.FACULTY_ID
                INNER JOIN DEPARTMENTS d ON f.DEPARTMENT_ID = d.DEPT_ID
                WHERE f.IS_ACTIVE = 1 AND e.IS_ACTIVE = 1 AND d.IS_ACTIVE = 1 AND e.IS_ACTIVE = 1
            )
            SELECT 
                FACULTY_ID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, TITLE, DEPT_NAME,
                EDUCATION_TITLE, UNIVERSITY_NAME, SUBJECT_MAJORS
            FROM LatestEducation
            WHERE rn = 1
              AND (@DeptName IS NULL OR DEPT_NAME LIKE '%' + @DeptName + '%')
              AND (@FacultyID IS NULL OR FACULTY_ID = @FacultyID)
            ORDER BY DEPT_NAME, LAST_NAME, FIRST_NAME";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@DeptName", (object)deptName ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@FacultyID", (object)facultyId ?? DBNull.Value);
                
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                
                GridViewFaculty.DataSource = dt;
                ViewState["CurrentData"] = dt; // Preserve data for postbacks
                GridViewFaculty.DataBind();
            }
        }
      }
    }
}