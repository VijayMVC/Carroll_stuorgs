using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.App_Data;
using StudentOrganisationApp.Data_Access;
using System.Data;
using System.IO;
using System.Data.SqlClient;

namespace StudentOrganisationApp.Reports
{
    public partial class CXExport : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinqDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

            e.Result = dataContext.sp_GetHistoryOfMembers();

        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            //added commas after the header names
            dtTemp.Columns.Add("CX_CODE,");
            dtTemp.Columns.Add("CARROLL_ID,");
            dtTemp.Columns.Add("SESSION,");
            dtTemp.Columns.Add("YEAR,");
            dtTemp.Columns.Add("POSITION,");

            DataRow drAddItem;
            var query = dataContext.sp_GetHistoryOfMembers();
            int i = 0;
            string carrollID = string.Empty;
            foreach (var r in query)
            {

                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.CX_Code;
                carrollID = r.Carroll_ID.ToString();
                if (r.Carroll_ID.ToString().Length < 10)
                {
                    for (int j = 0; j < (10 - r.Carroll_ID.ToString().Length); ++j)
                    {
                        carrollID = carrollID + " ";
                    }
                }
                drAddItem[1] = carrollID;
                drAddItem[2] = r.Session;
                drAddItem[3] = r.Year;
                drAddItem[4] = r.MemberName;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            //changed from ExporttoText to ExporttoExcel on 6.2.2016 - SMC
            Export.ExportToExcel(dtTemp, "Export.csv");
        }
    }
}