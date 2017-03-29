using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp.Events
{
    public partial class CreateEvents : System.Web.UI.Page
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
                    tabContainerNewEvent.ActiveTabIndex = 0;
                    ddlNewEventOrgEncharge.DataSource = OrganizationDAO.getOrganizationList();
                    ddlNewEventOrgEncharge.DataTextField = "OrganizationName";
                    ddlNewEventOrgEncharge.DataValueField = "Organization_ID";
                    ddlNewEventOrgEncharge.DataBind();

                    ddlSelectDrivers.DataSource = EventDAO.getStudentDriverList();
                    ddlSelectDrivers.DataTextField = "Name";
                    ddlSelectDrivers.DataValueField = "Student_ID";
                    ddlSelectDrivers.DataBind();

                    if (ViewState["DriverList"] == null)
                    {
                        ViewState["DriverList"] = new List<StudentList>();
                    }
                }
                grdNewEventDrivers.DataSource = UploadedDrivers;
                grdNewEventDrivers.DataBind();

                txtCreatedByUser.Text = HttpContext.Current.User.Identity.Name;
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the event dates!!";
            }
           
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerNewEvent.ActiveTabIndex;
            tabContainerNewEvent.ActiveTab = tabContainerNewEvent.Tabs[++tabIndex];
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            int tabIndex = tabContainerNewEvent.ActiveTabIndex;
            tabContainerNewEvent.ActiveTab = tabContainerNewEvent.Tabs[--tabIndex];
        }

        protected void btnNewEventCancel_Click(object sender, EventArgs e)
        {
            clearTextMain();
        }

        protected void btnCancelComments_Click(object sender, EventArgs e)
        {
            clearTextComments();
        }

        protected void btnNewEventMoreInfoCancel_Click(object sender, EventArgs e)
        {
            clearTextMoreInfo();
        }


        private void clearTextComments()
        {
            txtComments.Text = string.Empty;
        }

        private void clearTextMoreInfo()
        {
            txtNewEventDollarSpend.Text = string.Empty;
            txtNewEventDollarSpendByPartner.Text = string.Empty;
            txtNewEventBus.Text = string.Empty;
            txtNewEventVan.Text = string.Empty;

            CBroomreserved.Checked = false;
            CBmarketing.Checked = false;
            CBcatering.Checked = false;
            CBsignupform.Checked = false;
            CBactivitywaiver.Checked = false;
            CBcunight.Checked = false;

            ddlSelectDrivers.SelectedIndex = -1;
            UploadedDrivers.Clear();
            grdNewEventDrivers.DataBind();
        }

        private void clearTextMain()
        {
            txtNewEventTitle.Text = string.Empty;
            txtNewEventTime.Text = string.Empty;
            txtNewEventDate.Text = string.Empty;
            txtNewEventLocation.Text = string.Empty;
            txtNewEventDescription.Text = string.Empty;
            txtNewEventOrgWorkedWith.Text = string.Empty;
            txtNewEventPhone.Text = string.Empty;
            txtNewEventAttendence.Text = string.Empty;
            txtNewEventEmailID.Text = string.Empty;
            txtNewEventContactPerson.Text = string.Empty;
            txtCreatedByUser.Text = string.Empty;

            ddlNewEventOrgEncharge.SelectedIndex = -1;
            chkEventLocationOffCampus.Checked = false;

            CBroomreserved.Checked = false;
            CBmarketing.Checked = false;
            CBcatering.Checked = false;
            CBsignupform.Checked = false;
            CBactivitywaiver.Checked = false;
            CBcunight.Checked = false;
         }

        protected void btnNewEventRemoveDriver_Click(object sender, EventArgs e)
        {

        }

        protected void btnNewEventAddDriver_Click(object sender, EventArgs e)
        {
            try
            {
                driverList = UploadedDrivers;
                StudentList driver = EventDAO.getDriverByStudID(Convert.ToInt32(ddlSelectDrivers.SelectedItem.Value));
                driver.Student_ID = Convert.ToInt32(ddlSelectDrivers.SelectedItem.Value);
                UploadedDrivers.Add(driver);
                grdNewEventDrivers.DataBind();
                ddlSelectDrivers.SelectedIndex = -1;
            }
            catch (Exception)
            {
                lblMessage.Text = "Driver not added!!";
            }
        }
     

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                driverList = UploadedDrivers;
                //bool eventtype = false;
                //if(rblEventType.SelectedIndex == 0)
                //{
                //    eventtype = true;
                //}
                string driver2 = null;
                string driver1 = null;
                if (driverList.Count >= 1)
                {
                    driver1 = driverList[0].Student_ID.ToString();
                }
                if (driverList.Count >= 2)
                {
                    driver2 = driverList[1].Student_ID.ToString();
                }

                EventDAO.createEvent(Convert.ToInt32(ddlNewEventOrgEncharge.SelectedItem.Value), string.IsNullOrEmpty(txtNewEventDate.Text) ? null : txtNewEventDate.Text, txtNewEventTime.Text,
                    txtNewEventLocation.Text, txtNewEventDescription.Text, txtNewEventOrgWorkedWith.Text, txtNewEventPhone.Text,
                    txtNewEventEmailID.Text, string.IsNullOrEmpty(txtNewEventAttendence.Text) ? null : txtNewEventAttendence.Text,
                    "0", //removed field
                    string.IsNullOrEmpty(txtNewEventDollarSpend.Text) ? null : txtNewEventDollarSpend.Text,
                    txtNewEventTitle.Text, true, chkEventLocationOffCampus.Checked, string.IsNullOrEmpty(txtNewEventVan.Text) ? null : txtNewEventVan.Text,
                    string.IsNullOrEmpty(txtNewEventBus.Text) ? null : txtNewEventBus.Text, txtNewEventContactPerson.Text, string.IsNullOrEmpty(driver1) ? null : driver1,
                    string.IsNullOrEmpty(driver2) ? null : driver2, txtComments.Text, DateTime.Now.ToString(), HttpContext.Current.User.Identity.Name,
                    string.IsNullOrEmpty(txtNewEventDollarSpendByPartner.Text) ? null : txtNewEventDollarSpendByPartner.Text,
                    CBroomreserved.Checked ? 1 : 0, CBmarketing.Checked ? 1 : 0, CBcatering.Checked ? 1 : 0, CBsignupform.Checked ? 1 : 0,
                    CBactivitywaiver.Checked ? 1 : 0, CBcunight.Checked ? 1 : 0);

                clearTextComments();
                clearTextMain();
                clearTextMoreInfo();
                tabContainerNewEvent.ActiveTabIndex = 0;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Event not added!!";
            }
        }

        protected void grdNewEventDrivers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int stuID = Convert.ToInt32(grdNewEventDrivers.Rows[e.RowIndex].Cells[3].Text);
                driverList = UploadedDrivers;

                for (int i = 0; i < driverList.Count; ++i)
                {
                    if (driverList[i].Student_ID == stuID)
                    {
                        UploadedDrivers.RemoveAt(i);
                    }
                }
                grdNewEventDrivers.DataBind();
            }
            catch (Exception)
            {
                lblMessage.Text = "Driver not deleted!!";
            }
        }

        public List<StudentList> UploadedDrivers
        {
            get
            {
                var list = (List<StudentList>)(ViewState["DriverList"] ??
                    new List<StudentList>());
                ViewState["DriverList"] = list;
                return list;
            }
            set
            {
                ViewState["DriverList"] = value;
            }
        }

        //To make columns invisible
        protected void grdNewEventDrivers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
             {
                 e.Row.Cells[1].Visible = false;
                 e.Row.Cells[2].Visible = false;
                 e.Row.Cells[3].Visible = false;
             }
        }
    }
}