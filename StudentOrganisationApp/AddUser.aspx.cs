using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp
{
    public partial class AddUser : System.Web.UI.Page
    {
        Data_Access.UserDAO UserDAO = new Data_Access.UserDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindList();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearText();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string lastn, firstn, pwd, username, phone, maskphone, eml, srole;
            bool isactive = true;
            int role;

            lastn = txtLastName.Text.Trim();
            firstn = txtFirstName.Text.Trim();
            pwd = txtPassword.Text.Trim();
            username = txtUserName.Text.Trim();
            maskphone = Phone.Text.Trim();
            eml = Email.Text.Trim();

            phone = new string(maskphone.Where(char.IsDigit).ToArray());

            srole = rblRoles.SelectedItem.Value;
            role = Int32.Parse(srole);

            bool success = UserDAO.createUser(lastn, firstn, pwd, username, isactive, role, phone, eml);

            if (!success)
            {
                lblMessage.Text = "Unable to create user.";
            }

            clearText();
        }

        protected void clearText()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtUserName.Text = string.Empty;
            Phone.Text = string.Empty;
            Email.Text = string.Empty;
            rblRoles.ClearSelection();
        }

        private void BindList()
        {
            rblRoles.DataSource = UserDAO.getUserRoles();
            rblRoles.DataTextField = "Role_Name";
            rblRoles.DataValueField = "Role_ID";
            rblRoles.DataBind();

            //set Limited as the default value
            rblRoles.Items.FindByValue("2").Selected = true;
        }
    }
}