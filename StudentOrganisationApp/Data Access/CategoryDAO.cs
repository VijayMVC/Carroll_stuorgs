using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class CategoryDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public IList getCategory()
        {
            IList category = new List<OrgCategory>();
            var cate = dataContext.sp_GetOrgCategory();
            category = cate.ToList();
            return category;            
        } 
    }
}