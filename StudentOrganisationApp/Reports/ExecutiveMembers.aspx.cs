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
    public partial class ExecutiveMembers : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        OrganizationDAO OrganizationDAO = new OrganizationDAO();
        List<AdvisorList> advisorList = new List<AdvisorList>();
        AdvisorDAO AdvisorDAO = new AdvisorDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlSelectOrganization.DataSource = OrganizationDAO.getOrganizationList();
                ddlSelectOrganization.DataTextField = "OrganizationName";
                ddlSelectOrganization.DataValueField = "Organization_ID";
                ddlSelectOrganization.DataBind();
            }
        }

        protected void LinqDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

            if (ddlSelectOrganization.SelectedValue == "-1")
            {
                e.Result = dataContext.sp_GetExecutiveMembersForAllOrganization();
            }
            else
            {
                e.Result = dataContext.sp_GetExecutiveMembersForOrganizationID(Convert.ToInt32(ddlSelectOrganization.SelectedValue));
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("OrganizationName");
            dtTemp.Columns.Add("Carroll ID");
            dtTemp.Columns.Add("LastName");
            dtTemp.Columns.Add("FirstName");
            dtTemp.Columns.Add("MemberType");
           
            DataRow drAddItem;
            var query = dataContext.sp_GetExecutiveMembersForAllOrganization();           
            int i = 0;
            foreach (var r in query)
            {

                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.OrganizationName;
                drAddItem[1] = r.Carroll_ID;
                drAddItem[2] = r.LastName;
                drAddItem[3] = r.FirstName;
                drAddItem[4] = r.MemberName; 

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "ExecutiveMembers.xlsx");   
        }

    }
}