using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp.SetUp
{
    public partial class SetUpMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCreateOrgCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateOrganizationCategory.aspx");
        }
        protected void btnEditOrgCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditOrganizationCategory.aspx");
        }
        protected void btnCreateMemberTyper_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateMemberType.aspx");
        }
        protected void btnEditMemberTyper_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditMemberType.aspx");
        }
        protected void btnCreaterequiredEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateRequiredEvent.aspx");
        }
        protected void btnScheduleReqEventMeet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditRequiredEvent.aspx");
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddUser.aspx");
        }

        protected void btnEditUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditUser.aspx");
        }

        protected void btnResetStudentRoster_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ResetStudent.aspx");
        }
    }
}