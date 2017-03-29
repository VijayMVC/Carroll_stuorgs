using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp.Organization
{
    public partial class EditIncidents : System.Web.UI.Page
    {
        OrganizationDAO OrganizationDAO = new OrganizationDAO();
        IncidentDAO IncidentDAO = new IncidentDAO();
        List<MemberList> memberList = new List<MemberList>();
        List<NonMemberList> nonMemberList = new List<NonMemberList>();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tabContainerEditIncident.ActiveTabIndex = 0;
                    ddlSelectOrganization.DataSource = OrganizationDAO.getOrganizationList();
                    ddlSelectOrganization.DataTextField = "OrganizationName";
                    ddlSelectOrganization.DataValueField = "Organization_ID";
                    ddlSelectOrganization.DataBind();
                    ddlOrganization.DataSource = OrganizationDAO.getOrganizationList();
                    ddlOrganization.DataTextField = "OrganizationName";
                    ddlOrganization.DataValueField = "Organization_ID";
                    ddlOrganization.DataBind();
                    if (ViewState["MemberListEdit"] == null)
                    {
                        ViewState["MemberListEdit"] = new List<MemberList>();
                    }
                    if (ViewState["NonMemberListEdit"] == null)
                    {
                        ViewState["NonMemberListEdit"] = new List<NonMemberList>();
                    }
                }
                grdPplInvolved.DataSource = UploadedMembers;
                grdPplInvolved.DataBind();

                grdNonMembersInvolved.DataSource = UploadedNonMembers;
                grdNonMembersInvolved.DataBind();

            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to load organization list!!";
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditIncident.ActiveTabIndex;
            tabContainerEditIncident.ActiveTab = tabContainerEditIncident.Tabs[++tabIndex];
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditIncident.ActiveTabIndex;
            tabContainerEditIncident.ActiveTab = tabContainerEditIncident.Tabs[--tabIndex];
        }

        protected void btnGoDate_Click(object sender, EventArgs e)
        {
            //int status = 0;
            try
            {
                int idorg;
                int.TryParse(ddlSelectOrganization.SelectedValue, out idorg);

                gridIncidents.DataSource = IncidentDAO.getIncidentByOrgID(idorg);
                gridIncidents.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the incidents data!!";
            }
        }

        private App_Data.Incident getCurrentIncident()
        {
            int idorg;
            int.TryParse(lblIncidentId.Text, out idorg);
            if(idorg != 0)
            {
                return IncidentDAO.sp_GetIncidentByID(idorg);
            }
            else
                return null;
        }

        private void PopulateInformationIncident()
        {
            try
            {
                pnlEditing.Visible = true;
                pnlSelection.Visible = false;

                UploadedMembers.Clear();
                UploadedNonMembers.Clear();
                ddlSearchMember.Items.Clear();
                ListItem select = new ListItem("Select For Member", "-1");
                ddlSearchMember.Items.Add(select);

                   if (Convert.ToInt32(ddlSelectOrganization.SelectedIndex) != -1)
                {
                    int orgID = Convert.ToInt32(ddlSelectOrganization.SelectedValue);
                    ddlSearchMember.DataSource = IncidentDAO.getMembersByOrgID(orgID);
                    ddlSearchMember.DataTextField = "Name";
                    ddlSearchMember.DataValueField = "Student_ID";
                    ddlSearchMember.DataBind();
                }
                else { ddlSearchMember.SelectedIndex = -1; }
                //ddlSelectDate.Items.Clear();
                //ListItem selectdate = new ListItem("Select Date", "-1");
                //ddlSelectDate.Items.Add(selectdate);

                //ddlSelectDate.Visible = true;

                //ddlSelectDate.DataSource = IncidentDAO.getIncidentDateByOrgID(Convert.ToInt32(ddlSelectOrganization.SelectedValue));
                //ddlSelectDate.DataTextField = "SDate";
                //ddlSelectDate.DataValueField = "Date";
                //ddlSelectDate.DataBind();

             
                ////////////////////////////////////////////////////////////////////
                Incident incidentForEdit = getCurrentIncident();

                txtEditIncidentDate.Text = Convert.ToDateTime(incidentForEdit.Date).ToShortDateString();
                if (incidentForEdit.DateReported == null)
                {
                    txtEditIncidentDateReported.Text = string.Empty;
                }
                else
                    txtEditIncidentDateReported.Text = Convert.ToDateTime(incidentForEdit.DateReported).ToShortDateString();

                txtEditIncidentLocation.Text = incidentForEdit.Location;
                txtEditIncidentTime.Text = incidentForEdit.Time;
                txtEditIncidentReportedBy.Text = incidentForEdit.ReportedBy;
                txtFollowUp.Text = incidentForEdit.FollowUp;
                txtResult.Text = incidentForEdit.Result;
                txtincident.Text = incidentForEdit.Incident1;

                //bind the grd to members for the incident
                UploadedMembers = IncidentDAO.getPeopleInvoluvedForIncident(incidentForEdit.Incident_ID);
                grdPplInvolved.DataSource = UploadedMembers;
                grdPplInvolved.DataBind();

                //bind the grd with nonmembers                    
                UploadedNonMembers = IncidentDAO.getNonMembersInvoluvedForIncident(incidentForEdit.Incident_ID);
                grdNonMembersInvolved.DataSource = UploadedNonMembers;
                grdNonMembersInvolved.DataBind();

                ddlOrganization.SelectedValue = incidentForEdit.Organization_ID.ToString();

                //Bind Comments to grid
                grdComments.DataSource = IncidentDAO.getCommentsByIncidentID(incidentForEdit.Incident_ID);
                grdComments.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the incidents data!!";
            }
        }

        protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
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

        public List<MemberList> UploadedMembers
        {
            get
            {
                var list = (List<MemberList>)(ViewState["MemberListEdit"] ??
                    new List<MemberList>());
                ViewState["MemberListEdit"] = list;
                return list;
            }
            set
            {
                ViewState["MemberListEdit"] = value;
            }
        }

        public List<NonMemberList> UploadedNonMembers
        {
            get
            {
                var list = (List<NonMemberList>)(ViewState["NonMemberListEdit"] ??
                    new List<NonMemberList>());
                ViewState["NonMemberListEdit"] = list;
                return list;
            }
            set
            {
                ViewState["NonMemberListEdit"] = value;
            }
        }


        protected void grdPplInvolved_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[4].Visible = false;               
            }
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
                        UploadedMembers.RemoveAt(i);
                    }
                }
                grdPplInvolved.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to delete the member!!";
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

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            try
            {
                MemberList member = IncidentDAO.getMembersByStudID(Convert.ToInt32(ddlSearchMember.SelectedItem.Value));
                member.Student_ID = Convert.ToInt32(ddlSearchMember.SelectedItem.Value);
                UploadedMembers.Add(member);
                grdPplInvolved.DataBind();
                ddlSearchMember.SelectedIndex = -1;
            }
            catch (Exception)
            {
                lblMessage.Text = "Member not added!!";
            }
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            try
            {
                UploadedMembers.Clear();
                UploadedNonMembers.Clear();
                pnlEditing.Visible = true;
                btnCanelAll.Visible = true;
                btnSubmitAll.Visible = true;
                //ddlSelectDate.Enabled = false;
                PopulateInformationIncident();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the incidents data!!";
            }
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
                    // string Date = string.Format("{0} {1}", today.ToShortDateString(), today.ToLongTimeString());
                    App_Data.Incident incidentForEdit = getCurrentIncident();
                    IncidentDAO.createIncidentComment(txtComments.Text, incidentForEdit.Incident_ID, today, HttpContext.Current.User.Identity.Name);
                    grdComments.DataSource = IncidentDAO.getCommentsByIncidentID(incidentForEdit.Incident_ID);
                    grdComments.DataBind();
                    txtComments.Text = string.Empty;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Comment not added!!";
            }
        }

        protected void btnCanelAll_Click(object sender, EventArgs e)
        {
            pnlEditing.Visible = false;
            pnlSelection.Visible = true;
            //ddlSelectOrganization.SelectedIndex = -1;
            
            //ddlSelectDate.Enabled = true;
            //ddlSelectDate.Visible = false;
          
            txtEditIncidentDate.Text = string.Empty;
            txtEditIncidentDateReported.Text = string.Empty;
            txtEditIncidentLocation.Text = string.Empty;
            txtEditIncidentReportedBy.Text = string.Empty;
            txtEditIncidentTime.Text = string.Empty;
            txtFollowUp.Text = string.Empty;
            txtincident.Text = string.Empty;
            txtResult.Text = string.Empty;

            txtComments.Text = string.Empty;
            lblIncidentId.Text = string.Empty;

            UploadedMembers.Clear();
            UploadedNonMembers.Clear();
        }

        protected void btnSubmitAll_Click(object sender, EventArgs e)
        {
            try
            {
                App_Data.Incident incidentForEdit = getCurrentIncident();
                //Submit the comments
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
                    // string Date = string.Format("{0} {1}", today.ToShortDateString(), today.ToLongTimeString());                
                    IncidentDAO.createIncidentComment(txtComments.Text, incidentForEdit.Incident_ID, today, HttpContext.Current.User.Identity.Name);
                    grdComments.DataSource = IncidentDAO.getCommentsByIncidentID(incidentForEdit.Incident_ID);
                    grdComments.DataBind();
                }

                //Submit the main page details
                IncidentDAO.updateIncident(incidentForEdit.Incident_ID,
                    string.IsNullOrEmpty(txtEditIncidentDate.Text) ? null : txtEditIncidentDate.Text,
                    string.IsNullOrEmpty(txtEditIncidentDateReported.Text) ? null : txtEditIncidentDateReported.Text,
                    txtEditIncidentTime.Text,
                    txtEditIncidentLocation.Text,
                    txtincident.Text,
                    txtResult.Text,
                    txtComments.Text,
                    txtFollowUp.Text,
                    Convert.ToInt32(ddlSelectOrganization.SelectedValue),
                    txtEditIncidentReportedBy.Text,
                    UploadedMembers,UploadedNonMembers);
                btnCanelAll_Click(sender, e);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void gridIncidents_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataControlFieldCell value = (DataControlFieldCell)gridIncidents.SelectedRow.Cells[0];
            DataControlFieldCell value2 = (DataControlFieldCell)gridIncidents.SelectedRow.Cells[1];
            lblIncidentId.Text = value.Text;
            lblNameOrganization.Text = value2.Text;
            int id;
            int.TryParse(lblIncidentId.Text, out id);
            if(id != 0)
            PopulateInformationIncident();
        }

        protected void grdComments_Sorting(object sender, GridViewSortEventArgs e)
        {
            
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


        
    }
}