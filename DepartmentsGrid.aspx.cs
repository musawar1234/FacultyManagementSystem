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
    public partial class DepartmentsGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(search))
            {
                // Use parameterized query to prevent SQL injection
                SqlDataSource1.SelectCommand = "SELECT [DEPT_ID], [DEPT_NAME], [DEPT_DESC], [IS_ACTIVE], [FACULTY_NAME] FROM [DEPARTMENTS] WHERE [DEPT_NAME] LIKE @DeptName";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("DeptName", "%" + search + "%");
            }
            else
            {
                // If the search box is empty, show all departments
                SqlDataSource1.SelectCommand = "SELECT [DEPT_ID], [DEPT_NAME], [DEPT_DESC], [IS_ACTIVE], [FACULTY_NAME] FROM [DEPARTMENTS]";
                SqlDataSource1.SelectParameters.Clear();
            }

            GridView1.DataBind();
        }
    }

    }
