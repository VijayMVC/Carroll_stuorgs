using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp.SetUp
{
    public partial class ScheduleMeetings : System.Web.UI.Page
    {
        RequiredEventDAO RequiredEventDAO = new RequiredEventDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ddlRequiredEvents.DataSource = RequiredEventDAO.getRequiredEventList();
                    ddlRequiredEvents.DataTextField = "RequiredEvent1";
                    ddlRequiredEvents.DataValueField = "RequiredEvent_ID";
                    ddlRequiredEvents.DataBind();
                }
            }
            catch (Exception exp)
            {
                lblMessage.Text = "Could Not load Organization Requirement List!!";
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlRequiredEvents.SelectedValue != "-1")
                {
                    pnlEditing.Visible = true;
                    pnlMeeting.Visible = true;

                    RequiredEvent eventForEdit = RequiredEventDAO.getRequiredEventByID(Convert.ToInt32(ddlRequiredEvents.SelectedValue));
                    txtEventNotes.Text = eventForEdit.EventDescription;
                    txtExtenderRequiredEvent.Text = eventForEdit.AddDate == null?string.Empty:Convert.ToDateTime(eventForEdit.AddDate).ToShortDateString();
                    txtRequiredEvent.Text = eventForEdit.RequiredEvent1;
                    grdMeeting.DataSource = RequiredEventDAO.getMeetingForReqEventID(Convert.ToInt32(ddlRequiredEvents.SelectedValue));
                    grdMeeting.DataBind();

                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Retrieve Organization Requirement Details!!";
            }
        }

        protected void grdMeeting_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName != "EditMeeting") return;
                int meetingID = Convert.ToInt32(e.CommandArgument);
                string strName = ddlRequiredEvents.SelectedValue;
                Response.Write("<script type='text/javascript'>detailedresults=window.open('OrgRequirementMeetings.aspx?reqID=" + ddlRequiredEvents.SelectedValue + "&MeetID=" + meetingID.ToString() + "');</script>");
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Navigate to Meetings Page!!";
            }
        }

        protected void btnAddMeeting_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Write("<script type='text/javascript'>detailedresults=window.open('OrgRequirementMeetings.aspx?reqID=" + ddlRequiredEvents.SelectedValue + "&MeetID=" + "');</script>");
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Navigate to Meetings Page!!";
            }
        }
        protected void btnCanel_Click(object sender, EventArgs e)
        {
            cleartext();
        }
        protected void cleartext()
        {

            pnlEditing.Visible = false;
            pnlMeeting.Visible = false;

            txtEventNotes.Text = string.Empty;
            txtRequiredEvent.Text = string.Empty;
            txtExtenderRequiredEvent.Text = string.Empty;
            ddlRequiredEvents.SelectedIndex = -1;
        }

        protected void grdMeeting_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
            }            
        }

        protected void btnEditRequiredEvent_Click(object sender, EventArgs e)
        {
            try
            {
                RequiredEventDAO.updateRequiredEvent(txtRequiredEvent.Text, txtEventNotes.Text, string.IsNullOrEmpty(txtExtenderRequiredEvent.Text) ? null : txtExtenderRequiredEvent.Text, ddlRequiredEvents.SelectedIndex); 
                    
            }
            catch (Exception)
            {
                lblMessage.Text = "Org Requirement Not Updated!!";
            }
        }
    }
}