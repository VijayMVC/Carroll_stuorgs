using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace StudentOrganisationApp.Shared
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnAddAdvisor.Visible = false;
            btnEditAdvisor.Visible = false;
            btnAddEvent.Visible = false;
            btnEditEvent.Visible = false;
            btnAddInci.Visible = false;
            btnEditInci.Visible = false;
            btnAddOrg.Visible = false;
            btnEditOrg.Visible = false;
            btnAddSP.Visible = false;
            btnEditSP.Visible = false;
        }
        protected void btnLogOff_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnOrganizations_Click(object sender, EventArgs e)
        {
            btnAddOrg.Visible = true;
            btnEditOrg.Visible = true;
        }

        protected void btnStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditStudent.aspx");
        }

        protected void btnAdvisor_Click(object sender, EventArgs e)
        {
            btnAddAdvisor.Visible = true;
            btnEditAdvisor.Visible = true;
        }

        protected void btnIncidents_Click(object sender, EventArgs e)
        {
            btnAddInci.Visible = true;
            btnEditInci.Visible = true;
        }

        protected void btnEvents_Click(object sender, EventArgs e)
        {

            btnAddEvent.Visible = true;
            btnEditEvent.Visible = true;
        }

        protected void btnServiceProject_Click(object sender, EventArgs e)
        {

            btnAddSP.Visible = true;
            btnEditSP.Visible = true;
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ReportsMain.aspx");
        }

        protected void btnSetup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SetUpMain.aspx");
        }

        protected void btnEditSP_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditServiceProject.aspx");
        }

        protected void btnAddSP_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateServiceProject.aspx");
        }

        protected void btnEditEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditEvents.aspx");
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NewEvents.aspx");
        }

        protected void btnEditInci_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditIncidents.aspx");
        }

        protected void btnAddInci_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NewIncidents.aspx");
        }

        protected void btnEditAdvisor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditAdvisor.aspx");
        }

        protected void btnAddAdvisor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateAdvisor.aspx");
        }

        protected void btnEditOrg_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditOrganization.aspx");
        }

        protected void btnAddOrg_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateOrganization.aspx");
        }
    }
}