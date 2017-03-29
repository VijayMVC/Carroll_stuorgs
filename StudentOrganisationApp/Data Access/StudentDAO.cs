using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class StudentDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();

        public IList getNonExeMembersForOrgID(int orgID)
        {
            List<StudentOrganisationApp.App_Data.Student> students = new List<StudentOrganisationApp.App_Data.Student>();
            var studs = dataContext.sp_GetNonExecutiveMembersForOrgID(orgID);
            foreach (var x in studs)
            {
                StudentOrganisationApp.App_Data.Student student = new StudentOrganisationApp.App_Data.Student();
                student.Student_ID = x.Student_ID;
                student.LastName = x.LastName + ", " + x.FirstName;
                students.Add(student);
            }
            return students;
        }

        public IList getNonMembersForOrgID(int orgID)
        {
            List<StudentOrganisationApp.App_Data.Student> students = new List<StudentOrganisationApp.App_Data.Student>();
            var studs = dataContext.sp_GetNonMembersForOrgID(orgID);
            foreach (var x in studs)
            {
                StudentOrganisationApp.App_Data.Student student = new StudentOrganisationApp.App_Data.Student();
                student.Student_ID = x.Student_ID;
                student.LastName = x.LastName + ", " + x.FirstName;
                students.Add(student);
            }
            return students;
        }

        /// It only returns first name, last name and carroll id
        public List<StudentOrganisationApp.App_Data.Student> getStudentByLastName(string lastname)
        {
            List<StudentOrganisationApp.App_Data.Student> students = new List<App_Data.Student>();
            var stud = dataContext.sp_GetStudentByLastName(lastname);
            foreach (var s in stud)
            {
                StudentOrganisationApp.App_Data.Student student = new App_Data.Student();
                student.FirstName = s.FirstName;
                student.LastName = s.LastName;
                student.Carroll_ID = s.Carroll_ID;
                students.Add(student);
            }
            return students;
        }

        public List<StudentOrganisationApp.Data_Access.StudentHistory> getHistoricalOrgsByID(int stuID)
        {
            List<StudentOrganisationApp.Data_Access.StudentHistory> orgroster = new List<StudentOrganisationApp.Data_Access.StudentHistory>(); 

            try
            {
                var stud = dataContext.sp_GetHistoricalOrgsByStudentID(stuID);
                foreach (var s in stud)
                {
                    StudentOrganisationApp.Data_Access.StudentHistory org = new StudentOrganisationApp.Data_Access.StudentHistory();
                    org.Organization = s.Organization;
                    org.MemberType = s.Member_Type;
                    org.Session = s.Session;
                    org.Year = Convert.ToInt32(s.Year);
                    orgroster.Add(org);
                }
                return orgroster;
            }
            catch (Exception e)
            {

            }

            return orgroster;
        }

        public StudentOrganisationApp.App_Data.Student getStudentByID(int stuID)
        {
            StudentOrganisationApp.App_Data.Student student = null;

            try
            {
                var stud = dataContext.sp_GetStudentByCarrollID(stuID).First();

                student = new App_Data.Student();
                student.FirstName = stud.FirstName;
                student.LastName = stud.LastName;
                student.ClassOf = stud.ClassOf;
                student.Email = stud.Email;
                student.PreferredPhone = stud.PreferredPhone;
                student.Active = stud.Active;
                student.Gender = stud.Gender;
                student.Carroll_ID = stud.Carroll_ID;
                student.GPABoard = stud.GPABoard;
                student.GPAOrg = stud.GPAOrg;
                student.Major = stud.Major;
                student.Major2 = stud.Major2;
                student.CertifiedDriver = stud.CertifiedDriver;
                student.ApprovedDriver = stud.ApprovedDriver;
                student.GreekGPA = stud.GreekGPA;
                student.Ferpa = stud.Ferpa;
                student.Student_ID = stud.Student_ID;
                student.OnCampus = stud.OnCampus;
                student.Race = stud.Race;
                student.International = stud.International;
            }
            catch (Exception e)
            {

            }
            
            return student;
        }
        public bool updateStudent(int stuID, bool certDriver,bool apprDriver,bool greekGPA)
        {
            dataContext.sp_UpdateStudent(stuID,certDriver, apprDriver,greekGPA);
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