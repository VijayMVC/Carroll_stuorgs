using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class AdvisorDAO
    {

        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public IList getAdvisorList()
        {
            List<AdvisorList> advisors = new List<AdvisorList>();
            var advis = dataContext.sp_GetAdvisorList();
            foreach (var x in advis)
            {
                AdvisorList advisor = new AdvisorList();
                advisor.AdvisorID = x.Advisor_ID;
                advisor.LastName = x.LastName;
                advisor.FirstName = x.FirstName;
                advisor.Name = x.LastName + ", " + x.FirstName;
                advisors.Add(advisor);
            }
            return advisors;
        }
        public IList getOrganizationForAdvisor(int advID)
        {
            List<OrgForAdvisorList> orgs = new List<OrgForAdvisorList>();
            var organization = dataContext.sp_GetOrgForAdvisor(advID);
            foreach (var x in organization)
            {
                OrgForAdvisorList  org = new OrgForAdvisorList();
                org.Name = x.OrganizationName;
                if (x.StartDate != null)
                    org.StartDate = Convert.ToDateTime(x.StartDate).ToShortDateString();
                else
                    org.StartDate = "";
                if (x.EndDate != null)
                    org.EndDate = Convert.ToDateTime(x.EndDate).ToShortDateString();
                else
                    org.EndDate = "";
                orgs.Add(org);
            }
            return orgs;
        
        }
        public List<AdvisorList> getAdvisorsForOrg(int orgID)
        {
            List<AdvisorList> advisors = new List<AdvisorList>();
            var advis = dataContext.sp_GetAdvisorListForOrgID(orgID);
            foreach (var x in advis)
            {
                AdvisorList advisor = new AdvisorList();
                advisor.AdvisorID = x.Advisor_ID;
                advisor.LastName = x.LastName;
                advisor.FirstName = x.FirstName;
                advisor.Name = x.FirstName + " " + x.LastName;
                if (x.offCampus == true)
                {
                    advisor.Type = "Community";
                }
                else
                    advisor.Type = "Carroll";
                advisors.Add(advisor);                
            }
            return advisors;
        }

        public AdvisorList getAdvisorByAdvID(int advID)
        {
            AdvisorList advisor = new AdvisorList();
            var adv = dataContext.sp_GetAdvisorByAdvID(advID).First();
            advisor.AdvisorID = adv.Advisor_ID;
            advisor.LastName = adv.LastName;
            advisor.FirstName = adv.FirstName;
            advisor.Name = adv.FirstName + " " + adv.LastName;
            if (adv.offCampus == true)
            {
                advisor.Type = "Community";
            }
            else
                advisor.Type = "Carroll";

            return advisor;
        }

        public StudentOrganisationApp.App_Data.Advisor getAdvisorByID(int advID)
        {
            var adv = dataContext.sp_GetAdvisorByID(advID).First();
            StudentOrganisationApp.App_Data.Advisor advisor = new App_Data.Advisor();
            advisor.FirstName = adv.FirstName;
            advisor.LastName = adv.LastName;
            advisor.Email = adv.Email;
            advisor.PhoneNumber = adv.PhoneNumber;
            advisor.OffCampus = adv.OffCampus;
            advisor.AdvisorTitle = adv.AdvisorTitle;
            advisor.ProfessionalTitle = adv.ProfessionalTitle;

            return advisor;
        }

        public bool createAdvisor(string lastName, string firstName, string emailID, string phoneNO, bool offCampus,string advisorTitle,string professionalTitle)
        {
            dataContext.sp_NewAdvisor(lastName, firstName, emailID, phoneNO, offCampus,advisorTitle,professionalTitle);
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

        public bool updateAdvisor(int advID, string lastName, string firstName, string emailID, string phoneNO, bool offCampus,string advisorTitle,string professionalTitle)
        {
            dataContext.sp_UpdateAdvisor(advID, lastName, firstName, emailID, phoneNO, offCampus,advisorTitle,professionalTitle);
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