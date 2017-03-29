using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentOrganisationApp.App_Data;
using System.Collections;

namespace StudentOrganisationApp.Data_Access
{
    public class UserDAO
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
        public string UserRole(string userID, string password,ref bool? isActive)
        {
            string role = string.Empty;
            var r = dataContext.sp_GetRoleOfUser(userID, password, ref role, ref isActive);
          
            return role;
        }

        public bool createUser(string lastName, string firstName,string password, string userID, bool isActive,int roleID)
        {
            string null_value = null;

            return createUser(lastName, firstName, password, userID, isActive, roleID, null_value, null_value);
        }

        public bool createUser(string lastName, string firstName, string password, string userID, bool isActive, int roleID, string phone, string email)
        {
            try
            {
                dataContext.sp_NewUser(lastName, firstName, password, userID, isActive, roleID, phone, email);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public bool updateUser(string lastName, string firstName, string password, string userID, bool isActive, int roleID)
        {
            string null_value = null;

            return updateUser(lastName, firstName, password, userID, isActive, roleID, null_value, null_value);
        }

        public bool updateUser(string lastName, string firstName, string password, string userID, bool isActive, int roleID, string phone, string email)
        {
            try
            {
                dataContext.sp_UpdateUser(lastName, firstName, password, userID, isActive, roleID, phone, email);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public List<StudentOrganisationApp.App_Data.User> getUserList()
        {
            List<StudentOrganisationApp.App_Data.User> users = new List<StudentOrganisationApp.App_Data.User>();
            var IDs = dataContext.sp_GetUserList("ALL");
            foreach (var x in IDs)
            {
                StudentOrganisationApp.App_Data.User user = new StudentOrganisationApp.App_Data.User();
                user.User_ID = x.User_ID;
                users.Add(user);
            }
            return users;
        }

        public List<StudentOrganisationApp.App_Data.User> getUserList(string mode)
        {
            List<StudentOrganisationApp.App_Data.User> users = new List<StudentOrganisationApp.App_Data.User>();

            if (mode.Equals("ALL") || mode.Equals("ACTIVE"))
            {
                var IDs = dataContext.sp_GetUserList(mode);
                foreach (var x in IDs)
                {
                    StudentOrganisationApp.App_Data.User user = new StudentOrganisationApp.App_Data.User();
                    user.User_ID = x.User_ID;
                    users.Add(user);
                }
            }
            return users;
        }

        public StudentOrganisationApp.App_Data.User getUserByID(string userID)
        {
            StudentOrganisationApp.App_Data.User user = new StudentOrganisationApp.App_Data.User();
            var userFromDB = dataContext.sp_GetUserByID(userID).First();
            user.User_ID = userFromDB.User_ID;
            user.Lastname = userFromDB.Lastname;
            user.Firstname = userFromDB.Firstname;
            user.Password = userFromDB.Password;
            user.Is_Active = userFromDB.Is_Active;
            user.Role_ID = userFromDB.Role_ID;
            user.Phone = userFromDB.Phone;
            user.Email = userFromDB.Email;
            return user;
        }

        public List<StudentOrganisationApp.App_Data.Role> getUserRoles()
        {
            List<StudentOrganisationApp.App_Data.Role> roles_list = new List<StudentOrganisationApp.App_Data.Role>();
            var Roles = dataContext.sp_GetUserRoles();
            foreach (var x in Roles)
            {
                StudentOrganisationApp.App_Data.Role role = new StudentOrganisationApp.App_Data.Role();
                role.Role_ID = x.Role_ID;
                role.Role_Name = x.Role_Name;
                roles_list.Add(role);
            }
            return roles_list;
        }

        public List<StudentOrganisationApp.App_Data.UserOrg> sp_GetUserOrgsByID (string userID)
        {
            List<StudentOrganisationApp.App_Data.UserOrg> limited_orgs = new List<StudentOrganisationApp.App_Data.UserOrg>();

            var Orgs = dataContext.sp_GetUserOrgsByID(userID);
            foreach (var x in Orgs)
            {
                StudentOrganisationApp.App_Data.UserOrg org = new StudentOrganisationApp.App_Data.UserOrg();
                org.User_ID = x.User_ID;
                org.Organization_ID = x.Organization_ID;
                org.active_date = x.active_date;
                org.Organization_Name = x.OrganizationName;
                org.inactive_date = x.inactive_date;
                limited_orgs.Add(org);
            }
            return limited_orgs;
        }

        public bool createUserOrgs(string usr_id, string org_id)
        {
            try
            {
                DateTime today = DateTime.Today;

                dataContext.sp_NewUserOrgs(usr_id, org_id, today);
                dataContext.SubmitChanges();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public bool updateUserOrgs(string usr_id, string org_id, DateTime active, DateTime inactive)
        {
            try
            {
                dataContext.sp_UpdateUserOrgs(usr_id, org_id, active, inactive);
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