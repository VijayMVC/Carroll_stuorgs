using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class OrgcategoryDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public IList getOrgCategoryList()
        {
            List<StudentOrganisationApp.App_Data.OrgCategory> orgCategories = new List<StudentOrganisationApp.App_Data.OrgCategory>();
            var orgCat = dataContext.sp_GetOrgCategoryList();
            foreach (var x in orgCat)
            {
                StudentOrganisationApp.App_Data.OrgCategory orgCategory = new StudentOrganisationApp.App_Data.OrgCategory();
                orgCategory.Category_ID = x.Category_ID;
                orgCategory.CategoryName = x.CategoryName;              
                orgCategories.Add(orgCategory);
            }
            return orgCategories;
        }

        public StudentOrganisationApp.App_Data.OrgCategory getOrgCategoryByID(int catID)
        {
            var orgCat = dataContext.sp_GetOrgCategoryByID(catID).First();
            StudentOrganisationApp.App_Data.OrgCategory orgCategory = new App_Data.OrgCategory();
            orgCategory.CategoryName = orgCat.CategoryName;
            orgCategory.Description = orgCat.Description;
            orgCategory.EndDate = orgCat.EndDate;
            orgCategory.AddDate = orgCat.AddDate;
            orgCategory.GreekOrg = orgCat.GreekOrg;

            return orgCategory;
        }

        public bool createOrgCategory(string categoryName, string description, string addDate, string endDate, bool greekOrg)
        {
            dataContext.sp_NewOrgCategory(categoryName, description, addDate, endDate, greekOrg);
            try
            {
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;

        }

        public bool updateOrgCategory(int catID, string categoryName, string description, string addDate, string endDate, bool greekOrg)
        {
            dataContext.sp_UpdateOrgCategory(catID, categoryName, description, addDate, endDate, greekOrg);
            try
            {
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}