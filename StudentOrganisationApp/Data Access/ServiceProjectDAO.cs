using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class ServiceProjectDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public bool createServiceProject(int orgID,string CP,string CPCName,string CPCPhone,string CPCEmail,string noOfVolunteers,string hoursVolunteered,
                                        string description,bool onGoing,string location,string startDate,string endDate,string timeFrom,string timeTo,
                                        string CommentText,string  CommentDate,string  userName,string meetDay,string meetFrequency,string title,string funds,
                                        int planned_vols, decimal planned_hrs, string planned_funds)
        {
            try
            {
                dataContext.sp_NewServiceProject(orgID,CP,CPCName,CPCPhone,CPCEmail,noOfVolunteers,hoursVolunteered,description,onGoing,location,startDate,
                                                endDate,timeFrom,timeTo, CommentText, CommentDate, userName,meetDay,meetFrequency,title,funds,
                                                planned_vols, planned_hrs, planned_funds);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;

        }
        public IList getCommentsBySPID(int SPID)
        {
            IList comments = new List<EventComment>();
            var comment = dataContext.sp_GetCommentsByServiceProjectID(SPID);
            comments = comment.ToList();
            return comments;
        }

        public bool createServiceProjectComment(string text, int eventID, string date, string userName)
        {

            dataContext.sp_NewServiceProjectComments(eventID, date, text, userName);
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
        public ServiceProject getServiceProjectByOrgIDDate(int orgID, string date)
        {

            ServiceProject serviceProject = new ServiceProject();
            try
            {
                var even = dataContext.sp_GetServiceProjectByOrgIDDate(orgID, date).First();
                serviceProject.ServiceProject_ID = even.ServiceProject_ID;
                serviceProject.CommunityPartner = even.CommunityPartner;
                serviceProject.Title = even.Title;
                serviceProject.ContactName = even.ContactName;
                serviceProject.ContactEmail = even.ContactEmail;
                serviceProject.ContactPhone = even.ContactPhone;
                serviceProject.NoOfVolunteers = even.NoOfVolunteers;
                serviceProject.OnGoing = even.OnGoing;
                serviceProject.HoursVolunteered = even.HoursVolunteered;
                serviceProject.Location = even.Location;
                serviceProject.Organization_ID = even.Organization_ID;
                serviceProject.Description = even.Description;
                serviceProject.StartDate = even.StartDate;
                serviceProject.EndDate = even.EndDate;
                serviceProject.TimeFrom = even.TimeFrom;
                serviceProject.TimeTo = even.TimeTo;
                serviceProject.MeetDay = even.MeetDay;
                serviceProject.Funds = even.Funds;
                serviceProject.MeetFrequency = even.MeetFrequency;
            }
            catch (Exception e)
            { 
            
            }

            return serviceProject;
        }
        public List<ShortDate> getServiceProjectDateByOrgID(int orgID)
        {
            List<ShortDate> dates = new List<ShortDate>();
            var dat = dataContext.sp_GetServiceProjectDatesByOrgID(orgID);
            foreach (var x in dat)
            {
                ShortDate date = new ShortDate();
                date.Date = Convert.ToDateTime(x.StartDate);
                date.SDate = Convert.ToDateTime(x.StartDate).ToShortDateString();
                dates.Add(date);
            }
            return dates;
        }

        public bool updateServiceProject(int SPID,int orgID, string CP, string CPCName, string CPCPhone, string CPCEmail, string noOfVolunteers, 
                                        string hoursVolunteered, string description, bool onGoing, string location, string startDate, string endDate, 
                                        string timeFrom, string timeTo, string meetDay, string meetFrequency, string title,string funds,
                                        int planned_vols, decimal planned_hrs, string planned_funds)
        {
            try
            {
                dataContext.sp_UpdateServiceProject(SPID, orgID, CP, CPCName, CPCPhone, CPCEmail, noOfVolunteers,hoursVolunteered,description,
                                                    onGoing,location,startDate,endDate,timeFrom,timeTo,meetDay,meetFrequency,title,funds,
                                                    planned_vols, planned_hrs, planned_funds);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
                
            }
            return true;

        }

        public ServiceProject getServiceProjectByID(int idservice)
        {
            ServiceProject service = new ServiceProject();

            try
            {
                var svc = dataContext.sp_GetServiceProject(idservice).First();

                service.Organization_ID = svc.Organization_ID;
                service.ServiceProject_ID = svc.ServiceProject_ID;
                service.OnGoing = svc.OnGoing;
                service.Planned_HoursVolunteered = svc.Planned_HoursVolunteered;
                service.Planned_NoOfVolunteers = svc.Planned_NoOfVolunteers;

                if (svc.Title == null) { service.Title = ""; }
                else { service.Title = svc.Title; }

                if (svc.Location == null) { service.Location = ""; }
                else { service.Location = svc.Location; }

                if (svc.CommunityPartner == null) { service.CommunityPartner = ""; }
                else { service.CommunityPartner = svc.CommunityPartner; }

                if (svc.ContactEmail == null) { service.ContactEmail = ""; }
                else { service.ContactEmail = svc.ContactEmail; }

                if (svc.ContactName == null) { service.ContactName = ""; }
                else { service.ContactName = svc.ContactName; }

                if (svc.ContactPhone == null) { service.ContactPhone = ""; }
                else { service.ContactPhone = svc.ContactPhone; }

                if (svc.Description == null) { service.Description = ""; }
                else { service.Description = svc.Description; }

                if (svc.Funds == null) { service.Funds = ""; }
                else { service.Funds = svc.Funds; }

                if (svc.Planned_Funds == null) { service.Planned_Funds = ""; }
                else { service.Planned_Funds = svc.Planned_Funds; }

                if (svc.TimeFrom == null) { service.TimeFrom = ""; }
                else { service.TimeFrom = svc.TimeFrom; }

                if (svc.TimeTo == null) { service.TimeTo = ""; }
                else { service.TimeTo = svc.TimeTo; }

                service.EndDate = svc.EndDate;
                service.StartDate = svc.StartDate;
                service.HoursVolunteered = svc.HoursVolunteered;
                service.MeetDay = svc.MeetDay;
                service.MeetFrequency = svc.MeetFrequency;
                service.NoOfVolunteers = svc.NoOfVolunteers;
            }
            catch (Exception e)
            {
            }

            return service;
        }

        public  object getServiceProjectByOrgIDDate(int orgid)
        {
            return dataContext.sp_GetServiceProjectByOrgID(orgid);
        }

        public bool deleteServiceProject(int service_id)
        {
            dataContext.sp_DeleteServiceProject(service_id);
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