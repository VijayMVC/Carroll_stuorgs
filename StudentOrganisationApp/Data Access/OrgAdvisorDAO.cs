using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp.Data_Access
{
    public class OrgAdvisor
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public void UpdateOrgAdvisor(int organizationID, int advisorID, DateTime startDate,DateTime endDate, string proffesionalTitle, string advisorTitle)
        {
            dataContext.sp_NewOrgAdvisor(organizationID, advisorID, startDate, endDate, proffesionalTitle, advisorTitle);
            dataContext.SubmitChanges();
        }

    }
}