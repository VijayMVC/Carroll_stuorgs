using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.DirectoryServices;

namespace StudentOrganisationApp.Data_Access
{
    public class Windows
    {
        string LDAPPATH = "LDAP://OU=2013,DC=carrollu,DC=edu";
        public bool AuthenticateUser(string domain, string username, string password)
        {
            string domainAndUsername = domain + @"\" + username;
            DirectoryEntry entry = new DirectoryEntry(LDAPPATH, domainAndUsername, password);
            try
            {
                // Bind to the native AdsObject to force authentication.
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();
                if (null == result)
                {
                    return false;
                }
                // Update the new path to the user in the directory
                LDAPPATH = result.Path;
            }
            catch (Exception ex)
            {
                throw new Exception("Error authenticating user." + ex.Message);
            }
            return true;
        } 
    }
}