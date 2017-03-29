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

namespace StudentOrganisationApp
{
    public partial class ActiveMembers : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            grdReport.DataSource =  dataContext.sp_GetActiveMembersForAllOrganization(txtBeginDate.Text, txtEndDate.Text);           
            grdReport.DataBind();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("Organization");
            dtTemp.Columns.Add("Number of Members");

            DataRow drAddItem;
            var query = dataContext.sp_GetActiveMembersForAllOrganization(txtBeginDate.Text, txtEndDate.Text);
            int i = 0;
            foreach (var r in query)
            {

                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.OrganizationName;
                drAddItem[1] = r.Number_of_Members;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "ActiveMemberStats.xlsx");
        }

    }
}