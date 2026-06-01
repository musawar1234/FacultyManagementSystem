using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication_EntryForm
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string conStr = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblForgotMsg.Visible = false;
            }
        }

        protected void btnSendReset_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();

            if (string.IsNullOrEmpty(username))
            {
                ShowMessage("Please enter your username.", "danger");
                return;
            }

            if (UserExists(username))
            {
                string resetToken = GenerateResetToken(username);
                Session["ResetToken"] = resetToken;
                Session["ResetUsername"] = username;
                Session["ResetTime"] = DateTime.Now;

                ShowMessage("Redirecting to reset password...", "success");
                ClientScript.RegisterStartupScript(this.GetType(), "redirect",
                    "setTimeout(function(){ window.location.href='ResetPassword.aspx'; }, 1500);", true);
            }
            else
            {
                ShowMessage("Username not found. Please check and try again.", "danger");
            }
        }

        private bool UserExists(string username)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);
                con.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private string GenerateResetToken(string username)
        {
            string token = Guid.NewGuid().ToString().Replace("-", "").Substring(0, 8).ToUpper();

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"UPDATE Users SET ResetToken = @token, ResetTokenExpiry = DATEADD(minute, 10, GETDATE()) 
                               WHERE Username = @username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@token", token);
                cmd.Parameters.AddWithValue("@username", username);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            return token;
        }

        private void ShowMessage(string message, string type)
        {
            lblForgotMsg.Text = message;
            lblForgotMsg.CssClass = "alert alert-" + type + " text-center d-block mb-3";
            lblForgotMsg.Visible = true;
        }
    }
}
