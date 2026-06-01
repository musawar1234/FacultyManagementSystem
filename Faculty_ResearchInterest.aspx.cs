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
    public partial class UpdateFacultyEntryFrom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;
            string query = @"INSERT INTO dbo.FACULTY_RESEARCH_INTEREST
                        (RESEARCH_TITLE, FACULTY_ID, CREATED_DATE, MODIFY_DATE, CREATED_BY, IS_ACTIVE) 
                        VALUES 
                        (@ResearchTitle, @FacultyID, @CreatedDate, @ModifyDate, @CreatedBy, @IsActive)";
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ResearchTitle", txtResearchTitle.Text);
                    //cmd.Parameters.AddWithValue("@CreatedDate", isCreatedDateValid ? (object)createdDate : DBNull.Value);
                    //cmd.Parameters.AddWithValue("@ModifyDate", isModifyDateValid ? (object)modifyDate : DBNull.Value);
                    cmd.Parameters.AddWithValue("@CreatedDate", string.IsNullOrEmpty(txtCreatedDate.Text) ? (object)DBNull.Value : DateTime.Parse(txtCreatedDate.Text));
                    cmd.Parameters.AddWithValue("@ModifyDate", string.IsNullOrEmpty(txtModifyDate.Text) ? (object)DBNull.Value : DateTime.Parse(txtModifyDate.Text));
                    cmd.Parameters.AddWithValue("@FacultyID", txtFacultyID.Text);
                    //cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Parse(txtCreatedDate.Text));
                    //cmd.Parameters.AddWithValue("@ModifyDate", DateTime.Parse(txtModifyDate.Text));
                    cmd.Parameters.AddWithValue("@CreatedBy", txtCreatedBy.Text);
                    cmd.Parameters.AddWithValue("@IsActive", txtIsActive.Text);

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = result > 0 ? "Research interest inserted successfully!" : "Insert failed.";

                    if (result > 0)
                    {
                        ClearForm();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        public void ClearForm()
        {
            txtResearchTitle.Text = "";
            txtFacultyID.Text = "";
            txtCreatedDate.Text = "";
            txtModifyDate.Text = "";
            txtCreatedBy.Text = "";
            txtIsActive.Text = "1";
        }
    }
}