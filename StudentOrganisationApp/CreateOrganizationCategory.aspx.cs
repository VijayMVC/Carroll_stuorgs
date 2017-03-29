using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp.SetUp
{
    public partial class CreateOrganizationCategory : System.Web.UI.Page
    {
        Data_Access.OrgcategoryDAO OrgcategoryDAO = new Data_Access.OrgcategoryDAO();
        private void clearText()
        {
            txtNewOrgCatName.Text = string.Empty;
            txtCategoryDesc.Text = string.Empty;
            txtExtenderNewOrgCat.Text = string.Empty;
            chkGreekOrg.Checked = false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();
        }

        protected void btnAddOrgCategory_Click(object sender, EventArgs e)
        {
            try
            {
                bool Created = OrgcategoryDAO.createOrgCategory(txtNewOrgCatName.Text, txtCategoryDesc.Text, string.IsNullOrEmpty(txtExtenderNewOrgCat.Text) ? null : txtExtenderNewOrgCat.Text, null, chkGreekOrg.Checked);
                clearText();
                if (!Created)
                    lblMessage.Text = "Organization Category not added!!";
            }
            catch (Exception)
            {
                lblMessage.Text = "Organization Category not added!!";
            }
        }
    }
}