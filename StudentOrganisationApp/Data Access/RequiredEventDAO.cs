using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class RequiredEventDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public bool createRequiredEvent(string reqName, string reqDescription,string addDate)
        {
            dataContext.sp_NewRequiredEvent(reqName, reqDescription, addDate);
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

        public bool createMeeting(int reqID,string session,string year,string meetingDate,string meetingTime,string meetingBuilding,string meetingRoomNumber,string notes)
        {
            dataContext.sp_InsertOrganizationRequirementMeeting(reqID, session, year, meetingDate, meetingTime, meetingBuilding, meetingRoomNumber, notes);
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

        public bool updateMeeting(int reqID, int meetingID, string session, string year, string meetingDate, string meetingTime, string meetingBuilding, string meetingRoomNumber, string notes)
        {
            
            try
            {
                dataContext.sp_UpdateOrganizationRequirementMeetingByReqIDMeetID(reqID, meetingID, session, year, meetingDate, meetingTime, meetingBuilding, meetingRoomNumber, notes);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public bool updateRequiredEvent(string requiredEvent,string eventDescription,string addDate,int reqID)
        {
            try
            {
                dataContext.sp_UpdateRequiredEvent(requiredEvent,eventDescription,addDate,reqID);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public RequiredEventMeeting getMeetingByreqIDmeetID(int reqID,int meetID)
        {
            RequiredEventMeeting meeting = new RequiredEventMeeting();
            var meet = dataContext.sp_GetOrganizationRequirementMeetingByReqIDMeetID(reqID, meetID).First();
            meeting.RequiredEventID = meet.RequiredEventID;
            meeting.Session = meet.Session;
            meeting.Year = meet.Year;
            meeting.MeetingBuilding = meet.MeetingBuilding;
            meeting.MeetingDate = meet.MeetingDate;
            meeting.MeetingID = meet.MeetingID;
            meeting.MeetingRoomNumber = meet.MeetingRoomNumber;
            meeting.MeetingTime = meet.MeetingTime;
            return meeting;
        }

        public RequiredEvent getRequiredEventByID(int reqID)
        {
            RequiredEvent reqEvent = new RequiredEvent();
            var meet = dataContext.sp_GetRequiredEventByID(reqID).First();
            reqEvent.AddDate = meet.AddDate;
            reqEvent.RequiredEvent1 = meet.RequiredEvent;
            reqEvent.RequiredEvent_ID = meet.RequiredEvent_ID;
            reqEvent.EventDescription = meet.EventDescription;                   
            return reqEvent;        
        }

        public List<RequiredEventMeeting> getMeetingForReqEventID(int reqID)
        {
            List<RequiredEventMeeting> meetings = new List<RequiredEventMeeting>();
            var meet = dataContext.sp_GetMeetingForReqEventID(reqID);
            foreach (var x in meet)
            {
                RequiredEventMeeting meeting = new RequiredEventMeeting();
                meeting.RequiredEventID = x.RequiredEventID;
                meeting.Session = x.Session;
                meeting.Year = x.Year;
                meeting.MeetingBuilding = x.MeetingBuilding;
                meeting.MeetingDate = x.MeetingDate;
                meeting.MeetingID = x.MeetingID;
                meeting.MeetingRoomNumber = x.MeetingRoomNumber;
                meeting.MeetingTime = x.MeetingTime;
                meeting.Notes = x.Notes;

                meetings.Add(meeting);
            }
            return meetings;
        }

        public List<RequiredEventMeeting> getMeetingToSignUP(int reqID, int orgID)
        {
            
            List<RequiredEventMeeting> meetings = new List<RequiredEventMeeting>();           
            var meet = dataContext.sp_GetMeetingForOrgTOSignedUP(reqID, orgID);
            
                foreach (var x in meet)
                {
                    RequiredEventMeeting meeting = new RequiredEventMeeting();
                    meeting.RequiredEventID = x.RequiredEventID;
                    meeting.Session = x.Session;
                    meeting.Year = x.Year;
                    meeting.MeetingBuilding = x.MeetingBuilding;
                    meeting.MeetingDate = x.MeetingDate;
                    meeting.MeetingID = x.MeetingID;
                    meeting.MeetingRoomNumber = x.MeetingRoomNumber;
                    meeting.MeetingTime = x.MeetingTime;

                    meetings.Add(meeting);
                }        
            return meetings;
        }

        public List<RequiredEventMeeting> getMeetingSignedUP(int reqID, int orgID)
        {
            List<RequiredEventMeeting> meetings = new List<RequiredEventMeeting>();
            var meet = dataContext.sp_GetMeetingForOrgSignedUP(reqID, orgID);
            foreach (var x in meet)
            {
                RequiredEventMeeting meeting = new RequiredEventMeeting();
                meeting.RequiredEventID = x.RequiredEventID;
                meeting.Session = x.Session;
                meeting.Year = x.Year;
                meeting.MeetingBuilding = x.MeetingBuilding;

                //Usind Meeting Time to store short datetime
                meeting.MeetingTime = Convert.ToDateTime(x.MeetingDate).ToShortDateString();

                meeting.MeetingDate = x.MeetingDate;
                meeting.MeetingID = x.MeetingID;
                meeting.MeetingRoomNumber = x.MeetingRoomNumber;
                //meeting.MeetingTime = x.MeetingTime;

                meetings.Add(meeting);
            }
            return meetings;
        }

        public List<RequiredEventMeeting> getMeetingSignedUPForDate(int reqID, int orgID, string Date)
        {
            List<RequiredEventMeeting> meetings = new List<RequiredEventMeeting>();
            var meet = dataContext.sp_GetMeetingForOrgSignedUPForDate(reqID, orgID,Date);
            foreach (var x in meet)
            {
                RequiredEventMeeting meeting = new RequiredEventMeeting();
                meeting.RequiredEventID = x.RequiredEventID;
                meeting.Session = x.Session;
                meeting.Year = x.Year;
                meeting.MeetingBuilding = x.MeetingBuilding;
                meeting.MeetingDate = x.MeetingDate;
                meeting.MeetingID = x.MeetingID;
                meeting.MeetingRoomNumber = x.MeetingRoomNumber;
                meeting.MeetingTime = x.MeetingTime;

                meetings.Add(meeting);
            }
            return meetings;
        }

        public void newOrgRequiredEventMeeting(int orgID, int meetID)
        {
            dataContext.sp_NewMeetingForOrganizationRequirement(orgID, meetID);
        }

        public void updateOrgRequiredEventMeeting(int meetID,int orgID, int studID1,int studID2)
        {
            dataContext.sp_UpdateMeetingForOrganizationRequirement(orgID, meetID, studID1, studID2);
        }
        public IList getRequiredEventList()
        {
            List<RequiredEvent> events = new List<RequiredEvent>();
            var evn = dataContext.sp_GetRequiredEventList();
            foreach (var x in evn)
            {
                RequiredEvent even = new RequiredEvent();
                even.AddDate = x.AddDate;
                even.EventDescription = x.EventDescription;
                even.RequiredEvent_ID = x.RequiredEvent_ID;
                even.RequiredEvent1 = x.RequiredEvent;
                events.Add(even);
            }
            return events;
        }
    }
}