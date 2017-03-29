using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class IncidentDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();      

        public IList getMembersByOrgID(int orgID)
        {
            List<MemberList> students = new List<MemberList>();
            var stud = dataContext.sp_GetMembersByOrgID(orgID);
            foreach (var x in stud)
            {
                MemberList student = new MemberList();
                student.Student_ID = x.Student_ID;
                student.FirstName = x.FirstName;
                student.LastName = x.LastName;
                student.Name = x.FirstName + " " + x.LastName;
                student.Position = x.MemberName;
                students.Add(student);
            }
            return students;
        }
        public List<ShortDate> getIncidentDateByOrgID(int orgID)
        {
            List<ShortDate> dates = new List<ShortDate>();
            var dat = dataContext.sp_GetIncidentDatesByOrgID(orgID);
            foreach (var x in dat)
            {
                ShortDate date = new ShortDate();
                date.Date = Convert.ToDateTime(x.Date);
                date.SDate = Convert.ToDateTime(x.Date).ToShortDateString();
                dates.Add(date);
            }
            return dates;
        }       
        public MemberList getMembersByStudID(int StudID)
        {
            MemberList student = new MemberList();
            var stud = dataContext.sp_GetMembersByStuID(StudID).First();            
            student.FirstName = stud.FirstName;
            student.LastName = stud.LastName;
            student.Name = stud.FirstName + " " + stud.LastName;
            student.Position = stud.MemberName;
              
            return student;
        }
        public List<MemberList> getPeopleInvoluvedForIncident(int inciID)
        {
            List<MemberList> members = new List<MemberList>();
            var memb = dataContext.sp_GetPeopleInvoluvedForIncident(inciID);
            foreach (var x in memb)
            {
                MemberList member = new MemberList();
                //member.Student_ID = x.Student_ID;
                member.FirstName = x.FirstName;
                member.LastName = x.LastName;
                member.Name = x.FirstName + " " + x.LastName;
                member.Position = x.MemberName;
                members.Add(member);
            }
            return members;
        }

        public List<NonMemberList> getNonMembersInvoluvedForIncident(int inciID)
        {
            List<NonMemberList> nonMembers = new List<NonMemberList>();
            var memb = dataContext.sp_GetNonMembersInvoluvedForIncident(inciID);
            foreach (var x in memb)
            {
                NonMemberList nonMember = new NonMemberList();
                nonMember.Name = x.NonMemberName;
                nonMember.ID = x.ID;
                nonMembers.Add(nonMember);
            }
            return nonMembers;
        }

        public Incident getIncidentByOrgIDDate(int orgID, string date)
        {
            Incident incident = new Incident();
            var inci = dataContext.sp_GetIncidentByOrgIDDate(orgID,date).First();
            incident.Incident_ID = inci.Incident_ID;
            incident.Notes = inci.Notes;
            incident.Location = inci.Location;
            incident.Date = inci.Date;
            incident.DateReported = inci.DateReported;
            incident.FollowUp = inci.FollowUp;
            incident.Notes = inci.Notes;
            incident.ReportedBy = inci.ReportedBy;
            incident.Organization_ID = inci.Organization_ID;
            incident.Result = inci.Result;
            incident.Incident1 = inci.Incident;
            return incident;
        }

        public Incident sp_GetIncidentByID(int idincident)
        {
            Incident incident = new Incident();
            var inci = dataContext.sp_GetIncidentByID(idincident).First();
            incident.Incident_ID = inci.Incident_ID;
            incident.Notes = inci.Notes;
            incident.Location = inci.Location;
            incident.Date = inci.Date;
            incident.DateReported = inci.DateReported;
            incident.FollowUp = inci.FollowUp;
            incident.Notes = inci.Notes;
            incident.ReportedBy = inci.ReportedBy;
            incident.Organization_ID = inci.Organization_ID;
            incident.Result = inci.Result;
            incident.Incident1 = inci.Incident;
            return incident;
        }

        public object getIncidentByOrgID(int orgID)
        {
            return dataContext.sp_GetIncidentByOrgID(orgID);
        }

        public bool createIncident(string date, string dateReported, string time, string location, string incident, string result, string notes, string followUp, int orgID, string reportedBy, List<MemberList> memberList,string commentText,string commentDate,string userName,List<NonMemberList> nonMemberList)
        {
            int? incidentID = 0;
            //bool incidentInserted = true;
           
            try
            { 
                dataContext.sp_NewIncident(date, dateReported, time, location, incident, result, notes, followUp, orgID, reportedBy, commentText, commentDate, ref incidentID,userName);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            for (int i = 0; i < memberList.Count; ++i)
            {
                
                try
                {
                    dataContext.sp_NewPeopleInvoluved(Convert.ToInt32(memberList[i].Student_ID), incidentID);
                    dataContext.SubmitChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
            }
            for (int i = 0; i < nonMemberList.Count; ++i)
            {
                
                try
                {
                    dataContext.sp_NewNonMembersInvoluved(nonMemberList[i].ID,nonMemberList[i].Name, incidentID);
                    dataContext.SubmitChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
            } 
            return true;

        }

        public bool updateIncident(int inciID,string date, string dateReported, string time, string location, string incident, string result, string notes, string followUp, int orgID, string reportedBy, List<MemberList> memberList,List<NonMemberList> nonMemberList)
        {
            
            try
            {
                dataContext.sp_DeletepeopleInvoluvedForIncident(inciID);
                dataContext.sp_DeleteNonMembersInvoluvedForIncident(inciID);
                dataContext.sp_UpdateIncident(inciID, date, dateReported, location, incident, result, notes, followUp, reportedBy, time, orgID);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            for (int i = 0; i < memberList.Count; ++i)
            {
                dataContext.sp_NewPeopleInvoluved(Convert.ToInt32(memberList[i].Student_ID), inciID);
                try
                {
                    dataContext.SubmitChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
            }
            for (int i = 0; i < nonMemberList.Count; ++i)
            {

                try
                {
                    dataContext.sp_NewNonMembersInvoluved(nonMemberList[i].ID, nonMemberList[i].Name, inciID);
                    dataContext.SubmitChanges();
                }
                catch (Exception e)
                {
                    return false;
                }
            } 
            return true;

        }

        public IList getCommentsByIncidentID(int inciID)
        {
            IList comments = new List<IncidentComment>();
            var comment = dataContext.sp_GetCommentsByIncidentID(inciID);
            comments = comment.ToList();
            return comments;
        }

        public bool createIncidentComment(string text, int inciID, string date,string userName)
        {

            dataContext.sp_NewIncidentComments(inciID, date, text,userName);
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