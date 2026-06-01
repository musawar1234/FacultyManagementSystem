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
    public partial class FacultyEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

            string query = @"INSERT INTO [dbo].[FACULTY]
                          ([FIRST_NAME], [MIDDLE_NAME], [LAST_NAME], [TITLE], [IMAGE_PATH], [FACULTY_EMAIL], [MOBILE_NO],
                           [LINE_LAND_NO], [DESIGNATION_ID], [DEPARTMENT_ID], [FACULTY_ORDER], [IS_ACTIVE], [CREATED_DATE], [MODIFY_DATE],
                           [CREATED_BY], [RESEARCH_INTEREST], [FACULTY_EDUCATION], [STATUS], [Biography], [CURRENT_COURSE])
                         VALUES
                          (@FirstName, @MiddleName, @LastName, @Title, @ImagePath, @Email, @MobileNo, @LandNo, @DesignationID,
                           @DepartmentID, @FacultyOrder, @IsActive, @CreatedDate, @ModifyDate, @CreatedBy, @ResearchInterest, @FacultyEducation,
                           @Status, @Biography, @CurrentCourse)";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@ImagePath", txtImagePath.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);
                    cmd.Parameters.AddWithValue("@LandNo", txtLandNo.Text);
                    cmd.Parameters.AddWithValue("@DesignationID", txtDesignationID.Text);
                    cmd.Parameters.AddWithValue("@DepartmentID", txtDepartmentID.Text);
                    cmd.Parameters.AddWithValue("@FacultyOrder", txtFacultyOrder.Text);
                    cmd.Parameters.AddWithValue("@IsActive", txtIsActive.Text);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Parse(txtCreatedDate.Text));
                    cmd.Parameters.AddWithValue("@ModifyDate", DateTime.Parse(txtModifyDate.Text));
                    cmd.Parameters.AddWithValue("@CreatedBy", txtCreatedBy.Text);
                    cmd.Parameters.AddWithValue("@ResearchInterest", string.IsNullOrEmpty(txtResearchInterest.Text) ? (object)DBNull.Value : txtResearchInterest.Text);
                    cmd.Parameters.AddWithValue("@FacultyEducation", string.IsNullOrEmpty(txtFacultyEducation.Text) ? (object)DBNull.Value : txtFacultyEducation.Text);
                    cmd.Parameters.AddWithValue("@Status", txtStatus.Text);
                    cmd.Parameters.AddWithValue("@Biography", string.IsNullOrEmpty(txtBiography.Text) ? (object)DBNull.Value : txtBiography.Text);
                    cmd.Parameters.AddWithValue("@CurrentCourse", string.IsNullOrEmpty(txtCurrentCourse.Text) ? (object)DBNull.Value : txtCurrentCourse.Text);

                    try
                    {
                        conn.Open();
                        int result = cmd.ExecuteNonQuery();
                        if (result > 0)
                        {
                            lblMessage.Text = "Message: Faculty data inserted successfully!";
                            ClearForm();
                        }
                        else
                            lblMessage.Text = "Insert failed.";
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
            //txtFacultyID.Text = "";
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtTitle.Text = "";
            txtImagePath.Text = "";
            txtEmail.Text = "";
            txtMobileNo.Text = "";
            txtLandNo.Text = "";
            txtDesignationID.Text = "";
            txtDepartmentID.Text = "";
            txtFacultyOrder.Text = "";
            txtIsActive.Text = "";
            txtCreatedDate.Text = "";
            txtModifyDate.Text = "";
            txtCreatedBy.Text = "";
            txtResearchInterest.Text = "";
            txtFacultyEducation.Text = "";
            txtStatus.Text = "";
            txtBiography.Text = "";
            txtCurrentCourse.Text = "";
        }
    }
}
