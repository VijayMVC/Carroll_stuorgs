using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp.SetUp
{
    public partial class CreateMemberType : System.Web.UI.Page
    {
        Data_Access.MemberTypeDAO MemberTypeDAO = new Data_Access.MemberTypeDAO();
        private void clearText()
        {
            txtNewMemTypeName.Text = string.Empty;
            txtMemberDesc.Text = string.Empty;
            txtExtenderNewMemType.Text = string.Empty;
            chkBroadMember.Checked = false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();
        }

        protected void btnAddMemberType_Click(object sender, EventArgs e)
        {
            try
            {
                bool Created = MemberTypeDAO.createMemberType(txtNewMemTypeName.Text, txtMemberDesc.Text, string.IsNullOrEmpty(txtExtenderNewMemType.Text) ? null : txtExtenderNewMemType.Text, null, chkBroadMember.Checked);
                clearText();
                if(!Created)
                    lblMessage.Text = "Member Type not added!!";
            }
            catch (Exception)
            {
                lblMessage.Text = "Member Type not added!!";
            }
        }
    }
}