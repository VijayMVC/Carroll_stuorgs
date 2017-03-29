using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.App_Data;
using System.Data;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp.Reports
{
    public partial class ActiveUsers : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        private void loadGrid()
        {
            char? incl_inact;

            if (incl_inactive.Checked)
            {
                incl_inact = 'Y';
            }
            else
            {
                incl_inact = 'N';
            }

            grdReport.DataSource = dataContext.sp_Report_ActiveUsers(incl_inact);
            grdReport.DataBind();

            int count = grdReport.Rows.Count;
            lbl_count.Text = "Total Count: " + count.ToString();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("User Name");
            dtTemp.Columns.Add("First Name");
            dtTemp.Columns.Add("Last Name");
            dtTemp.Columns.Add("Email");
            dtTemp.Columns.Add("Phone");
            dtTemp.Columns.Add("Role");
            dtTemp.Columns.Add("Active?");
            dtTemp.Columns.Add("Limited Org Count");

            DataRow drAddItem;

            char? incl_inact;

            if (incl_inactive.Checked)
            {
                incl_inact = 'Y';
            }
            else
            {
                incl_inact = 'N';
            }

            int i = 0;
            var query = dataContext.sp_Report_ActiveUsers(incl_inact);
            foreach (var r in query)
            {
                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.UserName;
                drAddItem[1] = r.Firstname;
                drAddItem[2] = r.Lastname;
                drAddItem[3] = r.EmailAddress;
                drAddItem[4] = r.PhoneNumber;
                drAddItem[5] = r.Role_Name;
                drAddItem[6] = r.Active;
                drAddItem[7] = r.LimitedOrgCount;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "AllUsers_Filtered.xlsx");
        }

        protected void incl_inactive_CheckedChanged(object sender, EventArgs e)
        {
            loadGrid();
        }
    }
}