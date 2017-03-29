using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace StudentOrganisationApp
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" + HttpContext.Current.Request.Url.AbsolutePath);
            }
            string URL = Request.RawUrl;
            switch (URL)
            {
                case "/AddUser.aspx":
                    lblBreadCrump.Text = "Add User";
                    break;
                case "/AdvisorMain.aspx":
                    lblBreadCrump.Text = "Advisor";
                    break;
                case "/CreateAdvisor.aspx":
                    lblBreadCrump.Text = "Add Advisor";
                    break;
                case "/CreateMemberType.aspx":
                    lblBreadCrump.Text = "Add MemberType";
                    break;
                case "/CreateOrganization.aspx":
                    lblBreadCrump.Text = "Add Organization";
                    break;
                case "/CreateOrganizationCategory.aspx":
                    lblBreadCrump.Text = "Add Organization Category";
                    break;
                case "/CreateRequiredEvent.aspx":
                    lblBreadCrump.Text = "Add Organization Required";
                    break;
                case "/CreateServiceProject.aspx":
                    lblBreadCrump.Text = "Add Service Project";
                    break;
                case "/EditAdvisor.aspx":
                    lblBreadCrump.Text = "Edit Advisor";
                    break;
                case "/EditEvents.aspx":
                    lblBreadCrump.Text = "Edit Event";
                    break;
                case "/EditIncidents.aspx":
                    lblBreadCrump.Text = "Edit Incident";
                    break;
                case "/EditMemberType.aspx":
                    lblBreadCrump.Text = "Edit Member Type";
                    break;
                case "/EditOrganization.aspx":
                    lblBreadCrump.Text = "Edit Organization";
                    break;
                case "/EditOrganizationCategory.aspx":
                    lblBreadCrump.Text = "Edit Organization Category";
                    break;
                case "/EditRequiredEvent.aspx":
                    lblBreadCrump.Text = "Edit Required Event";
                    break;
                case "/EditServiceProject.aspx":
                    lblBreadCrump.Text = "Edit Service Project";
                    break;
                case "/EditStudent.aspx":
                    lblBreadCrump.Text = "Edit Student";
                    break;
                case "/EditUser.aspx":
                    lblBreadCrump.Text = "Edit User";
                    break;
                case "/EventsMain.aspx":
                    lblBreadCrump.Text = "Event";
                    break;
                case "/IncidentsMain.aspx":
                    lblBreadCrump.Text = "Incident";
                    break;
                case "/NewEvents.aspx":
                    lblBreadCrump.Text = "Add Event";
                    break;
                case "/NewIncidents.aspx":
                    lblBreadCrump.Text = "Add Incident";
                    break;
                case "/OrganizationMain.aspx":
                    lblBreadCrump.Text = "Organization";
                    break;
                case "/OrgRequirementMeetings.aspx":
                    lblBreadCrump.Text = "Organization Requirement Meetings";
                    break;
                case "/ReportsMain.aspx":
                    lblBreadCrump.Text = "Reports";
                    break;
                case "/ServiceProjectMain.aspx":
                    lblBreadCrump.Text = "Service Project";
                    break;
                case "/SetUpMain.aspx":
                    lblBreadCrump.Text = "Set Up";
                    break;
                case "/Reports/StudentRoster.aspx":
                    lblBreadCrump.Text = "Student Roster";
                    break;
                case "/Reports/OrganizationDump.aspx":
                    lblBreadCrump.Text = "Organization Dump";
                    break;
                case "/Reports/ExecutiveMembers.aspx":
                    lblBreadCrump.Text = "Executive Members";
                    break;
                case "/Reports/DeactivatedOrganizations.aspx":
                    lblBreadCrump.Text = "Deactivated Organizations";
                    break;
                case "/Reports/CXExport.aspx":
                    lblBreadCrump.Text = "History Of Members";
                    break;
                case "/Reports/ActiveMembers.aspx":
                    lblBreadCrump.Text = "Active Members";
                    break;

            }


        }

        protected void btnLogOff_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
        protected void btnOrganizations_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OrganizationMain.aspx");
        }
        protected void btnStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditStudent.aspx");
        }
        protected void btnAdvisor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdvisorMain.aspx");
        }
        protected void btnIncidents_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/IncidentsMain.aspx");
        }
        protected void btnEvents_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EventsMain.aspx");
        }
        protected void btnServiceProject_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ServiceProjectMain.aspx");
        }
        protected void btnReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportsMain.aspx");
        }
        protected void btnSetup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SetUpMain.aspx");
        }
        private void disableTabs()
        {
            btnAdvisor.Visible = false;
            btnEvents.Visible = false;
            btnIncidents.Visible = false;
            btnOrganizations.Visible = false;
            btnReport.Visible = false;
            btnSetup.Visible = false;
            btnStudents.Visible = false;

        }

    }
}
