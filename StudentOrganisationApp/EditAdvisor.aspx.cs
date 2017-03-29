using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp.Advisor
{
    public partial class EditAdvisor : System.Web.UI.Page
    {
        AdvisorDAO AdvisorDAO = new AdvisorDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ddlSelectAdvisor.DataSource = AdvisorDAO.getAdvisorList();
                    ddlSelectAdvisor.DataTextField = "Name";
                    ddlSelectAdvisor.DataValueField = "AdvisorID";
                    ddlSelectAdvisor.DataBind();
                }
            }
            catch (Exception exp)
            {
                lblMessage.Text = "Could Not load Advisor List!!";
            }
        }

        private void clearText()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtEmailID.Text = string.Empty;
            rblAdvisorType.ClearSelection();
            pnlEditing.Visible = false;
            ddlSelectAdvisor.SelectedIndex = 0;
            txtProfessionalTitle.Text = string.Empty;
            txtAdvisorTitle.Text = string.Empty;
            grdOrganization.DataSource = null;
            lblMessage.Text = string.Empty;
            lblAdvisorName.Visible = false;
            lblAdvisorName.Text = string.Empty;
           
            pnlSelection.Visible = true;
        }


        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(ddlSelectAdvisor.SelectedItem.Value) != -1)
                {
                    pnlSelection.Visible = false;
                    pnlEditing.Visible = true;

                    int advID = Convert.ToInt32(ddlSelectAdvisor.SelectedItem.Value);
                    App_Data.Advisor advisorForEdit = AdvisorDAO.getAdvisorByID(advID);
                    lblAdvisorName.Text = advisorForEdit.FirstName + " " + advisorForEdit.LastName;
                    txtEmailID.Text = advisorForEdit.Email;
                    txtPhoneNumber.Text = advisorForEdit.PhoneNumber.ToString();
                    txtFirstName.Text = advisorForEdit.FirstName;
                    txtLastName.Text = advisorForEdit.LastName;
                    txtAdvisorTitle.Text = advisorForEdit.AdvisorTitle;
                    txtProfessionalTitle.Text = advisorForEdit.ProfessionalTitle;

                    if (advisorForEdit.OffCampus == true)
                    {
                        rblAdvisorType.SelectedIndex = 1;
                    }
                    else if (advisorForEdit.OffCampus == false)
                    {
                        rblAdvisorType.SelectedIndex = 0;
                    }

                    grdOrganization.DataSource = AdvisorDAO.getOrganizationForAdvisor(advID);
                    grdOrganization.DataBind();
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Retrieve Advisor Details!!";
            }
        }

        protected void btnEditAdvisor_Click(object sender, EventArgs e)
        {
            try
            {
                int advID = Convert.ToInt32(ddlSelectAdvisor.SelectedItem.Value);


                bool offCampus = true;
                if (rblAdvisorType.SelectedItem.Value.ToString() == "Carroll Advisor")
                {
                    offCampus = false;
                }
                else if (rblAdvisorType.SelectedItem.Value.ToString() == "Community Advisor")
                {
                    offCampus = true;
                }

                bool Updated = AdvisorDAO.updateAdvisor(advID, txtLastName.Text, txtFirstName.Text, txtEmailID.Text, txtPhoneNumber.Text, offCampus, txtAdvisorTitle.Text, txtProfessionalTitle.Text);

                clearText();
            }

            catch (Exception)
            {
                lblMessage.Text = "Advisor Details Not Edited!!";
            }
        }
    }
}