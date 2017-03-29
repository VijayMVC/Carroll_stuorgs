using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using StudentOrganisationApp.Data_Access;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp.Reports
{
    public partial class DeactivatedOrganizations : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinqDataSource_Selecting(object sender,LinqDataSourceSelectEventArgs e)
        {
            e.Result = dataContext.sp_GetDeActivatedOrganizationList();
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("Organization");
            dtTemp.Columns.Add("Deactivated Date");

            DataRow drAddItem;
            var query = dataContext.sp_GetDeActivatedOrganizationList();
            int i = 0;
            foreach (var r in query)
            {

                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.OrganizationName;
                drAddItem[1] = r.Deactivated;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "DeactivatedOrganizations.xlsx");
        }

    }
}