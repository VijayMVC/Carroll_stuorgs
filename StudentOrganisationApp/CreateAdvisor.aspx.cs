using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp.Advisor
{
    public partial class CreateAdvisor : System.Web.UI.Page
    {
        Data_Access.AdvisorDAO AdvisorDAO = new AdvisorDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void clearText()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtEmailID.Text = string.Empty;
            rblAdvisorType.ClearSelection();
            txtAdvisorTitle.Text = string.Empty;
            txtProfessionalTitle.Text = string.Empty;
            lblMessage.Text = string.Empty;
        }

        protected void btnAddAdvisor_Click(object sender, EventArgs e)
        {
            try
                {
                    bool offCampus = true;
                    if (rblAdvisorType.SelectedItem.Value.ToString() == "Carroll Advisor")
                    {
                        offCampus = false;
                    }
                    else if (rblAdvisorType.SelectedItem.Value.ToString() == "Community Advisor")
                    {
                        offCampus = true;
                    }

                    bool Created = AdvisorDAO.createAdvisor(txtLastName.Text, txtFirstName.Text, txtEmailID.Text, txtPhoneNumber.Text, offCampus, txtAdvisorTitle.Text, txtProfessionalTitle.Text);
                    clearText();
                    if (!Created)
                        lblMessage.Text = "Advisor not added!!";
                }
                catch (Exception exp)
                {
                    lblMessage.Text = "Advisor not added!!";
                }
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();         
        }
    }
}