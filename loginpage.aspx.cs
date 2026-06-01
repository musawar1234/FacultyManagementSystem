using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class loginpage : System.Web.UI.Page
    {
        string conStr = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z;";
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        private DataRow ValidateUser(string username, string password)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT * FROM Users 
                                 WHERE Username = @u AND Password = @p";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@u", username);
                cmd.Parameters.AddWithValue("@p", password);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                    return dt.Rows[0];
                else
                    return null;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            DataRow user = ValidateUser(username, password);

            if (user != null)
            {
                // store sessions
                Session["Username"] = user["Username"].ToString();
                Session["Role"] = user["Role"].ToString();
                Session.Timeout = 1440;

                string role = user["Role"].ToString();

                // Redirect by ROLE
                if (role == "SuperAdmin")
                {
                    Response.Redirect("FacultyManagement.aspx");
                }
                else if (role == "Admin")
                {
                    Response.Redirect("FacultyManagement.aspx");
                }
                else if (role == "Editor")
                {
                    Response.Redirect("FacultyManagement.aspx");
                }
                else
                {
                    lblMessage.Text = "Role not assigned. Contact Administrator.";
                }
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
        //private bool ValidateUser(string username, string password)
        //{
        //    // Implement your logic here to validate credentials
        //    // For example, check against a database
        //    if (username == "admin" && password == "password123")
        //    {
        //        return true;
        //    }
        //    return false;
        //}

        // protected void btnLogin_Click(object sender, EventArgs e)
        // {
        //     // Hardcoded credentials
        //     string validUsername = "Admin";
        //     string validPassword = "AUFMD@2025";

        //     string username = txtUsername.Text.Trim();
        //     string password = txtPassword.Text.Trim();

        //     if (username == validUsername && password == validPassword)
        //     {
        //         // Redirect to dashboard or main page
        //         Response.Redirect("FacultyManagement.aspx");
        //     }
        //     else
        //     {
        //         lblMessage.Text = "Invalid username or password.";
        //     }
        //     // Your login validation logic here...
        //     bool isValidUser = ValidateUser(txtUsername.Text, txtPassword.Text);

        //     if (isValidUser)
        //     {
        //         // Set session user
        //         Session["Username"] = txtUsername.Text;

        //         // Set session timeout for 24 hours (1440 minutes)
        //         Session.Timeout = 1440;

        //         // Redirect to a secured page
        //         Response.Redirect("FacultyManagement.aspx");
        //     }
        //     else
        //     {
        //         lblMessage.Text = "Invalid username or password.";
        //     }

        // }
    }
}