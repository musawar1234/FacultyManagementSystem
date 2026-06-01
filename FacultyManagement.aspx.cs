using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class FacultyManagement : System.Web.UI.Page
    {
        string connectionString = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z";

        protected void Page_Load(object sender, EventArgs e)
        {
            // ----------------- LOGIN PROTECTION -----------------
            if (Session["Username"] == null)
            {
                Response.Redirect("loginpage.aspx");
                return;
            }

            // Get role
            string role = Session["Role"].ToString();

            // Role-based access
            if (role == "Admin")
            {
               // HideInsertSection();
               // HideUpdateSection();
            }
            else if (role == "SuperAdmin")
            {
                //HideInsertSection();
                //HideUpdateSection();
            }
            else if (role == "Editor")
            {
                // Admin has insert/update
                // If delete buttons exist, hide them
                //HideDeleteButtons();
            }
            // SuperAdmin -- full access

            lblUsername.Text = "Welcome, " + Session["Username"].ToString();

            if (!IsPostBack)
            {
                BindDesignationBlocks();
            }
        }

        // --- ROLE METHODS ---
        //protected void HideInsertSection()
        //{
        //    Panel1.Visible = false;  
        //}

        //protected void HideUpdateSection()
        //{
        //    Panel2.Visible = false;  
        //}

        protected void HideDeleteButtons()
        {
            // Example: If you add delete buttons in future
            // btnDelete.Visible = false;
        }


        // ------------------- SEARCH BUTTON -------------------
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(search))
            {
                SqlDataSource1.SelectCommand =
                    "SELECT DESIGNATION_ID, DESIGNATION_NAME, DESIGNATION_DESC, IS_ACTIVE, CREATED_BY, DESIGNATION_PRIORITY " +
                    "FROM DESIGNATIONS WHERE DESIGNATION_NAME LIKE @DesignationName";

                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("DesignationName", "%" + search + "%");
            }
            else
            {
                SqlDataSource1.SelectCommand =
                    "SELECT DESIGNATION_ID, DESIGNATION_NAME, DESIGNATION_DESC, IS_ACTIVE, CREATED_BY, DESIGNATION_PRIORITY FROM DESIGNATIONS";

                SqlDataSource1.SelectParameters.Clear();
            }

            GridView1.DataBind();
        }


        // ------------------- LOAD CAROUSEL DATA -------------------
        private void BindDesignationBlocks()
        {
            List<DesignationStat> stats = GetDesignationStats();

            for (int i = 0; i < stats.Count; i++)
            {
                stats[i].ColorClass = "bg-" + (i % 6);
            }

            List<List<DesignationStat>> slides = new List<List<DesignationStat>>();
            for (int i = 0; i < stats.Count; i += 4)
            {
                int take = Math.Min(4, stats.Count - i);
                slides.Add(stats.GetRange(i, take));
            }

            rptSlides.DataSource = slides;
            rptSlides.DataBind();
        }


        // ------------------- DATABASE CALL -------------------
        private List<DesignationStat> GetDesignationStats()
        {
            List<DesignationStat> stats = new List<DesignationStat>();

            string query = @"
                SELECT 
                    D.DESIGNATION_ID,
                    D.DESIGNATION_NAME,
                    COUNT(*) AS FacultyCount,
                    SUM(CASE WHEN F.STATUS = 'Chair' THEN 1 ELSE 0 END) AS ChairCount
                FROM FACULTY F
                INNER JOIN DESIGNATIONS D ON F.Designation_ID = D.DESIGNATION_ID
                WHERE F.IS_ACTIVE = 1
                GROUP BY D.DESIGNATION_ID, D.DESIGNATION_NAME
                ORDER BY D.DESIGNATION_ID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        stats.Add(new DesignationStat
                        {
                            DESIGNATION_ID = Convert.ToInt32(rd["DESIGNATION_ID"]),
                            DesignationName = rd["DESIGNATION_NAME"].ToString(),
                            FacultyCount = Convert.ToInt32(rd["FacultyCount"]),
                            ChairCount = Convert.ToInt32(rd["ChairCount"])
                        });
                    }
                }
            }

            return stats;
        }

        public class DesignationStat
        {
            public int DESIGNATION_ID { get; set; }
            public string DesignationName { get; set; }
            public int FacultyCount { get; set; }
            public int ChairCount { get; set; }
            public string ColorClass { get; set; }
        }
    }
}
