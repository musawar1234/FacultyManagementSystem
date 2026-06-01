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
    public partial class Faculty_Publication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

            string query = @"INSERT INTO [FACULTY_PUBLICATIONS] 
                        ([PUBLICATION], [PUBLICATION_YEAR], [FACULTY_ID], [CREATED_DATE], [MODIFY_DATE], [IS_ACTIVE]) 
                         VALUES 
                        (@Publication, @PublicationYear, @FacultyID, @CreatedDate, @ModifyDate, @IsActive)";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Publication", txtPublication.Text);
                    cmd.Parameters.AddWithValue("@PublicationYear", txtPublicationYear.Text);
                    cmd.Parameters.AddWithValue("@FacultyID", txtFacultyID.Text);
                    cmd.Parameters.AddWithValue("@CreatedDate", string.IsNullOrEmpty(txtCreatedDate.Text) ? (object)DBNull.Value : DateTime.Parse(txtCreatedDate.Text));
                    cmd.Parameters.AddWithValue("@ModifyDate", string.IsNullOrEmpty(txtModifyDate.Text) ? (object)DBNull.Value : DateTime.Parse(txtModifyDate.Text));
                    cmd.Parameters.AddWithValue("@IsActive", txtIsActive.Text);

                    try
                    {
                        conn.Open();
                        int result = cmd.ExecuteNonQuery();
                        if (result > 0)
                        {
                            lblMessage.Text = "Publication data inserted successfully!";
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
            txtPublication.Text = "";
            txtPublicationYear.Text = "";
            txtFacultyID.Text = "";
            txtCreatedDate.Text = "";
            txtModifyDate.Text = "";
            txtIsActive.Text = "1";
        }
    }
}