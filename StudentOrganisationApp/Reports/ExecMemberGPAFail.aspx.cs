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
    public partial class ExecMemberGPAFail : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grdReport.DataSource = dataContext.sp_Report_GPAFail();
                grdReport.DataBind();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("Term");
            dtTemp.Columns.Add("Organization");
            dtTemp.Columns.Add("Member Type");
            dtTemp.Columns.Add("Carroll ID");
            dtTemp.Columns.Add("First Name");
            dtTemp.Columns.Add("Last Name");
            dtTemp.Columns.Add("Email");
            dtTemp.Columns.Add("GPA Board");
            dtTemp.Columns.Add("GPA Org");

            DataRow drAddItem;
            var query = dataContext.sp_Report_GPAFail();
            int i = 0;
            foreach (var r in query)
            {
                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.Term;
                drAddItem[1] = r.OrganizationName;
                drAddItem[2] = r.MemberName;
                drAddItem[3] = r.Carroll_ID;
                drAddItem[4] = r.FirstName;
                drAddItem[5] = r.LastName;
                drAddItem[6] = r.Email;
                drAddItem[7] = r.GPABoard;
                drAddItem[8] = r.GPAOrg;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "Student_GPAfail.xlsx");
        }
    }
}