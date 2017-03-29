using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp.SetUp
{
    public partial class CreateRequiredEvent : System.Web.UI.Page
    {
        Data_Access.RequiredEventDAO RequiredEventDAO = new Data_Access.RequiredEventDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();
        }

        protected void btnAddRequiredEvent_Click(object sender, EventArgs e)
        {
            try
            {
                bool Created = RequiredEventDAO.createRequiredEvent(txtRequiredEvent.Text, txtEventNotes.Text, txtExtenderRequiredEvent.Text);
                clearText();
                if(!Created)
                    lblMessage.Text = "Requirement Not added!!";
            }
            catch (Exception)
            {
                lblMessage.Text = "Requirement Not added!!";
            }
        }
        private void clearText()
        {
            txtEventNotes.Text = string.Empty;
            txtRequiredEvent.Text = string.Empty;
            txtExtenderRequiredEvent.Text = string.Empty;
        
        }
    }
}