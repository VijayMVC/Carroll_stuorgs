using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp.Incidents
{
    public partial class CreateIncidents : System.Web.UI.Page
    {
        IncidentDAO IncidentDAO = new IncidentDAO();
        OrganizationDAO OrganizationDAO = new OrganizationDAO();
        List<MemberList> memberList = new List<MemberList>();
        List<NonMemberList> nonMemberList = new List<NonMemberList>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tabContainerNewIncident.ActiveTabIndex = 0;
                    ddlOrganization.DataSource = OrganizationDAO.getOrganizationList();
                    ddlOrganization.DataTextField = "OrganizationName";
                    ddlOrganization.DataValueField = "Organization_ID";
                    ddlOrganization.DataBind();

                    if (ViewState["MemberList"] == null)
                    {
                        ViewState["MemberList"] = new List<MemberList>();
                    }

                    if (ViewState["NonMemberList"] == null)
                    {
                        ViewState["NonMemberList"] = new List<NonMemberList>();
                    }

                }
                grdPplInvolved.DataSource = UploadedMembers;
                grdPplInvolved.DataBind();
                grdNonMembersInvolved.DataSource = UploadedNonMembers;
                grdNonMembersInvolved.DataBind();
            }
            catch 
            {
                lblMessage.Text = "Cannot load the page!!";
            }
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerNewIncident.ActiveTabIndex;
            tabContainerNewIncident.ActiveTab = tabContainerNewIncident.Tabs[++tabIndex];
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerNewIncident.ActiveTabIndex;
            tabContainerNewIncident.ActiveTab = tabContainerNewIncident.Tabs[--tabIndex];
        }
        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearTextMain();
        }
        private void clearTextMain()
        {
            txtFollowUp.Text = string.Empty;
            txtincident.Text = string.Empty;
            txtNewIncidentDate.Text = string.Empty;
            txtNewIncidentDateReported.Text = string.Empty;
            txtNewIncidentTime.Text = string.Empty;
            txtNewIncidentReportedBy.Text = string.Empty;
            txtNewIncidentLocation.Text = string.Empty;
            txtResult.Text = string.Empty;

            ddlOrganization.SelectedIndex = -1;
            ddlSearchMember.SelectedIndex = -1;
            txtNonMemberName.Text = string.Empty;
            txtNonMemberID.Text = string.Empty;
            UploadedMembers.Clear();
            grdPplInvolved.DataBind();
            UploadedNonMembers.Clear();
            grdNonMembersInvolved.DataBind();
            lblMessage.Text = string.Empty;
            
        }
        protected void btnCancelComments_Click(object sender, EventArgs e)
        {
            clearTextComments();
        }
        private void clearTextComments()
        {
            lblMessage.Text = string.Empty;
            txtComments.Text = string.Empty;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                memberList = UploadedMembers;
                nonMemberList = UploadedNonMembers;
                IncidentDAO.createIncident(string.IsNullOrEmpty(txtNewIncidentDate.Text) ? null : txtNewIncidentDate.Text, string.IsNullOrEmpty(txtNewIncidentDateReported.Text) ? null : txtNewIncidentDateReported.Text, txtNewIncidentTime.Text,
                    txtNewIncidentLocation.Text, txtincident.Text, txtResult.Text, txtComments.Text, txtFollowUp.Text,
                    Convert.ToInt32(ddlOrganization.SelectedValue), txtNewIncidentReportedBy.Text, memberList, txtComments.Text, DateTime.Now.ToShortDateString(), HttpContext.Current.User.Identity.Name,nonMemberList);
                clearTextComments();
                clearTextMain();
                tabContainerNewIncident.ActiveTabIndex = 0;
            
            }
            catch 
            {
                lblMessage.Text = "Incident Could not be Created!!";
            }
        }
        protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
            UploadedNonMembers.Clear();
            UploadedMembers.Clear();
            ddlSearchMember.Items.Clear();
            ListItem select = new ListItem("Select For Member", "-1");
            ddlSearchMember.Items.Add(select);
            if (Convert.ToInt32(ddlOrganization.SelectedItem.Value) != -1)
            {
                int orgID = Convert.ToInt32(ddlOrganization.SelectedItem.Value);
                ddlSearchMember.DataSource = IncidentDAO.getMembersByOrgID(orgID);
                ddlSearchMember.DataTextField = "Name";
                ddlSearchMember.DataValueField = "Student_ID";
                ddlSearchMember.DataBind();
            }
            else { ddlSearchMember.SelectedIndex = -1; }
            }
            catch
            {
                lblMessage.Text = "Cannot load Members for the organization!!";
            }
        }
        protected void grdPplInvolved_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
          
        }
        protected void grdPplInvolved_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                int stuID = Convert.ToInt32(grdPplInvolved.Rows[e.RowIndex].Cells[4].Text);
                memberList = UploadedMembers;

                for (int i = 0; i < memberList.Count; ++i)
                {
                    if (memberList[i].Student_ID == stuID)
                    {
                        //memberList.RemoveAt(i);
                        UploadedMembers.RemoveAt(i);
                    }
                }
                grdPplInvolved.DataBind();
            }
        
            catch 
            {
                lblMessage.Text = "Was not able to remove the member!!";
            }
        }

        protected void grdNonMembersInvolved_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                string ID = grdNonMembersInvolved.Rows[e.RowIndex].Cells[1].Text;
                nonMemberList = UploadedNonMembers;

                for (int i = 0; i < nonMemberList.Count; ++i)
                {
                    if (nonMemberList[i].ID == ID)
                    {
                        //memberList.RemoveAt(i);
                        UploadedNonMembers.RemoveAt(i);
                    }
                }
                grdNonMembersInvolved.DataBind();
            }

            catch
            {
                lblMessage.Text = "Was not able to remove the non member!!";
            }
        }

        protected void btnAddMember_Click1(object sender, EventArgs e)
        {
            try
            {
                memberList = UploadedMembers;
                MemberList member = IncidentDAO.getMembersByStudID(Convert.ToInt32(ddlSearchMember.SelectedItem.Value));
                member.Student_ID = Convert.ToInt32(ddlSearchMember.SelectedItem.Value);
                UploadedMembers.Add(member);
                grdPplInvolved.DataBind();
                ddlSearchMember.SelectedIndex = -1;
            }
            catch
            {
                lblMessage.Text = "Was not able to add the member!!";
            }
        }

        protected void btnAddNonMember_Click(object sender, EventArgs e)
        {
            try
            {
                nonMemberList = UploadedNonMembers;
                NonMemberList member = new NonMemberList();
                member.Name = txtNonMemberName.Text;
                member.ID = txtNonMemberID.Text;
                UploadedNonMembers.Add(member);
                grdNonMembersInvolved.DataBind();
                txtNonMemberID.Text = string.Empty;
                txtNonMemberName.Text = string.Empty;
            }
            catch
            {
                lblMessage.Text = "Was not able to add the non member!!";
            }
        } 

        public List<MemberList> UploadedMembers
        {
            get
            {
                var list = (List<MemberList>)(ViewState["MemberList"] ??
                    new List<MemberList>());
                ViewState["MemberList"] = list;
                return list;
            }
            set
            {
                ViewState["MemberList"] = value;
            }
        }

        public List<NonMemberList> UploadedNonMembers
        {
            get
            {
                var list = (List<NonMemberList>)(ViewState["NonMemberList"] ??
                    new List<NonMemberList>());
                ViewState["NonMemberList"] = list;
                return list;
            }
            set
            {
                ViewState["NonMemberList"] = value;
            }
        }

        protected void grdPplInvolved_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[4].Visible = false;              
            }
        }
       

      
    }
}