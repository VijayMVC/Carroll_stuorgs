using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp.SetUp
{
    public partial class EditOrganizationCategory : System.Web.UI.Page
    {
        Data_Access.OrgcategoryDAO OrgcategoryDAO = new Data_Access.OrgcategoryDAO();
        private void clearText()
        {
            txtEditOrgCatName.Text = string.Empty;
            txtCategoryDesc.Text = string.Empty;
            txtExtenderEndDate.Text = string.Empty;
            txtOrgCatAddDate.Text = string.Empty;
            chkGreekOrg.Checked = false;
            pnlEditing.Visible = false;
            ddlSelectOrgCategory.SelectedIndex = -1;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddlSelectOrgCategory.DataSource = OrgcategoryDAO.getOrgCategoryList();
                    ddlSelectOrgCategory.DataTextField = "CategoryName";
                    ddlSelectOrgCategory.DataValueField = "Category_ID";
                    ddlSelectOrgCategory.DataBind();
                }
                catch (Exception)
                {
                    lblMessage.Text = "Could Not load Category List";                
                }
            }    

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {

                if (Convert.ToInt32(ddlSelectOrgCategory.SelectedItem.Value) != -1)
                {
                    pnlEditing.Visible = true;
                    ddlSelectOrgCategory.Enabled = false;


                    App_Data.OrgCategory orgcategoryForEdit = OrgcategoryDAO.getOrgCategoryByID(Convert.ToInt32(ddlSelectOrgCategory.SelectedItem.Value));

                    txtEditOrgCatName.Text = orgcategoryForEdit.CategoryName;
                    txtCategoryDesc.Text = orgcategoryForEdit.Description;
                    chkGreekOrg.Checked = (bool)orgcategoryForEdit.GreekOrg;
                    if (orgcategoryForEdit.AddDate == null)
                    {
                        txtOrgCatAddDate.Text = string.Empty;
                    }
                    else
                        txtOrgCatAddDate.Text = Convert.ToDateTime(orgcategoryForEdit.AddDate).ToShortDateString();
                    if (orgcategoryForEdit.EndDate == null)
                    {
                        txtExtenderEndDate.Text = string.Empty;
                    }
                    else
                        txtExtenderEndDate.Text = Convert.ToDateTime(orgcategoryForEdit.EndDate).ToShortDateString();
                }
            }

            catch (Exception)
            {
                lblMessage.Text = "Could Not Retrieve Category Details!!";
            }
        }

        protected void btnUpdateOrgCategory_Click(object sender, EventArgs e)
        {
            try
            {
                int catID = Convert.ToInt32(ddlSelectOrgCategory.SelectedItem.Value);

                bool Updated = OrgcategoryDAO.updateOrgCategory(catID, txtEditOrgCatName.Text, txtCategoryDesc.Text, string.IsNullOrEmpty(txtOrgCatAddDate.Text) ? null : txtOrgCatAddDate.Text, string.IsNullOrEmpty(txtExtenderEndDate.Text) ? null : txtExtenderEndDate.Text, chkGreekOrg.Checked);

                clearText();
                ddlSelectOrgCategory.Enabled = true;
            }
            catch (Exception exp)
            {
                lblMessage.Text = "Catergory Details Not Edited!!";
            }
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();
            ddlSelectOrgCategory.Enabled = true;
        }
    }
}