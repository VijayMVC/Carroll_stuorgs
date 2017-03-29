using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.App_Data;
using System.Collections;
using System.Data;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp.Reports
{
    public partial class UpcomingEvents : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtBeginDate.Text = DateTime.Today.ToShortDateString();

                //default the report to all upcoming events. They can then filter it if they want to.
                loadGrid(DateTime.Today, null);
            }
        }

        private void loadGrid(DateTime start, DateTime? end)
        {
            if (end == DateTime.MaxValue || end == null)
            {
                grdReport.DataSource = dataContext.sp_Report_UpcomingEvents(start, null);
            }
            else
            {
                grdReport.DataSource = dataContext.sp_Report_UpcomingEvents(start, end);
            }

            grdReport.DataBind();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("Organization");
            dtTemp.Columns.Add("Title");
            dtTemp.Columns.Add("Date");
            dtTemp.Columns.Add("Location");
            dtTemp.Columns.Add("Contact Name");
            dtTemp.Columns.Add("Contact Phone");
            dtTemp.Columns.Add("Contact Email");

            DataRow drAddItem;
            DateTime start;
            DateTime? end; //nullable date time value
            String ends, starts;

            starts = txtBeginDate.Text.Trim();
            if (starts.Equals(""))
            {
                //if no start date is specified, use today
                start = DateTime.Today;
            }
            else
            {
                start = Convert.ToDateTime(txtBeginDate.Text.Trim());
            }

            ends = txtEndDate.Text.Trim();
            if (ends.Equals(""))
            {
                end = null;
            }
            else
            {
                end = Convert.ToDateTime(txtEndDate.Text.Trim());
            }

            int i = 0;
            var query = dataContext.sp_Report_UpcomingEvents(start, end);
            foreach (var r in query)
            {
                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.OrganizationName;
                drAddItem[1] = r.Title;
                drAddItem[2] = r.ShortDate;
                drAddItem[3] = r.Location;
                drAddItem[4] = r.ContactName;
                drAddItem[5] = r.ContactPhone;
                drAddItem[6] = r.ContactEmail;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "Student_GPAfail.xlsx");
        }

        private DateTime getStartDate()
        {
            string starts;
            DateTime start;

            starts = txtBeginDate.Text.Trim();
            if (starts.Equals(""))
            {
                start = DateTime.Today;
                txtBeginDate.Text = DateTime.Today.ToShortDateString();
            }
            else
            {
                start = Convert.ToDateTime(txtBeginDate.Text.Trim());
            }

            return start;
        }

        private DateTime? getEndDate()
        {
            string ends;
            DateTime? end;

            ends = txtEndDate.Text.Trim();
            if (ends.Equals(""))
            {
                end = null;
            }
            else
            {
                end = Convert.ToDateTime(txtEndDate.Text.Trim());
            }

            return end;
        }

        protected void txtBeginDate_TextChanged(object sender, EventArgs e)
        {
            DateTime start;
            DateTime? end;

            start = getStartDate();
            end = getEndDate();

            loadGrid(start, end);
        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {
            DateTime start;
            DateTime? end; 
            
            start = getStartDate();
            end = getEndDate();

            loadGrid(start, end);
        }
    }
}