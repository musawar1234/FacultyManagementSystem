using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(search))
            {
                // Use parameterized query to prevent SQL injection
                SqlDataSource1.SelectCommand = "SELECT [DESIGNATION_ID], [DESIGNATION_NAME], [DESIGNATION_DESC], [IS_ACTIVE], [CREATED_BY], [DESIGNATION_PRIORITY] FROM [DESIGNATIONS] WHERE  [DESIGNATION_NAME] LIKE @DesignationName";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("DesignationName", "%" + search + "%");
            }
            else
            {
                // If the search box is empty, show all departments
                SqlDataSource1.SelectCommand = "SELECT [DESIGNATION_ID], [DESIGNATION_NAME], [DESIGNATION_DESC], [IS_ACTIVE], [CREATED_BY], [DESIGNATION_PRIORITY] FROM [DESIGNATIONS]";
                SqlDataSource1.SelectParameters.Clear();
            }

            GridView1.DataBind();
        }
    }
}