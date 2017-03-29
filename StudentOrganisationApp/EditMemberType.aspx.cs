using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp.SetUp
{
    public partial class EditMemberType : System.Web.UI.Page
    {
        Data_Access.MemberTypeDAO MemberTypeDAO = new Data_Access.MemberTypeDAO();
        private void clearText()
        {
            txtEditMemTypeName.Text = string.Empty;
            txtMemberDesc.Text = string.Empty;
            txtExtenderEditMemType.Text = string.Empty;
            txtMemTypeAddDate.Text = string.Empty;
            chkBroadMember.Checked = false;
            pnlEditing.Visible = false;
            ddlSelectMemberType.SelectedIndex = -1;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddlSelectMemberType.DataSource = MemberTypeDAO.getMemberTypeList();
                    ddlSelectMemberType.DataTextField = "MemberName";
                    ddlSelectMemberType.DataValueField = "Member_ID";
                    ddlSelectMemberType.DataBind();
                }
                catch (Exception exp)
                {
                    lblMessage.Text = "Could Not load Member Type List!!";
                }
            }     
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(ddlSelectMemberType.SelectedItem.Value) != -1)
                {
                    pnlEditing.Visible = true;
                    ddlSelectMemberType.Enabled = false;


                    App_Data.MemberType memberTypeForEdit = MemberTypeDAO.getMemberTypeByID(Convert.ToInt32(ddlSelectMemberType.SelectedItem.Value));

                    txtEditMemTypeName.Text = memberTypeForEdit.MemberName;
                    txtMemberDesc.Text = memberTypeForEdit.Description;
                    chkBroadMember.Checked = (bool)memberTypeForEdit.BoardMember;
                    if (memberTypeForEdit.AddDate == null)
                    {
                        txtMemTypeAddDate.Text = string.Empty;
                    }
                    else
                        txtMemTypeAddDate.Text = Convert.ToDateTime(memberTypeForEdit.AddDate).ToShortDateString();
                    if (memberTypeForEdit.EndDate == null)
                    {
                        txtExtenderEditMemType.Text = string.Empty;
                    }
                    else
                        txtExtenderEditMemType.Text = Convert.ToDateTime(memberTypeForEdit.EndDate).ToShortDateString();
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Retrieve Member Type Details!!";
            }
            
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();
            ddlSelectMemberType.Enabled = true;
        }

        protected void btnUpdateMemberType_Click(object sender, EventArgs e)
        {
            try
            {
                int memID = Convert.ToInt32(ddlSelectMemberType.SelectedItem.Value);

                bool Updated = MemberTypeDAO.updateMemberType(memID, txtEditMemTypeName.Text, txtMemberDesc.Text, string.IsNullOrEmpty(txtMemTypeAddDate.Text) ? null : txtMemTypeAddDate.Text, string.IsNullOrEmpty(txtExtenderEditMemType.Text) ? null : txtExtenderEditMemType.Text, chkBroadMember.Checked);

                clearText();
                ddlSelectMemberType.Enabled = true;
            }
            catch (Exception)
            {
                lblMessage.Text = "Member Type Details Not Edited!!";
            }
        }
    }
}