using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp
{
    public partial class CreateServiceProject : System.Web.UI.Page
    {
        OrganizationDAO OrganizationDAO = new OrganizationDAO();
        ServiceProjectDAO ServiceProjectDAO = new ServiceProjectDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tabContainerNewServiceProject.ActiveTabIndex = 0;

                    ddlNewServiceProjectOrgEncharge.DataSource = OrganizationDAO.getOrganizationList();
                    ddlNewServiceProjectOrgEncharge.DataTextField = "OrganizationName";
                    ddlNewServiceProjectOrgEncharge.DataValueField = "Organization_ID";
                    ddlNewServiceProjectOrgEncharge.DataBind();
                }
            }
            catch
            {
                lblMessage.Text = "Cannot load the page!!";
            }
        }

        protected void chkServiceProjectOnGoing_CheckedChanged(object sender, EventArgs e)
        {
            if (chkServiceProjectOnGoing.Checked)
            {
                pnlOnGoing.Visible = true;
                pnlOneTime.Visible = false;
            }
            else
            {
                pnlOnGoing.Visible = false;
                pnlOneTime.Visible = true;            
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerNewServiceProject.ActiveTabIndex;
            tabContainerNewServiceProject.ActiveTab = tabContainerNewServiceProject.Tabs[++tabIndex];
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

            int tabIndex = tabContainerNewServiceProject.ActiveTabIndex;
            tabContainerNewServiceProject.ActiveTab = tabContainerNewServiceProject.Tabs[--tabIndex];
        }

        protected void btnCancelComments_Click(object sender, EventArgs e)
        {
            txtComments.Text = string.Empty;
        }

        protected void btnCancelMain_Click(object sender, EventArgs e)
        {
            clearText();
        }

        protected void clearText()
        {
            txtServiceProjectCP.Text = string.Empty;
            txtServiceProjectCPEmail.Text = string.Empty;
            txtServiceProjectCPName.Text = string.Empty;
            txtServiceProjectCPPhone.Text = string.Empty;
            txtServiceProjectDate.Text = string.Empty;
            txtServiceProjectDescription.Text = string.Empty;
            txtServiceProjectEndDate.Text = string.Empty;
            txtServiceProjectLocation.Text = string.Empty;
            txtServiceProjectNoOfVolunteers.Text = string.Empty;
            txtServiceProjectStartDate.Text = string.Empty;
            txtServiceProjectTitle.Text = string.Empty;
            txtServiceProjectVolunteersHours.Text = string.Empty;
            txtSPOneTimeFromTime.Text = string.Empty;
            txtSPOneTimeToTime.Text = string.Empty;
            txtSPOnGoingFromTime.Text = string.Empty;
            txtSPOnGoingToTime.Text = string.Empty;
            txtFundsRaised.Text = string.Empty;

            //8.12.2016, added planning fields for MyOrgs site project
            planned_vols.Text = string.Empty;
            planned_hrs.Text = string.Empty;
            planned_items.Text = string.Empty;

            ddlMeetingFrequency.SelectedIndex = -1;
            ddlSPOnGoingDay.SelectedIndex = -1;
            ddlNewServiceProjectOrgEncharge.SelectedIndex = -1;
            chkServiceProjectOnGoing.Checked = false;
            pnlOneTime.Visible = true;
            pnlOnGoing.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string startDate = string.Empty;
                string endDate = string.Empty;
                string timeFrom = string.Empty;
                string timeTo = string.Empty;
                string meetDay = string.Empty;
                string meetFrequency = string.Empty;

                if (chkServiceProjectOnGoing.Checked)
                {
                    startDate = txtServiceProjectStartDate.Text;
                    endDate = txtServiceProjectEndDate.Text;
                    timeFrom = txtSPOnGoingFromTime.Text;
                    timeTo = txtSPOnGoingToTime.Text;
                    if (ddlSPOnGoingDay.SelectedValue != "-1")
                    {
                        meetDay = ddlSPOnGoingDay.SelectedItem.Text;
                    }
                    if (ddlMeetingFrequency.SelectedValue != "-1")
                    {
                        meetFrequency = ddlMeetingFrequency.SelectedItem.Text;
                    }

                }
                else
                {
                    startDate = txtServiceProjectDate.Text;
                    timeFrom = txtSPOneTimeFromTime.Text;
                    timeTo = txtSPOneTimeToTime.Text;
                }

                if (ddlNewServiceProjectOrgEncharge.SelectedIndex != -1)
                {
                    bool ret;

                    ret = ServiceProjectDAO.createServiceProject(Convert.ToInt32(ddlNewServiceProjectOrgEncharge.SelectedItem.Value),
                        txtServiceProjectCP.Text.Trim(), txtServiceProjectCPName.Text.Trim(), txtServiceProjectCPPhone.Text.Trim(),
                        txtServiceProjectCPEmail.Text.Trim(), string.IsNullOrEmpty(txtServiceProjectNoOfVolunteers.Text.Trim()) ? null : txtServiceProjectNoOfVolunteers.Text.Trim(),
                        string.IsNullOrEmpty(txtServiceProjectVolunteersHours.Text.Trim()) ? null : txtServiceProjectVolunteersHours.Text.Trim(),
                        txtServiceProjectDescription.Text.Trim(), chkServiceProjectOnGoing.Checked, txtServiceProjectLocation.Text.Trim(),
                        startDate, endDate, timeFrom, timeTo, txtComments.Text, DateTime.Now.ToShortDateString(), HttpContext.Current.User.Identity.Name,
                        meetDay, meetFrequency, txtServiceProjectTitle.Text.Trim(), txtFundsRaised.Text.Trim(),
                        string.IsNullOrEmpty(planned_vols.Text.Trim()) ? 0 : Convert.ToInt32(planned_vols.Text.Trim()),
                        string.IsNullOrEmpty(planned_hrs.Text.Trim()) ? 0 : Convert.ToInt32(planned_hrs.Text.Trim()),
                        planned_items.Text.Trim());

                    if (ret)
                    {
                        clearText();
                        txtComments.Text = string.Empty;
                        tabContainerNewServiceProject.ActiveTabIndex = 0;
                    }
                    else
                    {
                        lblMessage.Text = "Service Project Could not be Created!!";
                    }
                }
                else
                {
                    lblMessage.Text = "Service Project Could not be Created!!";
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Service Project Could not be Created!!";
            }
        }
        
    }
}