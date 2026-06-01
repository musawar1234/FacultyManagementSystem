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
    public partial class Faculty_detail_list_Designation : System.Web.UI.Page
    {
        private string connectionString = "Data Source=210.56.11.66;Initial Catalog=au_edu_pk_websiteDB;User ID=au_edu_pk_webmaster248_Admin;Password=Rno53*3z";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDesignations();
                pnlNoData.Visible = false;
            }
        }

        private void LoadDesignations()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT DESIGNATION_ID, DESIGNATION_NAME 
                    FROM DESIGNATIONS 
                    WHERE IS_ACTIVE = 1 
                    ORDER BY DESIGNATION_PRIORITY";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlDesignations.DataSource = dt;
                ddlDesignations.DataTextField = "DESIGNATION_NAME";
                ddlDesignations.DataValueField = "DESIGNATION_ID";
                ddlDesignations.DataBind();
            }
        }

        protected void ddlDesignations_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDesignations.SelectedValue != "0")
            {
                LoadFacultyByDesignation(Convert.ToInt32(ddlDesignations.SelectedValue));
                pnlFaculty.Visible = true;
                pnlNoData.Visible = false;
            }
            else
            {
                pnlFaculty.Visible = false;
                pnlNoData.Visible = true;
            }
        }

        private void LoadFacultyByDesignation(int designationId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                f.FACULTY_ID,
                f.FIRST_NAME,
                f.MIDDLE_NAME,
                f.LAST_NAME,
                f.TITLE,
                f.FACULTY_EMAIL,
                f.MOBILE_NO,
                t.DEPT_NAME,
                f.IS_ACTIVE -- ✅ Added Department Name
            FROM FACULTY f
            INNER JOIN DESIGNATIONS d ON f.DESIGNATION_ID = d.DESIGNATION_ID
            INNER JOIN DEPARTMENTS t ON f.DEPARTMENT_ID = t.DEPT_ID  -- ✅ Proper JOIN
            WHERE f.DESIGNATION_ID = @DesignationId 
            AND f.IS_ACTIVE = 1
            ORDER BY ISNULL(f.FACULTY_ORDER, 999)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DesignationId", designationId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptFaculty.DataSource = dt;
                    rptFaculty.DataBind();
                    pnlFaculty.Visible = true;
                    pnlNoData.Visible = false;
                }
                else
                {
                    pnlFaculty.Visible = false;
                    pnlNoData.Visible = true;
                }
            }
        }
    }
}