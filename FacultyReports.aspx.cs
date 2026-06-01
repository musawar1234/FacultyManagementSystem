using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class FacultyReports : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

        protected void txtSearchFaculty_TextChanged(object sender, EventArgs e)
        {
            ddlFaculty.Items.Clear();
            ddlFaculty.Items.Add(new ListItem("-- Select Faculty --", "0"));

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT FACULTY_ID,
                    TITLE + ' ' + FIRST_NAME + ' ' + LAST_NAME AS FullName
                    FROM FACULTY
                    WHERE FIRST_NAME LIKE @name OR LAST_NAME LIKE @name
                ", con);

                cmd.Parameters.AddWithValue("@name", "%" + txtSearchFaculty.Text.Trim() + "%");

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ddlFaculty.Items.Add(
                        new ListItem(dr["FullName"].ToString(), dr["FACULTY_ID"].ToString())
                    );
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string id = ddlFaculty.SelectedValue;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    SELECT f.*, d.DEPT_NAME, des.DESIGNATION_NAME 
                    FROM FACULTY f
                    LEFT JOIN DEPARTMENTS d ON f.DEPARTMENT_ID = d.DEPT_ID
                    LEFT JOIN DESIGNATIONS des ON f.DESIGNATION_ID = des.DESIGNATION_ID
                    WHERE f.FACULTY_ID = @id", con);

                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    pnlReport.Visible = true;

                    lblName.Text = dr["TITLE"] + " " + dr["FIRST_NAME"] + " " + dr["LAST_NAME"];
                    lblEmail.Text = dr["FACULTY_EMAIL"].ToString();
                    lblMobile.Text = dr["MOBILE_NO"].ToString();
                    lblDesignation.Text = dr["DESIGNATION_NAME"].ToString();
                    lblDepartment.Text = dr["DEPT_NAME"].ToString();
                    lblBio.Text = dr["Biography"].ToString();

                    // ✅ ACTIVE / INACTIVE STATUS
                    int isActive = Convert.ToInt32(dr["IS_ACTIVE"]);
                    if (isActive == 1)
                    {
                        lblStatus.Text = "Active";
                        lblStatus.CssClass = "badge bg-success";
                    }
                    else
                    {
                        lblStatus.Text = "Inactive";
                        lblStatus.CssClass = "badge bg-danger";
                    }

                    dr.Close();

                    LoadEducation(id);
                    LoadPublications(id);
                    LoadResearchInterests(id);
                }
                else
                {
                    pnlReport.Visible = false;
                }
            }
        }

        void LoadEducation(string id)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                    SELECT EDUCATION_TITLE AS Degree,
                           UNIVERSITY_NAME AS University,
                           SUBJECT_MAJORS AS Specialisation
                    FROM FACULTY_EDUCATION
                    WHERE FACULTY_ID = @id AND IS_ACTIVE = 1", con);

                da.SelectCommand.Parameters.AddWithValue("@id", id);

                DataTable dt = new DataTable();
                da.Fill(dt);

                gvEducation.DataSource = dt;
                gvEducation.DataBind();
            }
        }

        void LoadPublications(string id)
        {
            blPublications.Items.Clear();

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT PUBLICATION 
                    FROM FACULTY_PUBLICATIONS
                    WHERE FACULTY_ID = @id AND IS_ACTIVE = 1", con);

                cmd.Parameters.AddWithValue("@id", id);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    blPublications.Items.Add(dr["PUBLICATION"].ToString());
                }
            }
        }

        void LoadResearchInterests(string id)
        {
            blResearch.Items.Clear();

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT RESEARCH_TITLE 
                    FROM FACULTY_RESEARCH_INTEREST
                    WHERE FACULTY_ID = @id AND IS_ACTIVE = 1", con);

                cmd.Parameters.AddWithValue("@id", id);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    blResearch.Items.Add(dr["RESEARCH_TITLE"].ToString());
                }
            }
        }
    }
}
