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
    public partial class Display_Event_News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            string connectionString = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z"; // Replace with your connection string
            string query = "SELECT * FROM NEWS_EVENTS ORDER BY ID DESC";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvNewsEvents.DataSource = dt;
                    gvNewsEvents.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int searchId;
            if (int.TryParse(txtSearchID.Text, out searchId))
            {
                string connectionString = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z"; // Replace with your connection string
                string query = "SELECT * FROM NEWS_EVENTS WHERE ID = @ID";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ID", searchId);
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            gvNewsEvents.DataSource = dt;
                            gvNewsEvents.DataBind();
                        }
                    }
                }
            }
            else
            {
                // Handle invalid input or show all records
                BindGridView();
            }
        }
    }
}