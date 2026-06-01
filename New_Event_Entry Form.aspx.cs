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
    public partial class New_Event_Entry_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO NEWS_EVENTS 
                              (TITLE, IMAGE_PATH, EVENT_DATE, EVENT_ORDER, EVENT_STATUS, EVENT_DESC, IS_ACTIVE, IMAGE_GALLARY, CREATED_DATE, MODIFY_DATE, CREATED_BY) 
                              VALUES 
                              (@Title, @ImagePath, @EventDate, @EventOrder, @EventStatus, @EventDesc, @IsActive, @ImageGallery, @CreatedDate, @ModifyDate, @CreatedBy)";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@ImagePath", txtImagePath.Text);
                cmd.Parameters.AddWithValue("@EventDate", txtEventDate.Text);
                cmd.Parameters.AddWithValue("@EventOrder", int.Parse(txtEventOrder.Text));
                cmd.Parameters.AddWithValue("@EventStatus", int.Parse(txtEventStatus.Text));
                cmd.Parameters.AddWithValue("@EventDesc", txtEventDesc.Text);
                cmd.Parameters.AddWithValue("@IsActive", chkIsActive.Checked);
                cmd.Parameters.AddWithValue("@ImageGallery", txtImageGallery.Text);
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@ModifyDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@CreatedBy", 1); // Replace with actual user ID logic

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}