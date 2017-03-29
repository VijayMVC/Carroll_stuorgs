using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using System.Collections;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp.Events
{
    public partial class EditEvents : System.Web.UI.Page
    {
        OrganizationDAO OrganizationDAO = new OrganizationDAO();
        EventDAO EventDAO = new EventDAO();
        List<StudentList> driverList = new List<StudentList>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tabContainerEditEvent.ActiveTabIndex = 0;
                    ddlSelectOrganization.DataSource = OrganizationDAO.getOrganizationList();
                    ddlSelectOrganization.DataTextField = "OrganizationName";
                    ddlSelectOrganization.DataValueField = "Organization_ID";
                    ddlSelectOrganization.DataBind();

                    if (ViewState["DriverListEdit"] == null)
                    {
                        ViewState["DriverListEdit"] = new List<StudentList>();
                    }
                }
                grdEditEventDrivers.DataSource = UploadedDrivers;
                grdEditEventDrivers.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Could not load Organization List!!";
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditEvent.ActiveTabIndex;
            tabContainerEditEvent.ActiveTab = tabContainerEditEvent.Tabs[++tabIndex];
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerEditEvent.ActiveTabIndex;
            tabContainerEditEvent.ActiveTab = tabContainerEditEvent.Tabs[--tabIndex];
        }

        protected void btnGoOrg_Click(object sender, EventArgs e)
        {
            try
            {
                if(ddlSelectOrganization.SelectedIndex != -1)
                {
                    int idorganization = Convert.ToInt32(ddlSelectOrganization.SelectedValue);
                    gridediteventresults.DataSource = EventDAO.getEventByOrgID(idorganization);
                    gridediteventresults.DataBind();
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Load Events List!!";
            }
        }

        public void PopulateInformationEvent()
        {
            pnlSelection.Visible = false;
            pnlEditing.Visible = true;

            UploadedDrivers.Clear();
            ddlSelectDrivers.Items.Clear();

            ListItem select = new ListItem("Select Driver", "-1");
            ddlSelectDrivers.Items.Add(select);

            ddlSelectDrivers.DataSource = EventDAO.getStudentDriverList();
            ddlSelectDrivers.DataTextField = "Name";
            ddlSelectDrivers.DataValueField = "Student_ID";
            ddlSelectDrivers.DataBind();

            try
            {
                App_Data.OrgEvent eventForEdit = getCurrentEvent();

                txtEditEventDate.Text = Convert.ToDateTime(eventForEdit.Date).ToShortDateString();
                txtEditEventTime.Text = eventForEdit.Time;
                txtEditEventTitle.Text = eventForEdit.Title;
                ddlEditEventOrgEncharge.DataSource = OrganizationDAO.getOrganizationList();
                ddlEditEventOrgEncharge.DataTextField = "OrganizationName";
                ddlEditEventOrgEncharge.DataValueField = "Organization_ID";
                ddlEditEventOrgEncharge.DataBind();
                ddlEditEventOrgEncharge.SelectedValue = eventForEdit.Organization_ID.ToString();
                txtEditEventOrgWorkedWith.Text = eventForEdit.OrganizationWorkedWith;
                if (eventForEdit.OnOffCampus == true)
                    chkEventLocationOffCampus.Checked = true;
                txtEditEventContactPerson.Text = eventForEdit.ContactName;
                txtEditEventLocation.Text = eventForEdit.Location;
                txtEditEventDescription.Text = eventForEdit.Description;
                txtEditEventPhone.Text = eventForEdit.ContactPhone;
                txtEditEventEmailID.Text = eventForEdit.ContactEmail;
                txtEditEventBus.Text = eventForEdit.BusRental.ToString();
                txtEditEventVan.Text = eventForEdit.VanRental.ToString();
                txtEditEventDollarSpend.Text = eventForEdit.DollarsSpentByOrg.ToString();
                txtDollarSpentByPartner.Text = eventForEdit.DollarsSpentByPartner.ToString();
                txtEditEventAttendence.Text = eventForEdit.Attendance.ToString();

                //added per Jake/Katie for MyOrgs project
                txtCreatedByUser.Text = eventForEdit.CreatedByUser;

                if (eventForEdit.RoomReserved == true)
                    CBroomreserved.Checked = true;
                if (eventForEdit.Marketing == true)
                    CBmarketing.Checked = true;
                if (eventForEdit.Catering == true)
                    CBcatering.Checked = true;
                if (eventForEdit.SignupForm == true)
                    CBsignupform.Checked = true;
                if (eventForEdit.ActivityWaiver == true)
                    CBactivitywaiver.Checked = true;
                if (eventForEdit.CUNight == true)
                    CBcunight.Checked = true;

                UploadedDrivers = EventDAO.getDriversForEvent(Convert.ToInt32(eventForEdit.Driver1), Convert.ToInt32(eventForEdit.Driver2));
                grdEditEventDrivers.DataSource = UploadedDrivers;
                grdEditEventDrivers.DataBind();

                //Bind Comments to grid
                grdComments.DataSource = EventDAO.getCommentsByEventID(eventForEdit.Event_ID);
                grdComments.DataBind();                
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the event data!!";
            }
        }

        private OrgEvent getCurrentEvent()
        {
            int idevent;
            int.TryParse(lblEventId.Text, out idevent);

            if (idevent != 0)
            {
                return EventDAO.getEventByEventID(idevent);
            }
            else
                return null;
        }

        protected void gridediteventresults_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataControlFieldCell value = (DataControlFieldCell)gridediteventresults.SelectedRow.Cells[0];
            DataControlFieldCell value2 = (DataControlFieldCell)gridediteventresults.SelectedRow.Cells[1];
            lblEventId.Text = value.Text;
            lblNameOrganization.Text = value2.Text;
            int id;
            int.TryParse(lblEventId.Text, out id);
            if (id != 0)
                PopulateInformationEvent();
        }

        protected void clearAlltext()
        {
            pnlSelection.Visible = true;
            pnlEditing.Visible = false;

            lblEventId.Text = string.Empty;
            //ddlSelectOrganization.SelectedIndex = -1;
            
            ddlSelectDrivers.Items.Clear();
            ddlEditEventOrgEncharge.Items.Clear();
            txtEditEventEmailID.Text = string.Empty;
            txtEditEventLocation.Text = string.Empty;
            txtEditEventPhone.Text = string.Empty;
            txtEditEventTime.Text = string.Empty;
            txtEditEventTitle.Text = string.Empty;
            txtEditEventDate.Text = string.Empty;
            txtEditEventDescription.Text = string.Empty;
            txtEditEventOrgWorkedWith.Text = string.Empty;
            txtEditEventContactPerson.Text = string.Empty;
            ddlEditEventOrgEncharge.SelectedIndex = -1;
            chkEventLocationOffCampus.Checked = false;
            txtEditEventAttendence.Text = string.Empty;

            txtEditEventBus.Text = string.Empty;
            txtEditEventVan.Text = string.Empty;
            txtEditEventDollarSpend.Text = string.Empty;
            txtDollarSpentByPartner.Text = string.Empty;

            //added per Jake/Katie
            txtCreatedByUser.Text = string.Empty;

            //added per Jake/Katie for MyOrgs project
            CBroomreserved.Checked = false;
            CBmarketing.Checked = false;
            CBcatering.Checked = false;
            CBsignupform.Checked = false;
            CBactivitywaiver.Checked = false;
            CBcunight.Checked = false;

            txtComments.Text = string.Empty;

            UploadedDrivers.Clear();
        }

        protected void btnCancelAll_Click(object sender, EventArgs e)
        {
            clearAlltext();
        }

        protected void btnSubmitAll_Click(object sender, EventArgs e)
        {
            try
            {
                App_Data.OrgEvent eventForEdit = getCurrentEvent();
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

                    EventDAO.createEventComment(txtComments.Text, eventForEdit.Event_ID, today, HttpContext.Current.User.Identity.Name);
                    grdComments.DataSource = EventDAO.getCommentsByEventID(eventForEdit.Event_ID);
                    grdComments.DataBind();

                }
                driverList = UploadedDrivers;

                string driver2 = string.Empty;
                string driver1 = string.Empty;
                if (driverList.Count >= 1)
                {
                    driver1 = driverList[0].Student_ID.ToString();
                }
                if (driverList.Count >= 2)
                {
                    driver2 = driverList[1].Student_ID.ToString();
                }

                //Removed Volunteer Hours field, per Jake/Katie. They need to enter a Service Project for that.
                EventDAO.updateEvent(eventForEdit.Event_ID, Convert.ToInt32(ddlEditEventOrgEncharge.SelectedValue),
                    string.IsNullOrEmpty(txtEditEventDate.Text) ? null : txtEditEventDate.Text,
                    txtEditEventTime.Text, txtEditEventLocation.Text, txtEditEventDescription.Text, txtEditEventOrgWorkedWith.Text, txtEditEventPhone.Text,
                    txtEditEventEmailID.Text, string.IsNullOrEmpty(txtEditEventAttendence.Text) ? null : txtEditEventAttendence.Text, 
                    "0", /*Vol Hrs field*/ string.IsNullOrEmpty(txtEditEventDollarSpend.Text) ? null : txtEditEventDollarSpend.Text,
                    string.IsNullOrEmpty(txtDollarSpentByPartner.Text) ? null : txtDollarSpentByPartner.Text, txtEditEventTitle.Text, chkEventLocationOffCampus.Checked,
                    string.IsNullOrEmpty(txtEditEventVan.Text) ? null : txtEditEventVan.Text, string.IsNullOrEmpty(txtEditEventBus.Text) ? null : txtEditEventBus.Text, 
                    txtEditEventContactPerson.Text, string.IsNullOrEmpty(driver1) ? null : driver1, string.IsNullOrEmpty(driver2) ? null : driver2,
                    CBroomreserved.Checked ? 1 : 0, CBmarketing.Checked ? 1 : 0, CBcatering.Checked ? 1: 0, CBsignupform.Checked ? 1 : 0,
                    CBactivitywaiver.Checked ? 1 : 0, CBcunight.Checked ? 1 : 0);

                clearAlltext();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                App_Data.OrgEvent eventForEdit = getCurrentEvent();
                txtEditEventDate.Text = Convert.ToDateTime(eventForEdit.Date).ToShortDateString();
                txtEditEventTime.Text = eventForEdit.Time;
                txtEditEventTitle.Text = eventForEdit.Title;
                ddlEditEventOrgEncharge.SelectedValue = eventForEdit.Organization_ID.ToString();
                txtEditEventOrgWorkedWith.Text = eventForEdit.OrganizationWorkedWith;
                if (eventForEdit.OnOffCampus == true)
                    chkEventLocationOffCampus.Checked = true;
                txtEditEventContactPerson.Text = eventForEdit.ContactName.ToString();
                txtEditEventLocation.Text = eventForEdit.Location;
                txtEditEventDescription.Text = eventForEdit.Description;
                txtEditEventPhone.Text = eventForEdit.ContactPhone;
                txtEditEventEmailID.Text = eventForEdit.ContactEmail;
                txtEditEventAttendence.Text = eventForEdit.Attendance.ToString();

                //added per Jake/Katie for MyOrgs project
                txtCreatedByUser.Text = eventForEdit.CreatedByUser;

                //added per Jake/Katie for MyOrgs project
                if (eventForEdit.RoomReserved == true)
                    CBroomreserved.Checked = true;
                if (eventForEdit.Marketing == true)
                    CBmarketing.Checked = true;
                if (eventForEdit.Catering == true)
                    CBcatering.Checked = true;
                if (eventForEdit.SignupForm == true)
                    CBsignupform.Checked = true;
                if (eventForEdit.ActivityWaiver == true)
                    CBactivitywaiver.Checked = true;
                if (eventForEdit.CUNight == true)
                    CBcunight.Checked = true;
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the event data!!";
            }
        }

        protected void gridIncidents_SelectedIndexChanged(object sender, EventArgs e)
        {

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
                    App_Data.OrgEvent eventForEdit = getCurrentEvent();
                    EventDAO.createEventComment(txtComments.Text, eventForEdit.Event_ID, today, HttpContext.Current.User.Identity.Name);
                    grdComments.DataSource = EventDAO.getCommentsByEventID(eventForEdit.Event_ID);
                    grdComments.DataBind();
                    txtComments.Text = string.Empty;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Comment not added!!";
            }
        }

        protected void btnEditEventMoreInfoCancel_Click1(object sender, EventArgs e)
        {
            UploadedDrivers.Clear();

            pnlEditing.Visible = true;
            btnCancelAll.Visible = true;
            btnSubmitAll.Visible = true;
            App_Data.OrgEvent eventForEdit = getCurrentEvent();
            txtEditEventBus.Text = eventForEdit.BusRental.ToString();
            txtEditEventVan.Text = eventForEdit.VanRental.ToString();
            txtEditEventDollarSpend.Text = eventForEdit.DollarsSpentByOrg.ToString();
            txtDollarSpentByPartner.Text = eventForEdit.DollarsSpentByPartner.ToString();

            //added per Jake/Katie for MyOrgs project
            txtCreatedByUser.Text = eventForEdit.CreatedByUser;

            UploadedDrivers = EventDAO.getDriversForEvent(Convert.ToInt32(eventForEdit.Driver1), Convert.ToInt32(eventForEdit.Driver2));
            grdEditEventDrivers.DataSource = UploadedDrivers;
            grdEditEventDrivers.DataBind();
        }

        protected void btnCancelComments_Click(object sender, EventArgs e)
        {
            txtComments.Text = string.Empty;
        }

        public List<StudentList> UploadedDrivers
        {
            get
            {
                var list = (List<StudentList>)(ViewState["DriverListEdit"] ??
                    new List<StudentList>());
                ViewState["DriverListEdit"] = list;
                return list;
            }
            set
            {
                ViewState["DriverListEdit"] = value;
            }
        }

        protected void grdEditEventDrivers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int stuID = Convert.ToInt32(grdEditEventDrivers.Rows[e.RowIndex].Cells[3].Text);
                driverList = UploadedDrivers;

                for (int i = 0; i < driverList.Count; ++i)
                {
                    if (driverList[i].Student_ID == stuID)
                    {
                        UploadedDrivers.RemoveAt(i);
                    }
                }

                grdEditEventDrivers.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Driver not deleted!!";
            }
        }

        protected void grdEditEventDrivers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
                e.Row.Cells[3].Visible = false;
            }
        }

        protected void btnEditEventAddDriver_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlSelectDrivers.SelectedIndex != -1)
                {
                    driverList = UploadedDrivers;
                    StudentList driver = EventDAO.getDriverByStudID(Convert.ToInt32(ddlSelectDrivers.SelectedItem.Value));
                    driver.Student_ID = Convert.ToInt32(ddlSelectDrivers.SelectedItem.Value);
                    UploadedDrivers.Add(driver);
                    grdEditEventDrivers.DataBind();
                    ddlSelectDrivers.SelectedIndex = -1;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Driver not added!!";
            }
        }

        protected void bntDeleteAll_Click(object sender, EventArgs e)
        {
            App_Data.OrgEvent eventForEdit = getCurrentEvent();
            EventDAO.deleteEvent(eventForEdit.Event_ID);

            clearAlltext();

            //we need to re-retrieve the gridediteventresults list after the delete.
            int idorganization = Convert.ToInt32(ddlSelectOrganization.SelectedValue);
            gridediteventresults.DataSource = EventDAO.getEventByOrgID(idorganization);
            gridediteventresults.DataBind();
        }
    }
}