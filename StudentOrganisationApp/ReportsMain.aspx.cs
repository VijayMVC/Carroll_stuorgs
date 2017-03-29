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

namespace StudentOrganisationApp
{
    public partial class ReportsMain : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void lnkActiveMembers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/ActiveMembers.aspx");
        }

        protected void lnkExecutiveMembers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/ExecutiveMembers.aspx");
        }

        protected void lnkDeactivatedOrganizations_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/DeactivatedOrganizations.aspx");
        }

        protected void lnkStudentRoster_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/StudentRoster.aspx");
        }

        protected void lnkHistoryOfMembers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/CXExport.aspx");
        }

        protected void lnkAllMembers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/AllMembers.aspx");
        }

        protected void lnkUpcomingEvents_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/UpcomingEvents.aspx");
        }

        protected void lnkGPAfail_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/ExecMemberGPAFail.aspx");
        }     

        protected void lnkOrgDump_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("OrganizationName");
			dtTemp.Columns.Add("CX_Code");
			dtTemp.Columns.Add("MeetingDay");
            dtTemp.Columns.Add("Organization.MeetingFrequency");
			dtTemp.Columns.Add("MeetingTime");
			dtTemp.Columns.Add("MeetingBuilding");
			dtTemp.Columns.Add("MeetingRoom");
			dtTemp.Columns.Add("DateProposed");
			dtTemp.Columns.Add("ProposalAccepted");
			dtTemp.Columns.Add("ProposalDenied");
			dtTemp.Columns.Add("ConstitutionSubmitted");
			dtTemp.Columns.Add("ConstitutionAccepted");
			dtTemp.Columns.Add("RegistrarApproval");
			dtTemp.Columns.Add("RequirementsMet");
			dtTemp.Columns.Add("RequirementsMetDate");
			dtTemp.Columns.Add("ConstitutionDenied");
			dtTemp.Columns.Add("ConstitutionUpdated");			
			dtTemp.Columns.Add("CategoryName");
			dtTemp.Columns.Add("StatusName");
			dtTemp.Columns.Add("StartDate");
			dtTemp.Columns.Add("EndDate");
			dtTemp.Columns.Add("Carroll_ID");
			dtTemp.Columns.Add("LastName");
			dtTemp.Columns.Add("FirstName");			
			dtTemp.Columns.Add("MemberName");
			dtTemp.Columns.Add("BeginDate");
			dtTemp.Columns.Add("EndDate1");
			dtTemp.Columns.Add("Session");
			dtTemp.Columns.Add("Year");
			dtTemp.Columns.Add("ClassOF");
			dtTemp.Columns.Add("Email");
			dtTemp.Columns.Add("PreferredPhone");
			dtTemp.Columns.Add("Active");
			dtTemp.Columns.Add("Gender");			
			dtTemp.Columns.Add("Major");
			dtTemp.Columns.Add("Major2");
			dtTemp.Columns.Add("CertifiedDriver");
			dtTemp.Columns.Add("ApprovedDriver");
			dtTemp.Columns.Add("GPABoard");
            dtTemp.Columns.Add("GPAOrg");
			dtTemp.Columns.Add("GreekGPA");

            //double dSalary;
            //DateTime dtDate;
            DataRow drAddItem;
            var query = dataContext.sp_GetOrgAndStudentDump();
            //for (int i = 0; i < dtOriginal.Rows.Count; i++)
            int i=0;
            foreach (var r in query)
            {
                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.OrganizationName;
			    drAddItem[1] = r.CX_Code.ToString();
			    drAddItem[2] = r.MeetingDay;
			    drAddItem[3] = r.MeetingFrequency;
			    drAddItem[4] = r.MeetingTime;
			    drAddItem[5] = r.MeetingBuilding;
			    drAddItem[6] = r.MeetingRoom;
                drAddItem[7] = r.DateProposed == null ? string.Empty : Convert.ToDateTime(r.DateProposed).ToShortDateString();            
                drAddItem[8] = r.ProposalAccepted == null ? string.Empty : Convert.ToDateTime(r.ProposalAccepted).ToShortDateString();
                drAddItem[9] = r.ProposalDenied == null ? string.Empty : Convert.ToDateTime(r.ProposalDenied).ToShortDateString();
                drAddItem[10] = r.ConstitutionSubmitted == null ? string.Empty : Convert.ToDateTime(r.ConstitutionSubmitted).ToShortDateString();
                drAddItem[11] = r.ConstitutionAccepted == null ? string.Empty : Convert.ToDateTime(r.ConstitutionAccepted).ToShortDateString();
                drAddItem[12] = r.RegistrarApproval == null ? string.Empty : Convert.ToDateTime(r.RegistrarApproval).ToShortDateString();
			    drAddItem[13] = r.RequirementsMet;
                drAddItem[14] = r.RequirementsMetDate == null ? string.Empty : Convert.ToDateTime(r.RequirementsMetDate).ToShortDateString();
                drAddItem[15] = r.ConstitutionDenied == null ? string.Empty : Convert.ToDateTime(r.ConstitutionDenied).ToShortDateString();
                drAddItem[16] = r.ConstitutionUpdated == null ? string.Empty : Convert.ToDateTime(r.ConstitutionUpdated).ToShortDateString();	
			    drAddItem[17] = r.CategoryName;
			    drAddItem[18] = r.StatusName;
                drAddItem[19] = r.StartDate == null ? string.Empty : Convert.ToDateTime(r.StartDate).ToShortDateString();
                drAddItem[20] = r.EndDate == null ? string.Empty : Convert.ToDateTime(r.EndDate).ToShortDateString();
			    drAddItem[21] = r.Carroll_ID.ToString();
			    drAddItem[22] = r.LastName;
			    drAddItem[23] = r.FirstName;			
			    drAddItem[24] = r.MemberName;
                drAddItem[25] = r.BeginDate == null ? string.Empty : Convert.ToDateTime(r.BeginDate).ToShortDateString();
                drAddItem[26] = r.EndDate1 == null ? string.Empty : Convert.ToDateTime(r.EndDate1).ToShortDateString();
			    drAddItem[27] = r.Session;
			    drAddItem[28] = r.Year;
			    drAddItem[29] = r.ClassOF;
			    drAddItem[30] = r.Email;
			    drAddItem[31] = r.PreferredPhone;
			    drAddItem[32] = r.Active;

                if (r.Gender == true)
                {
                    drAddItem[33] = "Male";
                }
                else
                {
                    drAddItem[33] = "Female";
                }

                drAddItem[34] = r.Major;
                drAddItem[35] = r.Major2;
                drAddItem[36] = r.CertifiedDriver;
                drAddItem[37] = r.ApprovedDriver;
                drAddItem[38] = r.GPABoard;
                drAddItem[39] = r.GPAOrg;
                drAddItem[40] = r.GreekGPA;			

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }

            Export.ExportToExcel(dtTemp,"OrganizationDump.xlsx");       
        }

        protected void lnkActiveUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reports/ActiveUsers.aspx");
        }
    }
}