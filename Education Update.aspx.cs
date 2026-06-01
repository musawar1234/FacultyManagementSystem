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

    public partial class Education_Update : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

    protected void btnSearch_Click(object sender, EventArgs e)
        {
        int facultyId;
        if (int.TryParse(txtFacultyID.Text.Trim(), out facultyId))
        {
            BindGrid(facultyId);
        }
        else
        {
            gvEducation.DataSource = null;
            gvEducation.DataBind();
        }
    }
    private void BindGrid(int facultyId)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT EDUCATION_ID, EDUCATION_TITLE, UNIVERSITY_NAME, IS_ACTIVE, SUBJECT_MAJORS FROM FACULTY_EDUCATION WHERE FACULTY_ID = @FacultyID";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@FacultyID", facultyId);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                }
            }
        }
        gvEducation.DataSource = dt;
        gvEducation.DataBind();
    }

    protected void gvEducation_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvEducation.EditIndex = e.NewEditIndex;
        int facultyId = int.Parse(txtFacultyID.Text.Trim());
        BindGrid(facultyId);
    }

    protected void gvEducation_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvEducation.Rows[e.RowIndex];
        int educationId = Convert.ToInt32(gvEducation.DataKeys[e.RowIndex].Value);

        string educationTitle = (row.FindControl("txtEducationTitle") as TextBox).Text;
        string universityName = (row.FindControl("txtUniversityName") as TextBox).Text;
        bool isActive = (row.FindControl("chkIsActive") as CheckBox).Checked;
        string subjectMajors = (row.FindControl("txtSubjects") as TextBox).Text;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"UPDATE FACULTY_EDUCATION SET 
                             EDUCATION_TITLE = @EducationTitle, 
                             UNIVERSITY_NAME = @UniversityName,
                             IS_ACTIVE = @IsActive,
                             SUBJECT_MAJORS = @SubjectMajors,
                             MODIFY_DATE = GETDATE()
                             WHERE EDUCATION_ID = @EducationID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@EducationTitle", educationTitle);
                cmd.Parameters.AddWithValue("@UniversityName", universityName);
                cmd.Parameters.AddWithValue("@IsActive", isActive);
                cmd.Parameters.AddWithValue("@SubjectMajors", subjectMajors);
                cmd.Parameters.AddWithValue("@EducationID", educationId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        gvEducation.EditIndex = -1;
        int facultyId = int.Parse(txtFacultyID.Text.Trim());
        BindGrid(facultyId);
    }

    protected void gvEducation_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvEducation.EditIndex = -1;
        int facultyId = int.Parse(txtFacultyID.Text.Trim());
        BindGrid(facultyId);
    }
    }
  }