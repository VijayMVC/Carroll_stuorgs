using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class MemberTypeDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public IList getMemberTypeList()
        {
            List<StudentOrganisationApp.App_Data.MemberType> memberTypes = new List<StudentOrganisationApp.App_Data.MemberType>();
            var memType = dataContext.sp_GetMemberTypeList();
            foreach (var x in memType)
            {
                StudentOrganisationApp.App_Data.MemberType memberType = new StudentOrganisationApp.App_Data.MemberType();
                memberType.Member_ID = x.Member_ID;
                memberType.MemberName = x.MemberName;
                //memberType.FirstName = x.FirstName;
                //memberType.Name = x.FirstName + " " + x.LastName;
                memberTypes.Add(memberType);
            }
            return memberTypes;
        }


        public List<OrgMember> getExeMembersByOrgID(int orgID)
        {
            List<OrgMember> members = new List<OrgMember>();
            var mem = dataContext.sp_GetExeMembersByOrgID(orgID);
            foreach (var x in mem)
            {
                OrgMember member = new OrgMember();
                member.Position = x.MemberName;
                member.MemberID = x.Member_ID;
                member.LastName = x.LastName;
                member.FirstName = x.FirstName;
                member.CarrollID = Convert.ToInt32(x.Carroll_ID);
                member.IsPrimaryContact = Convert.ToBoolean(x.PrimaryContact);
                member.AddDate = Convert.ToDateTime(x.BeginDate).ToShortDateString();
                member.Student_ID = x.Student_ID;
                //member.Status = x.StatusName;

                members.Add(member);
            }
            return members;
        }

        public List<OrgMember> getMembersByOrgID(int orgID)
        {
            List<OrgMember> members = new List<OrgMember>();
            var mem = dataContext.sp_GetMembersByOrgID(orgID);
            foreach (var x in mem)
            {
                OrgMember member = new OrgMember();
                member.Position = x.MemberName;
                member.MemberID = x.Member_ID;
                member.LastName = x.LastName;
                member.FirstName = x.FirstName;
                member.CarrollID = Convert.ToInt32(x.Carroll_ID);
                member.IsPrimaryContact = Convert.ToBoolean(x.PrimaryContact);
                member.AddDate = Convert.ToDateTime(x.BeginDate).ToShortDateString();
                member.Student_ID = x.Student_ID;
                //member.Status = x.StatusName;

                members.Add(member);
            }
            return members;
        }



        public bool createMemberType(string memberName, string description, string addDate, string endDate, bool boardMember)
        {
            dataContext.sp_NewMemberType(memberName,description,addDate,endDate,boardMember);
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

        public bool updateMemberType(int memID, string memberName, string description, string addDate, string endDate, bool boardMember)
        {
            dataContext.sp_UpdateMemberType(memID, memberName, description, addDate, endDate, boardMember);
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

        public StudentOrganisationApp.App_Data.MemberType getMemberTypeByID(int memID)
        {
            var mem = dataContext.sp_GetMemberTypeByID(memID).First();
            StudentOrganisationApp.App_Data.MemberType memberType = new App_Data.MemberType();
            memberType.MemberName = mem.MemberName;
            memberType.Description = mem.Description;
            memberType.EndDate = mem.EndDate;
            memberType.AddDate = mem.AddDate;
            memberType.BoardMember = mem.BoardMember;

            return memberType;
        }

        public OrgMember getOrgMemberByStudID(int studID, ref bool GPABoard,ref bool GPAOrg)
        {
            OrgMember member = new OrgMember();
            var mem = dataContext.sp_GetStudentByStudID(studID).First();
            member.Student_ID = studID;        
            member.LastName = mem.LastName;
            member.FirstName = mem.FirstName;            
            member.CarrollID = Convert.ToInt32(mem.Carroll_ID);
            if (mem.GPABoard == true)
                GPABoard = true;
            else
                GPABoard = false;
            if (mem.GPAOrg == true)
                GPAOrg = true;
            else
                GPAOrg = false;
            return member;
        }


    }
}