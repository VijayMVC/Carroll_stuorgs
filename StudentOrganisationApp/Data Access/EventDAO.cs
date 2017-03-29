using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    
    public class EventDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();

        public IList getStudentDriverList()
        {
            List<StudentList> drivers = new List<StudentList>();
            var driv = dataContext.sp_GetDrivers();
            foreach (var x in driv)
            {
                StudentList driver = new StudentList();
                driver.Student_ID = x.Student_ID;
                driver.Name = x.FirstName+" "+x.LastName;
                if (x.CertifiedDriver == true)
                    driver.Drivertype = "Certified";
                else
                    driver.Drivertype = "Approved";
                drivers.Add(driver);
            }
            return drivers;
        }

        public List<ShortDate> getEventDateByOrgID(int orgID)
        {
            List<ShortDate> dates = new List<ShortDate>();
            var dat = dataContext.sp_GetEventDatesByOrgID(orgID);
            foreach (var x in dat)
            {
                ShortDate date = new ShortDate();
                date.Date = Convert.ToDateTime(x.Date);
                date.SDate = Convert.ToDateTime(x.Date).ToShortDateString();
                dates.Add(date);
            }
            return dates;
        }

        public object getEventByOrgID(int idorganization)
        {
            return dataContext.sp_GetEventByOrgID(idorganization);
        }

        public StudentList getDriverByStudID(int StudID)
        {
            StudentList driver = new StudentList();
            var stud = dataContext.sp_GetDriverByStuID(StudID).First();
            driver.FirstName = stud.FirstName;
            driver.LastName = stud.LastName;
            driver.Name = stud.FirstName + " " + stud.LastName;
            if (stud.CertifiedDriver == true)
                driver.Drivertype = "Certified";
            else
                driver.Drivertype = "Approved";
            return driver;
        }

        public bool createEvent(int orgID,string date,string time,string location,string description,string orgworkedwith,string contactPhone,string contactEmail,string attendence,
                string hoursVolunteered,string dollarsSpent, string title,bool eventType,bool onOffCampus,string vanRental,string busRental,string contactName,
                string driver1, string driver2, string CommentText, string CommentDate, string userName, string dollarSpentByPartner, int room_reserved, int event_marketing, 
                int event_catering, int signup_form, int activity_waiver, int cu_night)
        {
           
            try
            {
                bool roomreserved = false, marketing = false, catering = false, signupform = false, activitywaiver = false, cunight = false;

                if (room_reserved == 1) roomreserved = true;
                if (event_marketing == 1) marketing = true;
                if (event_catering == 1) catering = true;
                if (signup_form == 1) signupform = true;
                if (activity_waiver == 1) activitywaiver = true;
                if (cu_night == 1) cunight = true; 
                
                dataContext.sp_NewOrgEvent(orgID, date, time, location, description, orgworkedwith, contactPhone, contactEmail, attendence, 
                    hoursVolunteered, dollarsSpent, dollarSpentByPartner, title, eventType, onOffCampus, vanRental, busRental, contactName,
                    driver1, driver2, CommentText, CommentDate, userName, roomreserved, marketing, catering, signupform, activitywaiver, cunight);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }            
            return true;
        }

        public bool updateEvent(int eventID, int orgID, string date, string time, string location, string description, string orgworkedwith, string contactPhone, string contactEmail, string attendence, 
                string hoursVolunteered, string dollarsSpent, string dollarSpentByPartner, string title, bool onOffCampus, string vanRental, string busRental, string ContactPerson, 
                string driver1, string driver2, int room_reserved, int event_marketing, int event_catering, int signup_form, int activity_waiver, int cu_night)
        {
            try
            {
                bool roomreserved = false, marketing = false, catering = false, signupform = false, activitywaiver = false, cunight = false;

                if (room_reserved == 1) roomreserved = true;
                if (event_marketing == 1) marketing = true;
                if (event_catering == 1) catering = true;
                if (signup_form == 1) signupform = true;
                if (activity_waiver == 1) activitywaiver = true;
                if (cu_night == 1) cunight = true;

                dataContext.sp_UpdateOrgEvent(eventID, date, time, location, title, description, orgworkedwith, contactPhone, contactEmail, attendence, 
                    vanRental, busRental, ContactPerson, driver1, driver2, onOffCampus, hoursVolunteered, orgID, dollarsSpent, dollarSpentByPartner, 
                    roomreserved, marketing, catering, signupform, activitywaiver, cunight);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public OrgEvent getEventByEventID(int eventID)
        {
            OrgEvent orgevent = new OrgEvent();
            try
            {
                //forget the OR statement and just send 0 as the organization ID to get just this event.
                var even = dataContext.sp_GetOrgEvent(eventID, 0).First();

                orgevent.Event_ID = even.Event_ID;
                orgevent.Time = even.Time;
                orgevent.Title = even.Title;
                orgevent.Driver1 = even.Driver1;
                orgevent.Driver2 = even.Driver2;
                orgevent.Organization_ID = even.Organization_ID;
                orgevent.OrganizationWorkedWith = even.OrganizationWorkedWith;
                orgevent.OnOffCampus = even.OnOffCampus;
                orgevent.ContactName = even.ContactName;
                orgevent.Location = even.Location;
                orgevent.Date = even.Date;
                orgevent.Description = even.Description;
                orgevent.ContactPhone = even.ContactPhone;
                orgevent.ContactEmail = even.ContactEmail;
                orgevent.BusRental = even.BusRental;
                orgevent.VanRental = even.VanRental;
                orgevent.DollarsSpentByOrg = even.DollarsSpentByOrg;
                orgevent.DollarsSpentByPartner = even.DollarsSpentByPartner;
                orgevent.HoursVolunteered = even.HoursVolunteered;
                orgevent.Attendance = even.Attendance;
                orgevent.CreatedByUser = even.CreatedByUser;
                orgevent.RoomReserved = even.RoomReserved;
                orgevent.Marketing = even.Marketing;
                orgevent.Catering = even.Catering;
                orgevent.SignupForm = even.SignupForm;
                orgevent.ActivityWaiver = even.ActivityWaiver;
                orgevent.CUNight = even.CUNight;
            }
            catch (Exception)
            {
            }
            return orgevent;
        }

        public OrgEvent getEventByOrgIDDate(int orgID, string date)
        {
            OrgEvent orgevent = new OrgEvent();
            var even = dataContext.sp_GetEventByOrgIDDate(orgID, date).First();
            orgevent.Event_ID = even.Event_ID;
            orgevent.Time = even.Time;
            orgevent.Title = even.Title;
            orgevent.Driver1 = even.Driver1;
            orgevent.Driver2 = even.Driver2;
            orgevent.Organization_ID = even.Organization_ID;
            orgevent.OrganizationWorkedWith = even.OrganizationWorkedWith;
            orgevent.OnOffCampus = even.OnOffCampus;
            orgevent.ContactName = even.ContactName;
            orgevent.Location = even.Location;
            orgevent.Date = even.Date;
            orgevent.Description = even.Description;
            orgevent.ContactPhone = even.ContactPhone;
            orgevent.ContactEmail = even.ContactEmail;
            orgevent.BusRental = even.BusRental;
            orgevent.VanRental = even.VanRental;
            orgevent.DollarsSpentByOrg = even.DollarsSpentByOrg;
            orgevent.DollarsSpentByPartner = even.DollarsSpentByPartner;
            orgevent.HoursVolunteered = even.HoursVolunteered;
            orgevent.Attendance = even.Attendance;
            orgevent.CreatedByUser = even.CreatedByUser;
            orgevent.RoomReserved = even.RoomReserved;
            orgevent.Marketing = even.Marketing;
            orgevent.Catering = even.Catering;
            orgevent.SignupForm = even.SignupForm;
            orgevent.ActivityWaiver = even.ActivityWaiver;
            orgevent.CUNight = even.CUNight;

            return orgevent;
        }

        public List<StudentList> getDriversForEvent(int driver1,int driver2)
        {
            List<StudentList> drivers = new List<StudentList>();
            var driv = dataContext.sp_GetDriversForEvent(driver1, driver2);
            foreach (var x in driv)
            {
                StudentList driver = new StudentList();
                driver.Student_ID = x.Student_ID;
                driver.FirstName = x.FirstName;
                driver.LastName = x.LastName;
                driver.Name = x.FirstName + " " + x.LastName;
                if (x.CertifiedDriver == true)
                    driver.Drivertype = "Certified";
                else
                    driver.Drivertype = "Approved";
                drivers.Add(driver);
            }
            return drivers;
        }

        public IList getCommentsByEventID(int eventID)
        {
            IList comments = new List<EventComment>();
            var comment = dataContext.sp_GetCommentsByEventID(eventID);
            comments = comment.ToList();
            return comments;
        }

        public bool createEventComment(string text, int eventID, string date,string userName)
        {
            dataContext.sp_NewEventComments(eventID, date, text,userName);
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

        public bool deleteEvent(int event_id)
        {
            dataContext.sp_DeleteEvent(event_id);
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