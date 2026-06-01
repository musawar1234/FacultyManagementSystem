using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class Faculty_Education : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

            string query = @"INSERT INTO [FACULTY_EDUCATION] 
                        ([EDUCATION_TITLE], [UNIVERSITY_NAME], [IS_ACTIVE], [CREATED_DATE], [MODIFY_DATE], [CREATED_BY], [FACULTY_ID], [SUBJECT_MAJORS]) 
                         VALUES 
                        (@EducationTitle, @UniversityName, @IsActive, @CreatedDate, @ModifyDate, @CreatedBy, @FacultyID, @SubjectMajors)";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EducationTitle", txtEducationTitle.Text);
                    cmd.Parameters.AddWithValue("@UniversityName", txtUniversityName.Text);
                    cmd.Parameters.AddWithValue("@IsActive", txtIsActive.Text);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Parse(txtCreatedDate.Text));
                    cmd.Parameters.AddWithValue("@ModifyDate", DateTime.Parse(txtModifyDate.Text));
                    cmd.Parameters.AddWithValue("@CreatedBy", txtCreatedBy.Text);
                    cmd.Parameters.AddWithValue("@FacultyID", txtFacultyID.Text);
                    cmd.Parameters.AddWithValue("@SubjectMajors", txtSubjectMajors.Text);

                    try
                    {
                        conn.Open();
                        int result = cmd.ExecuteNonQuery();
                        if (result > 0)
                        {
                            lblMessage.Text = "Faculty education data inserted successfully!";
                            ClearForm();
                        }
                        else
                        {
                            lblMessage.Text = "Insert failed.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }

        public void ClearForm()
        {
            txtEducationTitle.Text = "";
            txtUniversityName.Text = "";
            txtIsActive.Text = "1";
            txtCreatedDate.Text = "";
            txtModifyDate.Text = "";
            txtCreatedBy.Text = "";
            txtFacultyID.Text = "";
            txtSubjectMajors.Text = "";
        }
    }
}