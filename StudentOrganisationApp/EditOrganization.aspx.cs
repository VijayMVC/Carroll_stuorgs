using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using System.Text.RegularExpressions;

namespace StudentOrganisationApp.Organization
{
    public partial class EditOrganizationSelect : System.Web.UI.Page
    {
        OrganizationDAO OrganizationDAO = new OrganizationDAO();
        RequiredEventDAO RequiredEventDAO = new RequiredEventDAO();
        CategoryDAO CategoryDAO = new CategoryDAO();
        AdvisorDAO AdvisorDAO = new AdvisorDAO();
        StatusDAO StatusDAO = new StatusDAO();
        StudentDAO StudentDAO = new StudentDAO();
        MemberTypeDAO MemberTypeDAO = new MemberTypeDAO();
        List<AdvisorList> advisorList = new List<AdvisorList>();
        List<OrgMember> memberList = new List<OrgMember>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try{
            if (!IsPostBack)
            {
                tabContainerEditOrg.ActiveTabIndex = 0;
                ddlOrganization.DataSource = OrganizationDAO.getOrganizationList();
                ddlOrganization.DataTextField = "OrganizationName";
                ddlOrganization.DataValueField = "Organization_ID";
                ddlOrganization.DataBind();

                ddlCategory.DataSource = CategoryDAO.getCategory();
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "Category_ID";
                ddlCategory.DataBind();

                ddlStatus.DataSource = StatusDAO.getStatus();
                ddlStatus.DataTextField = "StatusName";
                ddlStatus.DataValueField = "Status_ID";
                ddlStatus.DataBind();

                ddlAdvisor.DataSource = AdvisorDAO.getAdvisorList();
                ddlAdvisor.DataTextField = "Name";
                ddlAdvisor.DataValueField = "AdvisorID";
                ddlAdvisor.DataBind();
                              

                if (ViewState["ExeMemberList"] == null)
                {
                    ViewState["ExeMemberList"] = new List<OrgMember>();
                }

                if (ViewState["OrgMemberList"] == null)
                {
                    ViewState["OrgMemberList"] = new List<OrgMember>();
                }

                if (ViewState["AdvisorListEdit"] == null)
                {
                    ViewState["AdvisorListEdit"] = new List<AdvisorList>();
                }
            }

            grdAdvisors.DataSource = UploadedAdvisors;
            grdAdvisors.DataBind();
            //grdExeMember.DataSource = UploadedExeMembers;
            //grdExeMember.DataBind();
            errormsg.Visible = false;
        }
         catch (Exception)
            {
                lblMessage.Text = "Unable to load Page!!";
            }

        }
        protected void btnGoMain_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(ddlOrganization.SelectedItem.Value) != -1)
                {
                    pnlSelectOrganization.Visible = false;
                    btnCanelAll.Visible = true;
                    pnlEditing.Visible = true;
                    
                    int ordID = Convert.ToInt32(ddlOrganization.SelectedItem.Value);
                    int statusID = -1;
                    App_Data.Organization OrgForEdit = OrganizationDAO.getOrganizationByID(ordID, ref statusID);

                    lblOrganizationEdit.Text = OrgForEdit.OrganizationName;
                    txtorg.Text = OrgForEdit.OrganizationName;
                    ddlCategory.SelectedValue = OrgForEdit.Category_ID.ToString();
                    txtDescription.Text = OrgForEdit.Description;
                    txtMeetTime.Text = OrgForEdit.MeetingTime;
                    txtBuilding.Text = OrgForEdit.MeetingBuilding;
                    txtMeetRoom.Text = OrgForEdit.MeetingRoom;
                    string value = "-1";
                    if (OrgForEdit.MeetingDay == null)
                    {
                        ddlMeetingDay.Items.FindByValue("-1").Selected = true;
                    }
                    else
                    {
                        value = ddlMeetingDay.Items.FindByText(OrgForEdit.MeetingDay).Value;
                        ddlMeetingDay.SelectedValue = value;
                    }

                    if (OrgForEdit.MeetingFrequency == null)
                    {
                        ddlMeetingFrequency.Items.FindByValue("-1").Selected = true;
                    }
                    else
                    {
                        value = ddlMeetingFrequency.Items.FindByText(OrgForEdit.MeetingFrequency).Value;
                        ddlMeetingFrequency.SelectedValue = value;
                    }

                    //added 8.11.2016
                    txtOAccount.Text = OrgForEdit.OAccount;
                    txtProjectCode.Text = OrgForEdit.ProjectCode;

                    if (OrgForEdit.RegistrarApproval == null)
                    {
                        txtRegApproval.Text = string.Empty;
                    }
                    else
                        txtRegApproval.Text = Convert.ToDateTime(OrgForEdit.RegistrarApproval).ToShortDateString();
                    if (OrgForEdit.RequirementsMetDate == null)
                    {
                        txtRequirementMetDate.Text = string.Empty;
                    }
                    else
                        txtRequirementMetDate.Text = Convert.ToDateTime(OrgForEdit.RequirementsMetDate).ToShortDateString();

                    if (OrgForEdit.RequirementsMet == true)
                    {
                        chkBoxRegApproval.Checked = true;
                        txtRequirementMetDate.Visible = true;
                        lblRequirementMetDate.Visible = true;
                        btnCalPopReuirmentsMet.Visible = true;
                    }
                    else
                    {
                        chkBoxRegApproval.Checked = false;
                        txtRequirementMetDate.Visible = false;
                        lblRequirementMetDate.Visible = false;
                        btnCalPopReuirmentsMet.Visible = false;
                        txtRequirementMetDate.Text = string.Empty;
                    }

                    ddlStatus.SelectedValue = statusID.ToString();
                    
                    txtCXCode.Text = OrgForEdit.CX_Code;
                    txtCXCode.Text = txtCXCode.Text.Trim();

                    //bind the grd to advisors from org
                    UploadedAdvisors = AdvisorDAO.getAdvisorsForOrg(ordID);
                    grdAdvisors.DataSource = UploadedAdvisors;
                    grdAdvisors.DataBind();

                    txtConstitution.Text = OrgForEdit.ConstitutionSubmitted == null ?string.Empty:Convert.ToDateTime(OrgForEdit.ConstitutionSubmitted).ToShortDateString();
                    txtConstitutionAccepted.Text = OrgForEdit.ConstitutionAccepted == null ? string.Empty : Convert.ToDateTime(OrgForEdit.ConstitutionAccepted).ToShortDateString();
                    txtConstitutionDenied.Text = OrgForEdit.ConstitutionDenied == null ? string.Empty : Convert.ToDateTime(OrgForEdit.ConstitutionDenied).ToShortDateString();
                    txtConstitutionUpdated.Text = OrgForEdit.ConstitutionUpdated == null ? string.Empty : Convert.ToDateTime(OrgForEdit.ConstitutionUpdated).ToShortDateString();
                    txtDatePrposalPacketSub.Text = OrgForEdit.DateProposed == null ? string.Empty : Convert.ToDateTime(OrgForEdit.DateProposed).ToShortDateString();
                    txtDatedenied.Text = OrgForEdit.ProposalAccepted == null ? string.Empty : Convert.ToDateTime(OrgForEdit.ProposalAccepted).ToShortDateString();
                    txtDateAccepted.Text = OrgForEdit.ProposalDenied == null ? string.Empty : Convert.ToDateTime(OrgForEdit.ProposalDenied).ToShortDateString();
                    txtProposalNotes.Text = OrgForEdit.ProposalNotes;
                    txtConstitutionNotes.Text = OrgForEdit.ConstitutionNotes;

                    //Bind Comments to grid
                    grdComments.DataSource = OrganizationDAO.getCommentsByOrganizationID(Convert.ToInt32(ddlOrganization.SelectedValue));
                    grdComments.DataBind();

                    ddlReqEvent.DataSource = RequiredEventDAO.getRequiredEventList();
                    ddlReqEvent.DataTextField = "RequiredEvent1";
                    ddlReqEvent.DataValueField = "RequiredEvent_ID";
                    ddlReqEvent.DataBind();
                    ddlReqEventSignUp.DataSource = RequiredEventDAO.getRequiredEventList();
                    ddlReqEventSignUp.DataTextField = "RequiredEvent1";
                    ddlReqEventSignUp.DataValueField = "RequiredEvent_ID";
                    ddlReqEventSignUp.DataBind();

                    cmbStudents.DataSource = StudentDAO.getNonExeMembersForOrgID(Convert.ToInt32(ddlOrganization.SelectedValue));
                    cmbStudents.DataTextField = "LastName";
                    cmbStudents.DataValueField = "Student_ID";
                    cmbStudents.DataBind();
                    cmbStudents.SelectedValue = "-1";

                    cmbStudentsInMembers.DataSource = StudentDAO.getNonMembersForOrgID(Convert.ToInt32(ddlOrganization.SelectedValue));
                    cmbStudentsInMembers.DataTextField = "LastName";
                    cmbStudentsInMembers.DataValueField = "Student_ID";
                    cmbStudentsInMembers.DataBind();
                    cmbStudentsInMembers.SelectedValue = "-1";

                    UploadedExeMembers = MemberTypeDAO.getExeMembersByOrgID(ordID);
                    grdExeMember.DataSource = UploadedExeMembers;
                    grdExeMember.DataBind();

                    UploadedOrgMembers = MemberTypeDAO.getMembersByOrgID(ordID);
                    grdMember.DataSource = UploadedOrgMembers;
                    grdMember.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Unable to retrieve the organization data!!";
                lblMessage.Text += "/n/n" + ex.Message;
                lblMessage.Text += "/n/n" + ex.StackTrace;
            }
        }

        protected void btnAddExeMember_Click(object sender, EventArgs e)
        {
            try
            {
                lblGPANotMet.Visible = false;

                if (cmbStudents.SelectedValue != "-1")
                {
                    bool GPABoard = false;
                    bool GPAOrg = false;

                    OrgMember exemember = MemberTypeDAO.getOrgMemberByStudID(Convert.ToInt32(cmbStudents.SelectedItem.Value), ref GPABoard, ref GPAOrg);

                    //8.12.2016 - removed GPA check. Jake has indicated that they can be added anyway and that a new report will
                    //be created to catch this scenario.
                    //if(GPABoard)
                    //{                       
                        UploadedExeMembers.Add(exemember);
                        grdExeMember.DataSource = UploadedExeMembers;
                        grdExeMember.DataBind();
                        cmbStudents.SelectedValue = "-1";
                    //}
                    //else
                    //{
                    //    lblGPANotMet.Text = "The Student doesn't have Executive GPA";
                    //    lblGPANotMet.Visible = true;
                    //}
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Executive Member not added!!";
            }
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditOrg.ActiveTabIndex;
            tabContainerEditOrg.ActiveTab = tabContainerEditOrg.Tabs[++tabIndex];
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditOrg.ActiveTabIndex;
            tabContainerEditOrg.ActiveTab = tabContainerEditOrg.Tabs[--tabIndex];
        }
        public List<AdvisorList> UploadedAdvisors
        {
            get
            {
                var list = (List<AdvisorList>)(ViewState["AdvisorListEdit"] ??
                    new List<AdvisorList>());
                ViewState["AdvisorListEdit"] = list;
                return list;
            }
            set
            {
                ViewState["AdvisorListEdit"] = value;
            }
        }

        protected void grdAdvisors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[4].Visible = false;
                e.Row.Cells[5].Visible = false;
            }
        }

        protected void btnAddAdvisor_Click(object sender, EventArgs e)
        {
            try
            {
                AdvisorList advisor = AdvisorDAO.getAdvisorByAdvID(Convert.ToInt32(ddlAdvisor.SelectedItem.Value));
                advisor.AdvisorID = Convert.ToInt32(ddlAdvisor.SelectedItem.Value);
                UploadedAdvisors.Add(advisor);
                grdAdvisors.DataBind();
                ddlAdvisor.SelectedIndex = -1;
            }
            catch (Exception)
            {
                lblMessage.Text = "Advisor not added!!";
            }
        }
        protected void grdAdvisors_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int advID = Convert.ToInt32(grdAdvisors.Rows[e.RowIndex].Cells[5].Text);
                advisorList = UploadedAdvisors;

                for (int i = 0; i < advisorList.Count; ++i)
                {
                    if (advisorList[i].AdvisorID == advID)
                    {
                        UploadedAdvisors.RemoveAt(i);
                    }
                }
                grdAdvisors.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Advisor not deleted!!";
            }
        }
        protected void btnNewAdvisor_Click(object sender, EventArgs e)
        {
            Response.Write("<script type='text/javascript'>detailedresults=window.open('CreateAdvisor.aspx');</script>");          
        }
        protected void btnEditAdvisor_Click(object sender, EventArgs e)
        {
            Response.Write("<script type='text/javascript'>detailedresults=window.open('EditAdvisor.aspx');</script>");
        }
        protected void grdComments_Sorting(object sender, GridViewSortEventArgs e)
        {

        }
        protected void btnCancelComments_Click(object sender, EventArgs e)
        {
            txtComments.Text = string.Empty;
        }
        protected void btnEnterEvent_Click(object sender, EventArgs e)
        {
            //Todo:Populate the event grid
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

                    OrganizationDAO.createOrganizationComment(txtComments.Text, Convert.ToInt32(ddlOrganization.SelectedValue), today, HttpContext.Current.User.Identity.Name);
                    grdComments.DataSource = OrganizationDAO.getCommentsByOrganizationID(Convert.ToInt32(ddlOrganization.SelectedValue));
                    grdComments.DataBind();
                    txtComments.Text = string.Empty;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Comment not added!!";
            }
        }
        protected void btnSubmitMain_Click(object sender, EventArgs e)
        {
            try
            {
                string meetDay;
                if (ddlMeetingDay.SelectedValue == "-1")
                {
                    meetDay = null;
                }
                else
                {
                    meetDay = ddlMeetingDay.SelectedItem.Text;
                }
                string meetFrequency;
                if (ddlMeetingFrequency.SelectedValue == "-1")
                {
                    meetFrequency = null;
                }
                else
                {
                    meetFrequency = ddlMeetingFrequency.SelectedItem.Text;
                }
                
                //added errror checking on the time input box.
                Regex rx = new Regex(@"^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$");
                Match m = rx.Match(txtMeetTime.Text.Trim());
                if (m.Success)
                {
                    //added OAccount/Project Code on 8.11.2016
                    OrganizationDAO.updateOrganizationMainPage(Convert.ToInt32(ddlOrganization.SelectedValue), txtorg.Text.Trim(),
                            txtDescription.Text.Trim(), txtMeetTime.Text.Trim(), meetDay, txtBuilding.Text.Trim(), txtMeetRoom.Text.Trim(),
                            txtCXCode.Text.Trim(), Convert.ToInt32(ddlCategory.SelectedValue), chkBoxRegApproval.Checked,
                            string.IsNullOrEmpty(txtRequirementMetDate.Text.Trim()) ? null : txtRequirementMetDate.Text,
                            string.IsNullOrEmpty(txtRegApproval.Text.Trim()) ? null : txtRegApproval.Text,
                            Convert.ToInt32(ddlStatus.SelectedValue), UploadedAdvisors, meetFrequency,
                            txtOAccount.Text.Trim(), txtProjectCode.Text.Trim());
                }
                else
                {
                    errormsg.Visible = true;
                }
                
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            try
            { 
                int ordID = Convert.ToInt32(ddlOrganization.SelectedItem.Value);
                int statusID = -1;
                App_Data.Organization OrgForEdit = OrganizationDAO.getOrganizationByID(ordID, ref statusID);
            
                txtorg.Text = OrgForEdit.OrganizationName;
                ddlCategory.SelectedValue = OrgForEdit.Category_ID.ToString();
                txtDescription.Text = OrgForEdit.Description;
                txtMeetTime.Text = OrgForEdit.MeetingTime;
                txtBuilding.Text = OrgForEdit.MeetingBuilding;
                txtMeetRoom.Text = OrgForEdit.MeetingRoom;
                string value = "-1";
                if (OrgForEdit.MeetingDay == null)
                {
                    ddlMeetingDay.Items.FindByValue("-1").Selected = true;
                }
                else
                {
                    value = ddlMeetingDay.Items.FindByText(OrgForEdit.MeetingDay).Value;
                    ddlMeetingDay.SelectedValue = value;
                }

                if (OrgForEdit.MeetingFrequency == null)
                {
                    ddlMeetingFrequency.Items.FindByValue("-1").Selected = true;
                }
                else
                {
                    value = ddlMeetingFrequency.Items.FindByText(OrgForEdit.MeetingFrequency).Value;
                    ddlMeetingFrequency.SelectedValue = value;
                }

                //added 8.11.2016
                txtOAccount.Text = OrgForEdit.OAccount;
                txtProjectCode.Text = OrgForEdit.ProjectCode;

                if (OrgForEdit.RegistrarApproval == null)
                {
                    txtRegApproval.Text = string.Empty;
                }
                else
                    txtRegApproval.Text = Convert.ToDateTime(OrgForEdit.RegistrarApproval).ToShortDateString();
                if (OrgForEdit.RequirementsMetDate == null)
                {
                    txtRequirementMetDate.Text = string.Empty;
                }
                else
                    txtRequirementMetDate.Text = Convert.ToDateTime(OrgForEdit.RequirementsMetDate).ToShortDateString();

                if (OrgForEdit.RequirementsMet == true)
                {
                    chkBoxRegApproval.Checked = true;
                    txtRequirementMetDate.Visible = true;
                    lblRequirementMetDate.Visible = true;
                    btnCalPopReuirmentsMet.Visible = true;
                }
                else
                {
                    chkBoxRegApproval.Checked = false;
                    txtRequirementMetDate.Visible = false;
                    lblRequirementMetDate.Visible = false;
                    btnCalPopReuirmentsMet.Visible = false;
                    txtRequirementMetDate.Text = string.Empty;
                }
            
                ddlStatus.SelectedValue = statusID.ToString();
                txtCXCode.Text = OrgForEdit.CX_Code;
                txtCXCode.Text = txtCXCode.Text.Trim();

                UploadedAdvisors.Clear();
                //bind the grd to advisors from org
                UploadedAdvisors = AdvisorDAO.getAdvisorsForOrg(ordID);
                grdAdvisors.DataSource = UploadedAdvisors;
                grdAdvisors.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Organization data!!";
            }
        }

        protected void btnCanelDates_Click(object sender, EventArgs e)
        {
            try
            {
                int ordID = Convert.ToInt32(ddlOrganization.SelectedItem.Value);
                int statusID = -1;
                App_Data.Organization OrgForEdit = OrganizationDAO.getOrganizationByID(ordID, ref statusID);

                txtConstitution.Text = Convert.ToDateTime(OrgForEdit.ConstitutionSubmitted).ToShortDateString();
                txtConstitutionAccepted.Text = Convert.ToDateTime(OrgForEdit.ConstitutionAccepted).ToShortDateString();
                txtConstitutionDenied.Text = Convert.ToDateTime(OrgForEdit.ConstitutionDenied).ToShortDateString();
                txtConstitutionUpdated.Text = Convert.ToDateTime(OrgForEdit.ConstitutionUpdated).ToShortDateString();
                txtDatePrposalPacketSub.Text = Convert.ToDateTime(OrgForEdit.DateProposed).ToShortDateString();
                txtDatedenied.Text = Convert.ToDateTime(OrgForEdit.ConstitutionAccepted).ToShortDateString();
                txtDateAccepted.Text = Convert.ToDateTime(OrgForEdit.ConstitutionDenied).ToShortDateString();
                txtProposalNotes.Text = OrgForEdit.ProposalNotes;
                txtConstitutionNotes.Text = OrgForEdit.ConstitutionNotes;
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Organization data!!";
            }
        }
        protected void btnCanelAll_Click(object sender, EventArgs e)
        {
            try
            {
                lblGPANotMet.Text = string.Empty;
                lblMessage.Text = string.Empty;
                pnlEditing.Visible = false;
                ddlOrganization.Enabled = true;
                ddlOrganization.SelectedValue = "-1";
                lblOrganizationEdit.Text = string.Empty;
                pnlSelectOrganization.Visible = true;
               
                btnCanelAll.Visible = false;
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Organization data!!";
            }
        }

        protected void btnSubmitDates_Click(object sender, EventArgs e)
        {
            try
            {
                OrganizationDAO.updateOrganizationDates(Convert.ToInt32(ddlOrganization.SelectedValue),
                    string.IsNullOrEmpty(txtDatePrposalPacketSub.Text) ? null : txtDatePrposalPacketSub.Text,
                    string.IsNullOrEmpty(txtDateAccepted.Text) ? null : txtDateAccepted.Text,
                    string.IsNullOrEmpty(txtDatedenied.Text) ? null : txtDatedenied.Text,
                    txtProposalNotes.Text,
                    string.IsNullOrEmpty(txtConstitution.Text) ? null : txtConstitution.Text,
                    string.IsNullOrEmpty(txtConstitutionAccepted.Text) ? null : txtConstitutionAccepted.Text,
                    string.IsNullOrEmpty(txtConstitutionDenied.Text) ? null : txtConstitutionDenied.Text,
                    string.IsNullOrEmpty(txtConstitutionUpdated.Text) ? null : txtConstitutionUpdated.Text,
                    txtConstitutionNotes.Text);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void btnSubmitExeMembers_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < UploadedExeMembers.Count; ++i)
                {
                    //Check for NonMember
                    if(UploadedExeMembers[i].MemberID == 25)
                    OrganizationDAO.updateOrganizationExecutiveMembersToDelete(UploadedExeMembers[i].Student_ID, Convert.ToInt32(ddlOrganization.SelectedValue), UploadedExeMembers[i].MemberID, UploadedExeMembers[i].IsPrimaryContact);
                    else
                    OrganizationDAO.updateOrganizationExecutiveMembers(UploadedExeMembers[i].Student_ID, Convert.ToInt32(ddlOrganization.SelectedValue), UploadedExeMembers[i].MemberID, UploadedExeMembers[i].IsPrimaryContact);
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void btnCancelExeMembers_Click(object sender, EventArgs e)
        {
            try
            {
                cmbStudents.SelectedValue = "-1";
                lblGPANotMet.Visible = false;
                UploadedExeMembers = MemberTypeDAO.getExeMembersByOrgID(Convert.ToInt32(ddlOrganization.SelectedValue));
                grdExeMember.DataSource = UploadedExeMembers;
                grdExeMember.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Organization data!!";
            }
        }

        protected void btnGoRequiredEventSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlReqEventSignUp.SelectedValue != "-1")
                {
                    btnCancelSignUp.Visible = true;
                    grdMeetings.DataSource = RequiredEventDAO.getMeetingToSignUP(Convert.ToInt32(ddlReqEventSignUp.SelectedValue), Convert.ToInt32(ddlOrganization.SelectedValue));
                    grdMeetings.DataBind();
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Meeting Details!!";
            }
        }

        protected void btnCancelSignUp_Click(object sender, EventArgs e)
        {
            ddlReqEventSignUp.SelectedValue = "-1";
            grdMeetings.DataSource = null;
            grdMeetings.DataBind();
        }

        protected void btnReqEventAttendedCancel_Click(object sender, EventArgs e)
        {
            ddlReqEvent.SelectedValue = "-1";
            ddlReqEventMeetingDate.Items.Clear();
            ListItem select = new ListItem("Select Meeting Date", "-1");
            ddlReqEventMeetingDate.Items.Add(select);

            ddlReqEventMeetingTime.Items.Clear();
            ListItem selectTime = new ListItem("Select Meeting Time", "-1");
            ddlReqEventMeetingTime.Items.Add(selectTime);
            
            ddlReqEventMeetingDate.Enabled = false;
            ddlReqEventMeetingTime.Enabled = false;

        }

        protected void btnReqEventAttendedSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                RequiredEventDAO.updateOrgRequiredEventMeeting(Convert.ToInt32(ddlReqEventMeetingTime.SelectedValue), Convert.ToInt32(ddlOrganization.SelectedValue), Convert.ToInt32(txtStudent1.Text), Convert.ToInt32(txtStudent2.Text));
            }

            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void btnRefreshAdvisorList_Click(object sender, EventArgs e)
        {
            try
            {
                ddlAdvisor.Items.Clear();
                ListItem select = new ListItem("Select Advisor", "-1");
                ddlAdvisor.Items.Add(select);

                ddlAdvisor.DataSource = AdvisorDAO.getAdvisorList();
                ddlAdvisor.DataTextField = "Name";
                ddlAdvisor.DataValueField = "AdvisorID";
                ddlAdvisor.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not load Advisor List!!";
            }
        }

        protected void grdMeetings_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
            }

        }       

        protected void grdMeetings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int meetingID = Convert.ToInt32(grdMeetings.Rows[e.RowIndex].Cells[1].Text);
                int orgID = Convert.ToInt32(ddlOrganization.SelectedValue);

                RequiredEventDAO.newOrgRequiredEventMeeting(orgID, meetingID);

                grdMeetings.Rows[e.RowIndex].Cells[0].Enabled = false;
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Sign Up for the Meeting!!";
            }

        }

        protected void btnRegEventAttendGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlReqEvent.SelectedValue != "-1")
                {
                    ddlReqEventMeetingDate.Enabled = true;
                    btnCancelSignUp.Visible = true;
                    ddlReqEventMeetingDate.DataSource = RequiredEventDAO.getMeetingSignedUP(Convert.ToInt32(ddlReqEvent.SelectedValue), Convert.ToInt32(ddlOrganization.SelectedValue));
                    //Short datetime is stored in Meeting Time
                    ddlReqEventMeetingDate.DataTextField = "MeetingTime";
                    ddlReqEventMeetingDate.DataValueField = "MeetingID";
                    ddlReqEventMeetingDate.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }

        }

        protected void btnMeetingDateGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlReqEventMeetingDate.SelectedValue != "-1")
                {
                    ddlReqEventMeetingTime.Enabled = true;
                    btnCancelSignUp.Visible = true;
                    ddlReqEventMeetingTime.DataSource = RequiredEventDAO.getMeetingSignedUPForDate(Convert.ToInt32(ddlReqEvent.SelectedValue), Convert.ToInt32(ddlOrganization.SelectedValue), Convert.ToDateTime(ddlReqEventMeetingDate.SelectedItem.Text).ToShortDateString());
                    ddlReqEventMeetingTime.DataTextField = "MeetingTime";
                    ddlReqEventMeetingTime.DataValueField = "MeetingID";
                    ddlReqEventMeetingTime.DataBind();
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Could not get Meeting List!!";
            }
        }

        protected void grdExeMember_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlMemberType = (e.Row.FindControl("ddlMemberType") as DropDownList);
                    ddlMemberType.DataSource = MemberTypeDAO.getMemberTypeList();
                    ddlMemberType.DataTextField = "MemberName";
                    ddlMemberType.DataValueField = "Member_ID";
                    ddlMemberType.DataBind();
                    //Add Default Item in the DropDownList
                    ListItem select = new ListItem("Select Member Type", "-1");
                    ddlMemberType.Items.Add(select);
                    //Select the Country of Customer in DropDownList

                    string memberType = (e.Row.FindControl("lblMemberType") as Label).Text;
                    if (memberType == "0")
                        memberType = "-1";

                    ddlMemberType.Items.FindByValue(memberType).Selected = true;

                    CheckBox chkPrimaryContact = (e.Row.FindControl("chkPrimaryContact") as CheckBox);
                    string primaryContact = (e.Row.FindControl("lblPrimaryContact") as Label).Text;
                    if (primaryContact == "true" || primaryContact == "True")
                    {
                        chkPrimaryContact.Checked = true;
                    }
                    else
                        chkPrimaryContact.Checked = false;
                }

                if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[6].Visible = false;
                    e.Row.Cells[4].Visible = false;
                    e.Row.Cells[5].Visible = false;
                    e.Row.Cells[9].Visible = false;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Load Executive Members!!";
            }
        }
        public List<OrgMember> UploadedExeMembers
        {
            get
            {
                var list = (List<OrgMember>)(ViewState["ExeMemberList"] ??
                    new List<OrgMember>());
                ViewState["ExeMemberList"] = list;
                return list;
            }
            set
            {
                ViewState["ExeMemberList"] = value;
            }
        }

        public List<OrgMember> UploadedOrgMembers
        {
            get
            {
                var list = (List<OrgMember>)(ViewState["OrgMemberList"] ??
                    new List<OrgMember>());
                ViewState["OrgMemberList"] = list;
                return list;
            }
            set
            {
                ViewState["OrgMemberList"] = value;
            }
        }
        
        protected void ddlMemberType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList ddlMemberType = (DropDownList)sender;
                GridViewRow row = (GridViewRow)ddlMemberType.NamingContainer;
                Label lblMemberType = (Label)row.FindControl("lblMemberType");
                lblMemberType.Text = ddlMemberType.SelectedValue;

                UploadedExeMembers[row.RowIndex].Position = ddlMemberType.SelectedItem.Text;
                UploadedExeMembers[row.RowIndex].MemberID = Convert.ToInt32(ddlMemberType.SelectedValue);
                grdExeMember.DataSource = UploadedExeMembers;
                grdExeMember.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Sorry Some Error Occured!!";
            }
        }
       
        public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkPrimaryContact = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chkPrimaryContact.NamingContainer;
            Label lblPrimaryContact = (Label)row.FindControl("lblPrimaryContact");
            lblPrimaryContact.Text = chkPrimaryContact.Checked.ToString();

            UploadedExeMembers[row.RowIndex].IsPrimaryContact = chkPrimaryContact.Checked;
            //UploadedExeMembers[row.RowIndex].MemberID = Convert.ToInt32(ddlMemberType.SelectedValue);
            grdExeMember.DataSource = UploadedExeMembers;
            grdExeMember.DataBind();
        }

        protected void chkBoxRegApproval_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBoxRegApproval.Checked)
            {
                lblRequirementMetDate.Visible = true;
                txtRequirementMetDate.Visible = true;
                btnCalPopReuirmentsMet.Visible = true;
            }
            else
            {
                lblRequirementMetDate.Visible = false;
                txtRequirementMetDate.Visible = false;
                btnCalPopReuirmentsMet.Visible = false;
                txtRequirementMetDate.Text = string.Empty;
            }
        }

        protected void btnCancelMembers_Click(object sender, EventArgs e)
        {
            try
            {
                cmbStudentsInMembers.SelectedValue = "-1";
                lblGPANotMetmember.Visible = false;
                UploadedOrgMembers = MemberTypeDAO.getMembersByOrgID(Convert.ToInt32(ddlOrganization.SelectedValue));
                grdMember.DataSource = UploadedOrgMembers;
                grdMember.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Organization data!!";
            }
        }

        protected void btnSubmitMembers_Click(object sender, EventArgs e)
        {
            try
            {
                OrganizationDAO.updateOrganizationMembers(Convert.ToInt32(ddlOrganization.SelectedValue), UploadedOrgMembers); 
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            try
            {
                lblGPANotMetmember.Visible = false;

                if (cmbStudentsInMembers.SelectedValue != "-1")
                {
                    bool GPABoard = false;
                    bool GPAOrg = false;

                    OrgMember member = MemberTypeDAO.getOrgMemberByStudID(Convert.ToInt32(cmbStudentsInMembers.SelectedItem.Value), ref GPABoard, ref GPAOrg);

                    //8.12.2016 - removed GPA check. Jake has indicated that they can be added anyway and that a new report will
                    //be created to catch this scenario.
                    //if (GPAOrg)
                    //{
                        UploadedOrgMembers.Add(member);
                        grdMember.DataSource = UploadedOrgMembers;
                        grdMember.DataBind();
                        cmbStudentsInMembers.SelectedValue = "-1";
                    //}
                    //else
                    //{
                    //    lblGPANotMetmember.Text = "The Student doesnt have Org GPA";
                    //    lblGPANotMetmember.Visible = true;
                    //}
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Executive Member not added!!";
            }
        }

        protected void grdMember_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int stuID = Convert.ToInt32(grdMember.Rows[e.RowIndex].Cells[4].Text);
                memberList = UploadedOrgMembers;

                for (int i = 0; i < memberList.Count; ++i)
                {
                    if (memberList[i].Student_ID == stuID)
                    {
                        UploadedOrgMembers.RemoveAt(i);
                    }
                }
                grdMember.DataSource = UploadedOrgMembers;
                grdMember.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to delete the member!!";
            }
        }

        protected void grdMember_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[4].Visible = false;
            }
        }
    }
}