using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.App_Data;
using StudentOrganisationApp.Data_Access;
using System.Data;

namespace StudentOrganisationApp.Reports
{
    public partial class StudentRoster : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinqDataSource_Selecting(object sender,LinqDataSourceSelectEventArgs e)
        {

            e.Result = dataContext.sp_GetActiveMembersInfoForAllOrganization();

        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("Organization");
            dtTemp.Columns.Add("CarrollID");
            dtTemp.Columns.Add("FirstName");
            dtTemp.Columns.Add("LastName");
            dtTemp.Columns.Add("Email");
            dtTemp.Columns.Add("MemberType");
            dtTemp.Columns.Add("GPABoard");
            dtTemp.Columns.Add("GPAOrg");
            dtTemp.Columns.Add("Status");

            DataRow drAddItem;
            var query = dataContext.sp_GetActiveMembersInfoForAllOrganization();
            int i = 0;
            foreach (var r in query)
            {

                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.OrganizationName;
                drAddItem[1] = r.Carroll_ID;
                drAddItem[2] = r.FirstName;
                drAddItem[3] = r.LastName;
                drAddItem[4] = r.Email;
                drAddItem[5] = r.MemberName;
                drAddItem[6] = r.GPABoard;
                drAddItem[7] = r.GPAOrg;
                drAddItem[8] = r.StatusName;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "StudentRoster.xlsx");
        }
    }
}