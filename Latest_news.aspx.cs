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
    public partial class Latest_news : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SafeLoadData();
            }
        }
        private void SafeLoadData()
        {
            // ✅ CHECK 1: GridView exists
            if (gvHeadsOfDept == null)
            {
                Response.Write("GridView not found!");
                return;
            }

            try
            {
                // ✅ CHECK 2: Connection string exists
                var connSettings = ConfigurationManager.ConnectionStrings["MyDbConnectionString"];
                if (connSettings == null || string.IsNullOrEmpty(connSettings.ConnectionString))
                {
                    ShowSafeMessage("Please add connection string 'constr' to web.config");
                    return;
                }

                string connString = connSettings.ConnectionString;

                // ✅ CHECK 3: Test connection
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    string sql = @"
                        SELECT 
                            ISNULL(f.FIRST_NAME + ' ' + ISNULL(f.MIDDLE_NAME + ' ', '') + f.LAST_NAME, 'N/A') AS FacultyName,
                            ISNULL(des.DESIGNATION_NAME, 'N/A') AS DesignationName,
                            ISNULL(d.DEPT_NAME, 'N/A') AS DepartmentName
                        FROM FACULTY f
                        LEFT JOIN DESIGNATIONS des ON f.DESIGNATION_ID = des.DESIGNATION_ID
                        LEFT JOIN DEPARTMENTS d ON f.DEPARTMENT_ID = d.DEPT_ID
                        WHERE UPPER(f.STATUS) = 'CHAIR'
                        ORDER BY d.DEPT_NAME";

                    using (SqlDataAdapter da = new SqlDataAdapter(sql, conn))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // ✅ CHECK 4: Bind safely
                        gvHeadsOfDept.DataSource = dt.Rows.Count > 0 ? dt : null;
                        gvHeadsOfDept.EmptyDataText = dt.Rows.Count > 0 ? "" : "No Heads of Departments found";
                        gvHeadsOfDept.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowSafeMessage("Error: " + ex.Message);
            }
        }
        protected void gvHeadsOfDept_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHeadsOfDept.PageIndex = e.NewPageIndex;  // Set new page
            SafeLoadData();                            // Rebind data
        }
        private void ShowSafeMessage(string message)
        {
            if (gvHeadsOfDept != null)
            {
                gvHeadsOfDept.DataSource = null;
                gvHeadsOfDept.EmptyDataText = message;
                gvHeadsOfDept.DataBind();
            }
        }

    }
}