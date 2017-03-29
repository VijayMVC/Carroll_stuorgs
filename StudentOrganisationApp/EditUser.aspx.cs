using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentOrganisationApp
{
    public partial class EditUser : System.Web.UI.Page
    {
        Data_Access.UserDAO UserDAO = new Data_Access.UserDAO();
        Data_Access.OrganizationDAO OrgDAO = new Data_Access.OrganizationDAO();

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
            Page.Validate();
            if (Page.IsValid)
            {
                string lastn, firstn, pwd, username, phone, maskphone, eml, srole;
                bool isactive;
                int role;

                username = ddlSelectUser.SelectedValue;
                lastn = txtLastName.Text.Trim();
                firstn = txtFirstName.Text.Trim();
                pwd = txtPassword.Text.Trim();
                maskphone = Phone.Text.Trim();
                eml = Email.Text.Trim();
                isactive = !chkIsInActive.Checked;

                phone = new string(maskphone.Where(char.IsDigit).ToArray());

                srole = rblRoles.SelectedItem.Value;
                role = Int32.Parse(srole);

                bool Updated = UserDAO.updateUser(lastn, firstn, pwd, username, isactive, role, phone, eml);
                if (!Updated)
                {
                    lblMessage.Text = "Unable to update user.";
                }
                selectUser();
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            if (ddlSelectUser.SelectedValue != "-1")
            {
                pnlUserDetails.Visible = true;
                pnlSelectUser.Visible = false;
                pnlUserOrgs.Visible = true;
                pnlControlPanel.Visible = true;

                selectUser();
            }
        }

        private void clearText()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            Phone.Text = string.Empty;
            Email.Text = string.Empty;

            chkIsInActive.Checked = false;
            rblRoles.ClearSelection();
            pnlUserDetails.Visible = false;
            pnlUserOrgs.Visible = false;
            pnlControlPanel.Visible = false;

            pnlSelectUser.Visible = true;
            lblNameUser.Text = string.Empty;

            //clear the list first
            ddlSelectUser.Items.Clear();
            //add the default selection
            ListItem listitem = new ListItem("Select User", "-1");
            ddlSelectUser.Items.Add(listitem);
            //now re-populate the list
            ddlSelectUser.DataSource = UserDAO.getUserList("ACTIVE");
            ddlSelectUser.DataTextField = "User_ID";
            ddlSelectUser.DataValueField = "User_ID";
            ddlSelectUser.DataBind();
            ddlSelectUser.SelectedValue = "-1";
            ddlSelectUser.Enabled = true;

            lnkdisabledusers.Visible = true;
        }

        private void selectUser()
        {
            if (ddlSelectUser.SelectedValue != "-1")
            {
                App_Data.User selected = UserDAO.getUserByID(ddlSelectUser.SelectedItem.Value);
                lblNameUser.Text = "User: " + selected.User_ID;

                txtFirstName.Text = selected.Firstname;
                txtLastName.Text = selected.Lastname;
                txtPassword.Text = selected.Password;
                Phone.Text = selected.Phone;
                Email.Text = selected.Email;
                chkIsInActive.Checked = !selected.Is_Active;

                string role = selected.Role_ID.ToString();
                rblRoles.Items.FindByValue(role).Selected = true;

                fillLimitedOrg(ddlSelectUser.SelectedValue);
            }
            else
            {
                clearText();
            }
        }

        private void BindList()
        {
            rblRoles.DataSource = UserDAO.getUserRoles();
            rblRoles.DataTextField = "Role_Name";
            rblRoles.DataValueField = "Role_ID";
            rblRoles.DataBind();

            ddlSelectUser.DataSource = UserDAO.getUserList("ACTIVE");
            ddlSelectUser.DataTextField = "User_ID";
            ddlSelectUser.DataValueField = "User_ID";
            ddlSelectUser.DataBind();
            lnkdisabledusers.Visible = true;

            ddlSelectOrg.DataSource = OrgDAO.getActiveOrganizationList();
            ddlSelectOrg.DataTextField = "OrganizationName";
            ddlSelectOrg.DataValueField = "Organization_ID";
            ddlSelectOrg.DataBind();
        }

        protected void LimitedOrgList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                //0 should be the delete button
                e.Row.Cells[1].Visible = false;
                e.Row.Cells[2].Visible = false;
                e.Row.Cells[3].Visible = false;
                e.Row.Cells[4].Visible = false;
                //5 should be the org name, and that's what we want to show.
            }
        }

        protected void LimitedOrgList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string usrID = LimitedOrgList.Rows[e.RowIndex].Cells[1].Text;
                string orgID = LimitedOrgList.Rows[e.RowIndex].Cells[2].Text;
                DateTime active = Convert.ToDateTime(LimitedOrgList.Rows[e.RowIndex].Cells[3].Text);
                DateTime today = DateTime.Today;

                UserDAO.updateUserOrgs(usrID, orgID, active, today);

                fillLimitedOrg(ddlSelectUser.SelectedValue);
            }
            catch (Exception)
            {
                lblMessage.Text = "Could Not Deactivate Limiting Organization!!";
            }
        }

        private void fillLimitedOrg(string user)
        {
            LimitedOrgList.DataSource = UserDAO.sp_GetUserOrgsByID(user);
            LimitedOrgList.DataBind();
        }

        protected void btnOrg_Click(object sender, EventArgs e)
        {
            try
            {
                string usr = ddlSelectUser.SelectedValue;
                if (usr != "-1")
                {
                    string org = ddlSelectOrg.SelectedItem.Value;
                    if (org != "-1")
                    {
                        UserDAO.createUserOrgs(usr, org);
                    }

                    fillLimitedOrg(usr);

                    ddlSelectOrg.SelectedIndex = -1;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Organization not added.";
            }
        }

        protected void lnkdisabledusers_Click(object sender, EventArgs e)
        {
            lnkdisabledusers.Visible = false;

            //clear the list first
            ddlSelectUser.Items.Clear();
            //add the default selection
            ListItem listitem = new ListItem("Select User","-1");
            ddlSelectUser.Items.Add(listitem);
            //now re-populate the list
            ddlSelectUser.DataSource = UserDAO.getUserList("ALL");
            ddlSelectUser.DataTextField = "User_ID";
            ddlSelectUser.DataValueField = "User_ID";
            ddlSelectUser.DataBind();
        }
    }
}