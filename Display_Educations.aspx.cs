using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class Display_Educations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadFacultyEducation();
        }
        private void LoadFacultyNames()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT FACULTY_ID, FIRST_NAME + ' ' + LAST_NAME AS FacultyName
                         FROM FACULTY
                         WHERE ISNULL(STATUS,'') <> 'Inactive'
                         ORDER BY FIRST_NAME";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    StringBuilder options = new StringBuilder();

                    while (dr.Read())
                    {
                        options.Append("<option value='")
                               .Append(dr["FacultyName"].ToString())
                               .Append("'></option>");
                    }

                    FacultyList.InnerHtml = options.ToString();
                }
            }
        }

        private void LoadFacultyEducation()
        {
            string constr = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
SELECT  
    f.FACULTY_ID,
    f.FIRST_NAME,
    f.MIDDLE_NAME,
    f.LAST_NAME,
    LTRIM(RTRIM(
        ISNULL(f.FIRST_NAME,'') + ' ' +
        ISNULL(f.MIDDLE_NAME,'') + ' ' +
        ISNULL(f.LAST_NAME,'')
    )) AS FacultyName,
    e.EDUCATION_TITLE,
    e.UNIVERSITY_NAME,
    e.SUBJECT_MAJORS
FROM FACULTY f
INNER JOIN FACULTY_EDUCATION e
    ON f.FACULTY_ID = e.FACULTY_ID
WHERE 
    (@FacultyID IS NULL OR f.FACULTY_ID = @FacultyID)
AND
    (@FacultyName IS NULL 
     OR f.FIRST_NAME LIKE '%' + @FacultyName + '%'
     OR f.MIDDLE_NAME LIKE '%' + @FacultyName + '%'
     OR f.LAST_NAME LIKE '%' + @FacultyName + '%')
AND
    e.IS_ACTIVE = 1
AND
    ISNULL(f.STATUS,'') <> 'Inactive'";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Faculty ID parameter
                    if (!string.IsNullOrEmpty(txtFacultyID.Text))
                    {
                        cmd.Parameters.AddWithValue("@FacultyID", Convert.ToInt32(txtFacultyID.Text));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@FacultyID", DBNull.Value);
                    }

                    // Faculty Name parameter
                    if (!string.IsNullOrEmpty(txtFacultyName.Text))
                    {
                        cmd.Parameters.AddWithValue("@FacultyName", txtFacultyName.Text.Trim());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@FacultyName", DBNull.Value);
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvFacultyEducation.DataSource = dt;
                        gvFacultyEducation.DataBind();
                    }
                }
            }
        }
    }
}