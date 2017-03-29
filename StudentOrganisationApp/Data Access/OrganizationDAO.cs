using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class OrganizationDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public IList getOrganizationList()
        {
            List<StudentOrganisationApp.App_Data.Organization> organizations = new List<StudentOrganisationApp.App_Data.Organization>();
            var org = dataContext.sp_GetOrganizationList();
            foreach (var x in org)
            {
                StudentOrganisationApp.App_Data.Organization organization = new StudentOrganisationApp.App_Data.Organization();
                organization.Organization_ID = x.Organization_ID;
                organization.OrganizationName = x.OrganizationName;
                organizations.Add(organization);
            }
            return organizations;
        }

        public IList getActiveOrganizationList()
        {
            List<StudentOrganisationApp.App_Data.Organization> organizations = new List<StudentOrganisationApp.App_Data.Organization>();
            var org = dataContext.sp_GetActiveOrgList();
            foreach (var x in org)
            {
                StudentOrganisationApp.App_Data.Organization organization = new StudentOrganisationApp.App_Data.Organization();
                organization.Organization_ID = x.Organization_ID;
                organization.OrganizationName = x.OrganizationName;
                organizations.Add(organization);
            }
            return organizations;
        }

        public bool CreateOrganization(string orgName, string orgDecscription, string orgMeetTime, string orgMeetDate, string orgMeetBuilding, string orgMeetRoom, 
            string dateProposed, string dateaccepted, string dateDenied, string proposalNotes, string dateSubmitted, string dateAccepted, string constitutionNotes, 
            string dateRegApproval, string cxCode, int catID, bool reqmet, string regMetDate, string commentText, int statusID, string commentDate, string statusStartDate, 
            string statusEndDate, string userName, string meetFrequency, string OAcct, string ProjCode)
        {
            
            try
            {
                dataContext.sp_NewOrganization(orgName, orgDecscription, orgMeetTime, orgMeetDate,
                    orgMeetBuilding, orgMeetRoom, dateProposed, dateaccepted,
                    dateDenied, proposalNotes, dateSubmitted, dateAccepted,
                    constitutionNotes, dateRegApproval, cxCode, catID, reqmet,
                    regMetDate, commentText, statusID, commentDate, statusStartDate,
                    statusEndDate, userName, meetFrequency, OAcct, ProjCode);

                dataContext.SubmitChanges();
            }
            catch (Exception e)
            { 
                return false;
            }
            return true;
        }

        public StudentOrganisationApp.App_Data.Organization getOrganizationByID(int orgID,ref int statusID)
        {
            var org = dataContext.sp_GetOrganizationByID(orgID).First();
            StudentOrganisationApp.App_Data.Organization organization = new App_Data.Organization();
            organization.OrganizationName = org.OrganizationName;
            organization.Category_ID = org.Category_ID;
            organization.Description = org.Description;
            organization.MeetingBuilding = org.MeetingBuilding;
            organization.MeetingRoom = org.MeetingRoom;
            organization.MeetingDay = org.MeetingDay;
            organization.MeetingTime = org.MeetingTime;
            statusID = org.Status_ID;
            organization.RegistrarApproval = org.RegistrarApproval;
            organization.RequirementsMet = org.RequirementsMet;
            organization.RequirementsMetDate = org.RequirementsMetDate;
            organization.DateProposed = org.DateProposed;
            organization.ProposalAccepted = org.ProposalAccepted;
            organization.ProposalDenied = org.ProposalDenied;
            organization.ProposalNotes = org.ProposalNotes;
            organization.ConstitutionAccepted = org.ConstitutionAccepted;
            organization.ConstitutionNotes = org.ConstitutionNotes;
            organization.ConstitutionSubmitted = org.ConstitutionSubmitted;
            organization.ConstitutionUpdated = org.ConstitutionUpdated;
            organization.ConstitutionDenied = org.ConstitutionDenied;
            organization.MeetingFrequency = org.MeetingFrequency;
            organization.CX_Code = org.CX_Code;
            organization.OAccount = org.OAccount;
            organization.ProjectCode = org.ProjectCode;
            return organization;
        }

        public IList getCommentsByOrganizationID(int orgID)
        {
            IList comments = new List<OrgComment>();
            var comment = dataContext.sp_GetCommentsByOrgID(orgID);
            comments = comment.ToList();
            return comments;
        }

        public bool createOrganizationComment(string text, int orgID, string date,string userName)
        {
            dataContext.sp_NewOrganizationComments(orgID, date, text,userName);
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

        public bool updateOrganizationDates(int orgID,string dateProposed,string dateAccepted,string dateDenied,string proposalNotes,string consSubmitted,
            string consApproved,string consDenied,string consUpdates,string consNotes)
        {
            dataContext.sp_UpdateOrganizationDates(orgID,dateProposed,dateAccepted,dateDenied,proposalNotes,consSubmitted,consApproved,consDenied,consUpdates,consNotes);
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

        public bool updateOrganizationMainPage(int orgID, string orgName,string description,string meetTime,string meetDay,string meetbuilding,string meetRoom,string cxCode,int categoryID,
                                                bool requirementsMet,string requirementsMetDate,string registarApprovalDate,int statusID,List<AdvisorList> newAdvisorList,string meetFrequency,
                                                string OAcct, string ProjCode)
        {            
            try
            {
                dataContext.sp_UpdateOrganizationMainPage(orgID, orgName, description, meetTime, meetDay, meetbuilding, meetRoom, 
                    cxCode, categoryID, requirementsMet, requirementsMetDate, registarApprovalDate, statusID,meetFrequency,
                    OAcct, ProjCode);

                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            List<AdvisorList> oldAdvisorList = new List<AdvisorList>();
            var advis = dataContext.sp_GetAdvisorList();
            foreach (var x in advis)
            {
                AdvisorList advisor = new AdvisorList();
                advisor.AdvisorID = x.Advisor_ID;
                advisor.LastName = x.LastName;
                advisor.FirstName = x.FirstName;
                advisor.Name = x.FirstName + " " + x.LastName;
                oldAdvisorList.Add(advisor);
            }

            for (int i = 0; i < oldAdvisorList.Count; ++i)
            {
                for (int j = 0; j < newAdvisorList.Count; ++j)
                {
                    if (oldAdvisorList[i].AdvisorID == newAdvisorList[j].AdvisorID)
                    {
                        oldAdvisorList[i].FirstName = "Please Delete";
                    }                
                }
            }

            for (int i = 0; i < oldAdvisorList.Count; ++i)
            {
                if(oldAdvisorList[i].FirstName != "Please Delete")
                {
                    dataContext.sp_UpdateOrgAdvisorRow(oldAdvisorList[i].AdvisorID, orgID);
                }
            }

            for (int i = 0; i < newAdvisorList.Count; ++i)
            {
                dataContext.sp_NewOrgAdvisorRow(orgID, newAdvisorList[i].AdvisorID);
            }

            return true;
        }

        public bool updateOrganizationExecutiveMembers(int studID,int orgID,int memberID,bool isPrimary)
        {
            try
            { 
                dataContext.sp_UpdateStudentRoster(studID, orgID, memberID, "", isPrimary);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;        
        }

        public bool updateOrganizationMembers(int orgID, List<OrgMember> newMemberList)
        {
            try
            {
                List<OrgMember> oldMemberList = new List<OrgMember>();
                var advis = dataContext.sp_GetMembersByOrgID(orgID);
                foreach (var x in advis)
                {
                    OrgMember member = new OrgMember();
                    member.Student_ID = x.Student_ID;
                    member.LastName = x.LastName;
                    member.FirstName = x.FirstName;
                    oldMemberList.Add(member);
                }

                for (int i = 0; i < oldMemberList.Count; ++i)
                {
                    for (int j = 0; j < newMemberList.Count; ++j)
                    {
                        if (oldMemberList[i].Student_ID == newMemberList[j].Student_ID)
                        {
                            oldMemberList[i].FirstName = "Please Delete";                            
                        }
                    }
                }

                for (int i = 0; i < oldMemberList.Count; ++i)
                {
                    if (oldMemberList[i].FirstName != "Please Delete")
                    {
                        dataContext.sp_UpdateStudentRosterRow(oldMemberList[i].Student_ID, orgID);
                    }
                }
                for (int i = 0; i < newMemberList.Count; ++i)
                {
                    dataContext.sp_NewStudentRosterRow(orgID, newMemberList[i].Student_ID);
                }
            }
            catch (Exception)
            {
                return false;
            }

            return true;
        }

        public bool updateOrganizationExecutiveMembersToDelete(int studID, int orgID, int memberID, bool isPrimary)
        {
            try
            {
                dataContext.sp_UpdateStudentRosterToDeleteMember(studID, orgID, memberID, "", isPrimary);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public void ResetStudentRoster()
        {
            dataContext.sp_ResetStudentRoster();
        }
    }
}