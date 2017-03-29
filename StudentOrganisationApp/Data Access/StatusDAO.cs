using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class StatusDAO 
    {

        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public IList getStatus()
        {
            IList status = new List<StudentOrganisationApp.App_Data.Status>();
            var stat = dataContext.sp_GetStatus();
            status = stat.ToList();
            return status;
        } 
    }
}