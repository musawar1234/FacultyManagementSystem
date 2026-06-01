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
    public partial class Advertisement_Form_Entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

            string query = @"
                INSERT INTO dbo.ADVERTISEMENTS 
                (ADV_TITLE, ADV_DESC, ADV_DATE, IS_ACTIVE, NEWSPAPER_NAME, REFRENCE_URL, CREATED_DATE, MODIFY_DATE, CREATED_BY, IMAGE_PATH, ADV_TYPE)
                VALUES (@Title, @Desc, @AdvDate, @IsActive, @Newspaper, @RefUrl, @CreatedDate, @ModifyDate, @CreatedBy, @ImagePath, @AdvType)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Title", (object)txtAdvTitle.Text ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Desc", (object)txtAdvDesc.Text ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@AdvDate", string.IsNullOrEmpty(txtAdvDate.Text) ? DBNull.Value : (object)DateTime.Parse(txtAdvDate.Text));
                    cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);
                    cmd.Parameters.AddWithValue("@Newspaper", (object)txtNewspaperName.Text ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@RefUrl", (object)txtReferenceUrl.Text ?? DBNull.Value);
                    // Set CREATED_DATE and MODIFY_DATE to current datetime
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ModifyDate", DateTime.Now);
                    int createdBy;
                    if (!int.TryParse(txtCreatedBy.Text, out createdBy))
                        createdBy = 0; // or some default user id
                    cmd.Parameters.AddWithValue("@CreatedBy", createdBy);
                    cmd.Parameters.AddWithValue("@ImagePath", (object)txtImagePath.Text ?? DBNull.Value);
                    int advType;
                    if (!int.TryParse(txtAdvType.Text, out advType))
                        advType = 0;
                    cmd.Parameters.AddWithValue("@AdvType", advType);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Advertisement saved successfully.";
                    }
                    catch (Exception ex)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Error saving advertisement: " + ex.Message;
                    }
                }
            }
        }
    }
}