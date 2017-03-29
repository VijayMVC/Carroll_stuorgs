using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp
{
    public partial class OrgRequirementMeetings : System.Web.UI.Page
    {
        RequiredEventDAO RequiredEventDAO = new RequiredEventDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblRequiredEventID.Text = Request.QueryString[0];
            this.lblMeetingID.Text = Request.QueryString[1];
            if (lblRequiredEventID.Text != string.Empty && lblMeetingID.Text != string.Empty)
            {
                try
                {
                    App_Data.RequiredEventMeeting MeetingForEdit = RequiredEventDAO.getMeetingByreqIDmeetID(Convert.ToInt32(Request.QueryString[0]), Convert.ToInt32(Request.QueryString[1]));

                    txtMeetingYear.Text = MeetingForEdit.Year;
                    txtNotes.Text = MeetingForEdit.Notes;
                    txtMeetingTime.Text = MeetingForEdit.MeetingTime;
                    txtMeetingBuilding.Text = MeetingForEdit.MeetingBuilding;
                    txtMeetingRoom.Text = MeetingForEdit.MeetingRoomNumber;
                    txtMeetingDate.Text = Convert.ToDateTime(MeetingForEdit.MeetingDate).ToShortDateString();
                    txtMeetingSession.Text = MeetingForEdit.Session;
                    btnAddRequiredEventMeeting.Text = "Submit";
                }
                catch (Exception)
            {
                lblMessage.Text = "Could Not Retrieve Meeting Details!!";
            }
            }
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            if (lblRequiredEventID.Text == string.Empty || lblMeetingID.Text == string.Empty)
            {
                cleartext();
            }
            else 
            {
                try
                {
                    App_Data.RequiredEventMeeting MeetingForEdit = RequiredEventDAO.getMeetingByreqIDmeetID(Convert.ToInt32(Request.QueryString[0]), Convert.ToInt32(Request.QueryString[1]));

                    txtMeetingYear.Text = MeetingForEdit.Year;
                    txtNotes.Text = MeetingForEdit.Notes;
                    txtMeetingTime.Text = MeetingForEdit.MeetingTime;
                    txtMeetingBuilding.Text = MeetingForEdit.MeetingBuilding;
                    txtMeetingRoom.Text = MeetingForEdit.MeetingRoomNumber;
                    txtMeetingDate.Text = Convert.ToDateTime(MeetingForEdit.MeetingDate).ToShortDateString();
                    txtMeetingSession.Text = MeetingForEdit.Session;
                }
                catch (Exception)
                {
                    lblMessage.Text = "Could Not Retrieve Meeting Details!!";
                }
            }
        }

        protected void btnAddRequiredEventMeeting_Click(object sender, EventArgs e)
        {
            
                if (lblRequiredEventID.Text != string.Empty)
                {
                    if (lblMeetingID.Text != string.Empty)
                    {
                        try
                        {
                            RequiredEventDAO.updateMeeting(Convert.ToInt32(lblRequiredEventID.Text), Convert.ToInt32(lblMeetingID.Text), txtMeetingSession.Text,
                                txtMeetingYear.Text,
                                 string.IsNullOrEmpty(txtMeetingDate.Text) ? null : txtMeetingDate.Text, txtMeetingTime.Text, txtMeetingBuilding.Text, txtMeetingRoom.Text, txtNotes.Text);
                            cleartext();
                        }
                        catch (Exception)
                        {
                            lblMessage.Text = "Meeting Not Added!!";
                        }

                    }
                    else
                    {
                        try
                        {
                            RequiredEventDAO.createMeeting(Convert.ToInt32(lblRequiredEventID.Text), txtMeetingSession.Text,
                                txtMeetingYear.Text, 
                                 string.IsNullOrEmpty(txtMeetingDate.Text) ? null : txtMeetingDate.Text,txtMeetingTime.Text, txtMeetingBuilding.Text, txtMeetingRoom.Text, txtNotes.Text);
                            cleartext();
                        }
                        catch (Exception)
                        {
                            lblMessage.Text = "Meeting Details Not Edited!!";
                        }
                    }
                }
            
        }

        protected void cleartext()
        {
            txtMeetingBuilding.Text = string.Empty;
            txtMeetingDate.Text = string.Empty;
            txtMeetingSession.Text = string.Empty;
            txtMeetingYear.Text = string.Empty;
            txtMeetingTime.Text = string.Empty;
            txtMeetingRoom.Text = string.Empty;
            txtNotes.Text = string.Empty;
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditRequiredEvent.aspx");
        }
    }
}