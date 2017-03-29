using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using StudentOrganisationApp.Data_Access;

namespace RoleStyle
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        StudentOrganisationApp.Data_Access.UserDAO UserDAO = new UserDAO();
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Initialize FormsAuthentication, for what it's worth
            FormsAuthentication.Initialize();

            FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "md5"); // Or "sha1"

            //bool isUserAtenticated = true;
            bool? isActive = false;
            string Role = UserDAO.UserRole(txtUserName.Text,txtPassword.Text,ref isActive);
            //if (!Convert.ToBoolean(isActive))
            //{
            //    ErrorLabel.Text = "Username Inactivated. Please try another user.";
            //    txtUserName.Text = string.Empty;
            //    ErrorLabel.Visible = true;
            //}
            if (Convert.ToBoolean(isActive) && (Role == "Admin" || Role == "Limited" || Role == "ReadOnly"))
            {
                // Create a new ticket used for authentication
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                   1, // Ticket version
                   txtUserName.Text, // Username associated with ticket
                   DateTime.Now, // Date/time issued
                   DateTime.Now.AddMinutes(30), // Date/time to expire
                   true, // "true" for a persistent user cookie
                   Role, // User-data, in this case the roles
                   FormsAuthentication.FormsCookiePath);// Path cookie valid for

                // Encrypt the cookie using the machine key for secure transport
                string hash = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(
                   FormsAuthentication.FormsCookieName, // Name of auth cookie
                   hash); // Hashed ticket

                // Set the cookie's expiration time to the tickets expiration time
                if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

                // Add the cookie to the list for outgoing response
                Response.Cookies.Add(cookie);

                // Redirect to requested URL, or homepage if no previous page
                // requested
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (returnUrl == null) returnUrl = "~/MainPage.aspx";

                // Don't call FormsAuthentication.RedirectFromLoginPage since it
                // could
                // replace the authentication ticket (cookie) we just added
                Response.Redirect(returnUrl);
            }
            else
            {
                // Never tell the user if just the username is password is incorrect.
                // That just gives them a place to start, once they've found one or
                // the other is correct!
                ErrorLabel.Text = "Username / password incorrect. Please try again.";
                ErrorLabel.Visible = true;
            }

        }

        //public bool AuthenticateUser(string domain, string username, string password)
        //{
        //    string domainAndUsername = domain + @"\" + username;
        //    DirectoryEntry entry = new DirectoryEntry(LDAPPATH, domainAndUsername, password);
        //    try
        //    {
        //        // Bind to the native AdsObject to force authentication.
        //        Object obj = entry.NativeObject;
        //        DirectorySearcher search = new DirectorySearcher(entry);
        //        search.Filter = "(SAMAccountName=" + username + ")";
        //        search.PropertiesToLoad.Add("cn");
        //        SearchResult result = search.FindOne();
        //        if (null == result)
        //        {
        //            return false;
        //        }
        //        // Update the new path to the user in the directory
        //        LDAPPATH = result.Path;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("Error authenticating user." + ex.Message);
        //    }
        //    return true;
        //}
    }
}