using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using System.Collections;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp
{
    public partial class EditServiceProject : System.Web.UI.Page
    {
        OrganizationDAO OrganizationDAO = new OrganizationDAO();
        ServiceProjectDAO ServiceProjectDAO = new ServiceProjectDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tabContainerEditSP.ActiveTabIndex = 0;

                    ddlSelectOrganization.DataSource = OrganizationDAO.getOrganizationList();
                    ddlSelectOrganization.DataTextField = "OrganizationName";
                    ddlSelectOrganization.DataValueField = "Organization_ID";
                    ddlSelectOrganization.DataBind();
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to load organization list!!";
            }
        }
        protected void btnGoOrg_Click(object sender, EventArgs e)
        {
            try
            {
                btnCancelAll.Visible = true;
                int orgid = Convert.ToInt32(ddlSelectOrganization.SelectedValue);

                gridServiceProject.DataSource = ServiceProjectDAO.getServiceProjectByOrgIDDate(orgid);
                gridServiceProject.DataBind();
            }
            catch (Exception)
            {
            }
        }

        public ServiceProject getCurrentServiceProject()
        {
            ServiceProject project = new ServiceProject();
            try
            {
                int idservice = Convert.ToInt32(lblServiceProjectID.Text);

                project = ServiceProjectDAO.getServiceProjectByID(idservice);
            }
            catch (Exception)
            {
            }
            return project;
        }

        private void PopulateInformationServiceProject()
        {
            pnlSelection.Visible = false;
            pnlEditing.Visible = true;

            try
            {
                App_Data.ServiceProject SPForEdit = getCurrentServiceProject();

                int service_id = SPForEdit.ServiceProject_ID;
                string title = SPForEdit.Title.Trim();
                int? no_vol = SPForEdit.NoOfVolunteers;
                decimal? no_volhrs = SPForEdit.HoursVolunteered;
                string desc = SPForEdit.Description.Trim();
                string loc = SPForEdit.Location.Trim();
                string partner = SPForEdit.CommunityPartner.Trim();
                string name = SPForEdit.ContactName.Trim();
                string ph = SPForEdit.ContactPhone.Trim();
                string email = SPForEdit.ContactEmail.Trim();
                string funds = SPForEdit.Funds.Trim();
                string planned_funds = SPForEdit.Planned_Funds.Trim();

                if (title == null)
                {
                    txtServiceProjectTitle.Text = "";
                }
                else
                {
                    txtServiceProjectTitle.Text = title;
                }

                if (no_vol.ToString() == null)
                {
                    txtServiceProjectNoOfVolunteers.Text = "";
                }
                else
                {
                    txtServiceProjectNoOfVolunteers.Text = no_vol.ToString();
                }

                if (no_volhrs.ToString() == null)
                {
                    txtServiceProjectVolunteersHours.Text = "";
                }
                else
                {
                    txtServiceProjectVolunteersHours.Text = no_volhrs.ToString();
                }

                if (desc == null)
                {
                    txtServiceProjectDescription.Text = "";
                }
                else
                {
                    txtServiceProjectDescription.Text = desc;
                }

                if (loc == null)
                {
                    txtServiceProjectLocation.Text = "";
                }
                else
                {
                    txtServiceProjectLocation.Text = loc;
                }

                if (partner == null)
                {
                    txtServiceProjectCP.Text = "";
                }
                else
                {
                    txtServiceProjectCP.Text = partner;
                }

                if (name == null)
                {
                    txtServiceProjectCPName.Text = "";
                }
                else
                {
                    txtServiceProjectCPName.Text = name;
                }

                if (ph == null)
                {
                    txtServiceProjectCPPhone.Text = "";
                }
                else
                {
                    txtServiceProjectCPPhone.Text = ph;
                }

                if (email == null)
                {
                    txtServiceProjectCPEmail.Text = "";
                }
                else
                {
                    txtServiceProjectCPEmail.Text = email;
                }

                if (funds == null)
                {
                    txtFundsRaised.Text = "";
                }
                else
                {
                    txtFundsRaised.Text = funds;
                }

                //added 8.12.2016 - as part of MyOrgs site project. can't be null values
                planned_vols.Text = SPForEdit.Planned_NoOfVolunteers.ToString();
                planned_hrs.Text = SPForEdit.Planned_HoursVolunteered.ToString();

                if (planned_funds == null)
                {
                    planned_items.Text = "";
                }
                else
                {
                    planned_items.Text = planned_funds;
                }

                //Bind Comments to grid
                grdComments.DataSource = ServiceProjectDAO.getCommentsBySPID(service_id);
                grdComments.DataBind();

                ddlNewServiceProjectOrgEncharge.DataSource = OrganizationDAO.getOrganizationList();
                ddlNewServiceProjectOrgEncharge.DataTextField = "OrganizationName";
                ddlNewServiceProjectOrgEncharge.DataValueField = "Organization_ID";
                ddlNewServiceProjectOrgEncharge.DataBind();
                ddlNewServiceProjectOrgEncharge.SelectedValue = SPForEdit.Organization_ID.ToString();

                bool? ongoing = SPForEdit.OnGoing;

                if (ongoing == true)
                {
                    chkServiceProjectOnGoing.Checked = true;
                    pnlOnGoing.Visible = true;
                    pnlOneTime.Visible = false;

                    DateTime? start = SPForEdit.StartDate;
                    if (start == null)
                    {
                        txtSPOnGoingFromTime.Text = "";
                    }
                    else
                    {
                        txtServiceProjectStartDate.Text = Convert.ToDateTime(SPForEdit.StartDate).ToShortDateString();
                    }

                    DateTime? end = SPForEdit.EndDate;
                    if (end == null)
                    {
                        txtSPOnGoingFromTime.Text = "";
                    }
                    else
                    {
                        txtServiceProjectEndDate.Text = Convert.ToDateTime(SPForEdit.EndDate).ToShortDateString();
                    }

                    if (SPForEdit.TimeFrom.Trim() == null)
                    {
                        txtSPOnGoingFromTime.Text = "";
                    }
                    else
                    {
                        txtSPOnGoingFromTime.Text = SPForEdit.TimeFrom.Trim();
                    }

                    if (SPForEdit.TimeTo.Trim() == null)
                    {
                        txtSPOnGoingToTime.Text = "";
                    }
                    else
                    {
                        txtSPOnGoingToTime.Text = SPForEdit.TimeTo.Trim();
                    }

                    string value = "-1";
                    if (SPForEdit.MeetDay == null || SPForEdit.MeetDay == string.Empty)
                    {
                        ddlSPOnGoingDay.Items.FindByValue("-1").Selected = true;
                    }
                    else
                    {
                        value = ddlSPOnGoingDay.Items.FindByText(SPForEdit.MeetDay).Value;
                        ddlSPOnGoingDay.SelectedValue = value;
                    }

                    if (SPForEdit.MeetFrequency == null || SPForEdit.MeetFrequency == string.Empty)
                    {
                        ddlMeetingFrequency.Items.FindByValue("-1").Selected = true;
                    }
                    else
                    {
                        value = ddlMeetingFrequency.Items.FindByText(SPForEdit.MeetFrequency).Value;
                        ddlMeetingFrequency.SelectedValue = value;
                    }
                }
                else
                {
                    chkServiceProjectOnGoing.Checked = false;
                    pnlOnGoing.Visible = false;
                    pnlOneTime.Visible = true;
                    txtServiceProjectDate.Text = Convert.ToDateTime(SPForEdit.StartDate).ToShortDateString();
                    txtSPOneTimeFromTime.Text = SPForEdit.TimeFrom;
                    txtSPOneTimeToTime.Text = SPForEdit.TimeTo;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Service Project data!!";
            }
        }

       
        protected void btnSPContinue_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditSP.ActiveTabIndex;
            tabContainerEditSP.ActiveTab = tabContainerEditSP.Tabs[++tabIndex];
        }

        protected void btnBackComments_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditSP.ActiveTabIndex;
            tabContainerEditSP.ActiveTab = tabContainerEditSP.Tabs[--tabIndex];
        }

        protected void btnCancelComments_Click(object sender, EventArgs e)
        {
            txtComments.Text = string.Empty;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtComments.Text != string.Empty)
                {
                    string today = DateTime.Now.ToString();
                    if (today.IndexOf(" A") != -1)
                    {
                        today = today.Replace(" A", "A");
                    }
                    if (today.IndexOf(" P") != -1)
                    {
                        today = today.Replace(" P", "P");
                    }

                    //ToDo - Use a viewstate variable to store the Service project ID
                    App_Data.ServiceProject SPForEdit = getCurrentServiceProject();

                    ServiceProjectDAO.createServiceProjectComment(txtComments.Text, SPForEdit.ServiceProject_ID, today, HttpContext.Current.User.Identity.Name);

                    grdComments.DataSource = ServiceProjectDAO.getCommentsBySPID(SPForEdit.ServiceProject_ID);
                    grdComments.DataBind();
                    txtComments.Text = string.Empty;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Comment not added!!";
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

        protected void clearAlltext()
        {

            pnlEditing.Visible = false;
            pnlSelection.Visible = true;

            lblServiceProjectID.Text = string.Empty;
            lblNameOrganization.Text = string.Empty;

            ddlSPOnGoingDay.SelectedIndex = -1;
            ddlMeetingFrequency.SelectedIndex = -1;
            ddlNewServiceProjectOrgEncharge.Items.Clear();

            txtServiceProjectCP.Text = string.Empty;
            txtServiceProjectTitle.Text = string.Empty;
            txtServiceProjectCPName.Text = string.Empty;
            txtServiceProjectCPPhone.Text = string.Empty;
            txtServiceProjectCPEmail.Text = string.Empty;
            txtServiceProjectNoOfVolunteers.Text = string.Empty;
            txtServiceProjectVolunteersHours.Text = string.Empty;
            txtServiceProjectDescription.Text = string.Empty;
            txtServiceProjectLocation.Text = string.Empty;
            txtServiceProjectStartDate.Text = string.Empty;
            txtServiceProjectEndDate.Text = string.Empty;
            txtSPOnGoingFromTime.Text = string.Empty;
            txtSPOnGoingToTime.Text = string.Empty;
            txtServiceProjectDate.Text = string.Empty;
            txtSPOneTimeFromTime.Text = string.Empty;
            txtSPOneTimeToTime.Text = string.Empty;
            txtFundsRaised.Text = string.Empty;

            //added 8.12.2016 - as part of MyOrgs site project
            planned_vols.Text = string.Empty;
            planned_hrs.Text = string.Empty;
            planned_items.Text = string.Empty;

            chkServiceProjectOnGoing.Checked = false;
            pnlOneTime.Visible = true;
            pnlOnGoing.Visible = false;

            txtComments.Text = string.Empty;

        }

        protected void btnCancelAll_Click(object sender, EventArgs e)
        {
            clearAlltext();
        }

        protected void btnEditSPCancel_Click(object sender, EventArgs e)
        {
            PopulateInformationServiceProject();
        }

        protected void btnSubmitAll_Click(object sender, EventArgs e)
        {
            try
            {
                App_Data.ServiceProject SPForEdit = getCurrentServiceProject();

                if (txtComments.Text != string.Empty)
                {
                    string today = DateTime.Now.ToString();
                    if (today.IndexOf(" A") != -1)
                    {
                        today = today.Replace(" A", "A");

                    }
                    if (today.IndexOf(" P") != -1)
                    {
                        today = today.Replace(" P", "P");
                    }
                    ServiceProjectDAO.createServiceProjectComment(txtComments.Text, SPForEdit.ServiceProject_ID, today, HttpContext.Current.User.Identity.Name);
                    grdComments.DataSource = ServiceProjectDAO.getCommentsBySPID(SPForEdit.ServiceProject_ID);
                    grdComments.DataBind();
                    txtComments.Text = string.Empty;
                }

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

                //8.12.2016 - added planning fields as part of MyOrgs site project
                ServiceProjectDAO.updateServiceProject(SPForEdit.ServiceProject_ID, Convert.ToInt32(ddlNewServiceProjectOrgEncharge.SelectedItem.Value),
                txtServiceProjectCP.Text.Trim(), txtServiceProjectCPName.Text.Trim(), txtServiceProjectCPPhone.Text.Trim(),
                txtServiceProjectCPEmail.Text.Trim(), string.IsNullOrEmpty(txtServiceProjectNoOfVolunteers.Text.Trim()) ? null : txtServiceProjectNoOfVolunteers.Text.Trim(),
                string.IsNullOrEmpty(txtServiceProjectVolunteersHours.Text.Trim()) ? null : txtServiceProjectVolunteersHours.Text.Trim(),
                txtServiceProjectDescription.Text.Trim(),chkServiceProjectOnGoing.Checked, txtServiceProjectLocation.Text.Trim(),
                startDate, endDate, timeFrom, timeTo, meetDay, meetFrequency, txtServiceProjectTitle.Text.Trim(), txtFundsRaised.Text.Trim(),
                string.IsNullOrEmpty(planned_vols.Text.Trim()) ? 0 : Convert.ToInt32(planned_vols.Text.Trim()),
                string.IsNullOrEmpty(planned_hrs.Text.Trim()) ? 0 : Convert.ToDecimal(planned_hrs.Text.Trim()),
                planned_items.Text.Trim());


                clearAlltext();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!! " + ex.ToString();
            }            
        }

        protected void gridServiceProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataControlFieldCell value = (DataControlFieldCell)gridServiceProject.SelectedRow.Cells[0];
                DataControlFieldCell value2 = (DataControlFieldCell)gridServiceProject.SelectedRow.Cells[1];
                lblServiceProjectID.Text = value.Text;
                lblNameOrganization.Text = value2.Text;

                int idservice = Convert.ToInt32(lblServiceProjectID.Text);
                if (idservice != 0)
                    PopulateInformationServiceProject();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Grid Error!! " + ex.ToString();
            }            
        }

        protected void bntDeleteAll_Click(object sender, EventArgs e)
        {
            App_Data.ServiceProject SPForEdit = getCurrentServiceProject();
            ServiceProjectDAO.deleteServiceProject(SPForEdit.ServiceProject_ID);

            clearAlltext();

            //we need to re-retrieve the gridServiceProject list after the delete.
            int orgid = Convert.ToInt32(ddlSelectOrganization.SelectedValue);
            gridServiceProject.DataSource = ServiceProjectDAO.getServiceProjectByOrgIDDate(orgid);
            gridServiceProject.DataBind();
        }
    }
}