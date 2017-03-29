using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp
{
    public partial class Main : System.Web.UI.Page
    {
        StatusDAO StatusDAO = new StatusDAO();
        OrganizationDAO orgDAO = new OrganizationDAO();
        AdvisorDAO AdvisorDAO = new AdvisorDAO();
        CategoryDAO CategoryDAO = new CategoryDAO();
        StudentOrganizationDBClassDataContext db = new StudentOrganizationDBClassDataContext();
        List<AdvisorList> advisorL = new List<AdvisorList>();
           
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tabContainerCreateOrg.ActiveTabIndex = 0;

                    ddlCategory.DataSource = CategoryDAO.getCategory();
                    ddlCategory.DataTextField = "CategoryName";
                    ddlCategory.DataValueField = "Category_ID";
                    ddlCategory.DataBind();
                }
            }
            catch
            {
                lblMessage.Text = "Cannot load the page!!";
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        { 
            int tabIndex = tabContainerCreateOrg.ActiveTabIndex;
            tabContainerCreateOrg.ActiveTab = tabContainerCreateOrg.Tabs[++tabIndex];
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerCreateOrg.ActiveTabIndex;
            tabContainerCreateOrg.ActiveTab = tabContainerCreateOrg.Tabs[--tabIndex];
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try{
            if (ddlCategory.SelectedValue != "-1")
            {
                DateTime today = DateTime.Now;
                string reqMetDate = string.Empty;          
                int catID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                bool reqMet = chkBoxRegApproval.Checked;
                int statID = 1;//A status of 1 is proposed
                string meetDay = string.Empty;
                string meetFrequency = string.Empty;

                if (ddlMeetingDay.SelectedValue == "-1")
                {
                    meetDay = null;
                }
                else
                {
                    meetDay = ddlMeetingDay.SelectedItem.Text;
                }

                if (ddlMeetingFrequency.SelectedValue == "-1")
                {
                    meetFrequency = null;
                }
                else
                {
                    meetFrequency = ddlMeetingFrequency.SelectedItem.Text;
                }

                //8.11.2016 - added OAccount, Project Code
                bool created =  orgDAO.CreateOrganization(txtorg.Text, txtDescription.Text,
                    txtMeetTime.Text, meetDay,
                    txtBuilding.Text,
                    txtMeetRoom.Text,
                    string.IsNullOrEmpty(txtDatePrposalPacketSub.Text) ? null : txtDatePrposalPacketSub.Text,
                    string.IsNullOrEmpty(txtDateApproved.Text) ? null : txtDateApproved.Text,
                    string.IsNullOrEmpty(txtDatedenied.Text) ? null : txtDatedenied.Text,
                    txtProposalNotes.Text,
                    string.IsNullOrEmpty(txtConstitutionSubmission.Text) ? null : txtConstitutionSubmission.Text,
                    string.IsNullOrEmpty(txtConstitution.Text) ? null : txtConstitution.Text,
                    txtConstitutionNotes.Text,
                    string.IsNullOrEmpty(txtRegApproval.Text) ? null : txtRegApproval.Text,
                    txtCXCode.Text,
                    catID,
                    reqMet,
                    string.IsNullOrEmpty(txtRequirementMetDate.Text) ? null : txtRequirementMetDate.Text,
                    txtComments.Text,
                    statID,
                    today.ToShortDateString(),
                    today.ToShortDateString(),
                    null, HttpContext.Current.User.Identity.Name, meetFrequency,
                    string.IsNullOrEmpty(txtOAccount.Text) ? null : txtOAccount.Text.Trim(),
                    string.IsNullOrEmpty(txtProjectCode.Text) ? null : txtProjectCode.Text.Trim());

                clearTextComments();
                clearTextDates();
                clearTextMain();
                tabContainerCreateOrg.ActiveTabIndex = 0;

                if (created)
                    lblMessage.Text = "Organization Created.";
                else
                    lblMessage.Text = "Organization could not be Created!!";
            }
            else
            {
                lblMessage.Text = "Please select a Category before Submitting.";            
            }
        }
         catch 
            {
                lblMessage.Text = "Organization Could not be Created!!";
            }
        }

        protected void btnNewAdvisor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditAdvisor.aspx");
        }

        protected void btnEditAdvisor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditAdvisor.aspx");
        }

        private void clearTextMain()
        {
            txtorg.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtBuilding.Text = string.Empty;
            txtMeetRoom.Text = string.Empty;
            txtMeetTime.Text = string.Empty;
            ddlMeetingDay.SelectedValue = "-1";
            txtRegApproval.Text = string.Empty;
            ddlMeetingDay.SelectedIndex = -1;
            ddlMeetingFrequency.SelectedIndex = -1;
            //added 8.11.2016
            txtOAccount.Text = string.Empty;
            txtProjectCode.Text = string.Empty;

            ddlCategory.SelectedIndex = -1;
        }
        private void clearTextDates()
        {
            txtDatePrposalPacketSub.Text = string.Empty;
            txtDatedenied.Text = string.Empty;
            txtDateApproved.Text = string.Empty;
            txtConstitution.Text = string.Empty;
            txtConstitutionNotes.Text = string.Empty;
            txtConstitutionSubmission.Text = string.Empty;
            txtProposalNotes.Text = string.Empty;
        }
        private void clearTextComments()
        {
            txtComments.Text = string.Empty;
        }
        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearTextMain();
        }

        protected void btnCanelDates_Click(object sender, EventArgs e)
        {
            clearTextDates();
        }

        protected void btnCancelComments_Click(object sender, EventArgs e)
        {
            clearTextComments();        
        }

        protected void btnNewAdvisor_Click1(object sender, EventArgs e)
        {
            Response.Write("<script type='text/javascript'>detailedresults=window.open('CreateAdvisor.aspx');</script>");
        }

        protected void chkBoxRegApproval_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBoxRegApproval.Checked)
            {
                txtRequirementMetDate.Visible = true;
                lblRegApproval.Visible = true;
                imgRequirementMetDate.Visible = true;
            }
            else 
            {
                txtRequirementMetDate.Visible = false;
                lblRegApproval.Visible = false;
                imgRequirementMetDate.Visible = false;
                txtRequirementMetDate.Text = string.Empty;
            }
        }
    }
}