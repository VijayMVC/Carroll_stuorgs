using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp
{
    public partial class ResetStudent : System.Web.UI.Page
    {
        OrganizationDAO org = new OrganizationDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            org.ResetStudentRoster();
            Response.Redirect("~/SetUpMain.aspx");
        }
    }
}