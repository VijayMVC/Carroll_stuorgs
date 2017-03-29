using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.Data_Access;
using StudentOrganisationApp.App_Data;

namespace StudentOrganisationApp.Student
{
    public partial class EditStudent : System.Web.UI.Page
    {
        StudentDAO StudentDAO = new StudentDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    //ddlSelectStudent.DataSource = StudentDAO.getStudentList();
                    //ddlSelectStudent.DataTextField = "FirstName";
                    //ddlSelectStudent.DataValueField = "Student_ID";
                    //ddlSelectStudent.DataBind();
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to load Student list!!";
            }

        }

        private void clearText()
        {
            rblStatus.ClearSelection();
            //ddlSelectStudent.SelectedIndex = -1;
            chklDrvingPermission.ClearSelection();
            chklGrades.ClearSelection();
            //ddlSelectStudent.SelectedIndex = -1;
            pnlEditing.Visible = false;
            chkGreekGPA.Checked = false;
            lblLastNameError.Text = string.Empty;
            txtLastNameSelect.Text = string.Empty;
            txtRace.Text = string.Empty;
            cbIntl.Checked = false;
            cbOnCampus.Checked = false;
            grdLastNameStudents.DataSource = null;
            grdLastNameStudents.DataBind();

            pnlSearchStudent.Visible = true;
            pnlOrgMember.Visible = false;
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {try{
            //if (Convert.ToInt32(ddlSelectStudent.SelectedItem.Value) != -1)
            //{
            //    pnlEditing.Visible = true;
            //    ddlSelectStudent.Enabled = false;
            //    int stuID = Convert.ToInt32(ddlSelectStudent.SelectedItem.Text);
            //    App_Data.Student studentForEdit = StudentDAO.getStudentByID(stuID);

            //    txtStudentEmail.Text = studentForEdit.Email;
            //    txtPrefPhoneNo.Text = studentForEdit.PreferredPhone.ToString();
            //    txtStudentFirstName.Text = studentForEdit.FirstName;
            //    txtStudentLastName.Text = studentForEdit.LastName;
            //    txtCarrollID.Text = studentForEdit.Carroll_ID.ToString();
            //    txtGradClass.Text = studentForEdit.ClassOf.ToString();
            //    txtMajor.Text = studentForEdit.Major;
            //    txtMajor2.Text = studentForEdit.Major2;
            //    //txtStudentAdd.Text = studentForEdit.Address;
            //    if(studentForEdit.GreekGPA == true)
            //    chkGreekGPA.Checked = true;
            //    else
            //        chkGreekGPA.Checked = false;
            //    if (studentForEdit.Gender == true)
            //    {
            //        rblGender.SelectedIndex = 0;
            //    }
            //    else
            //    {
            //        rblGender.SelectedIndex = 1;
            //    }
            //    if (studentForEdit.GPABoard == true)
            //        chklGrades.Items[0].Selected = true;
            //    if (studentForEdit.GPAOrg == true)
            //        chklGrades.Items[1].Selected = true;
            //    if(studentForEdit.Active == true)
            //    {
            //        rblStatus.SelectedIndex = 0;
            //    }
            //    else
            //    {
            //        rblStatus.SelectedIndex = 1;
            //    }
            //    if (studentForEdit.CertifiedDriver == true)
            //        chklDrvingPermission.Items[0].Selected = true;
            //    if (studentForEdit.ApprovedDriver == true)
            //        chklDrvingPermission.Items[1].Selected = true;

            //}
        }
        catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Student data!!";
            }
        }

        protected void btnEditStudent_Click(object sender, EventArgs e)
        {
            try
            {
                int stuID = Convert.ToInt32(lblStuID.Text);
                bool Updated = StudentDAO.updateStudent(stuID, chklDrvingPermission.Items[0].Selected, chklDrvingPermission.Items[1].Selected, chkGreekGPA.Checked);
                clearText();
                //ddlSelectStudent.Enabled = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Changes were not submitted!!" + ex.ToString();
            }
        }

        protected void btnCanel_Click(object sender, EventArgs e)
        {
            clearText();
            //ddlSelectStudent.Enabled = true;
        }

        protected void grdLastNameStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            int stuID;
            int.TryParse(grdLastNameStudents.Rows[grdLastNameStudents.SelectedIndex].Cells[2].Text, out stuID);
            App_Data.Student student = StudentDAO.getStudentByID(stuID);
            if (student != null)
            {
                AssignInformationCarrollId(student);
            }
        }

        protected void btnGoLastName_Click(object sender, EventArgs e)
        {
            if (txtLastNameSelect.Text != string.Empty)
            {
            lblLastNameError.Visible = false;
            List<App_Data.Student> students = StudentDAO.getStudentByLastName(txtLastNameSelect.Text);
            if (students.Count < 1)
            {
                lblLastNameError.Visible = true;
                lblLastNameError.Text = "No students with this Last Name";
            }
            else
            {
                grdLastNameStudents.DataSource = students;
                grdLastNameStudents.DataBind();
            }
            }
            else
            {
                lblLastNameError.Visible = true;
                lblLastNameError.Text = "Please Enter a Last Name";
            }
        }

        protected void btnGoCarrollId_Click(object sender, EventArgs e)
        {
            int stuID;
            int.TryParse(txtCarrollIdSelect.Text, out stuID);
            if (stuID != 0)
            {
                lblLastNameError.Visible = false;
                App_Data.Student student = StudentDAO.getStudentByID(stuID);
                if (student != null)
                {
                    AssignInformationCarrollId(student);
                }
                else
                {
                    lblLastNameError.Visible = true;
                    lblLastNameError.Text = "No Students With This Carroll ID";
                }
            }
            else
            {
                lblLastNameError.Visible = true;
                lblLastNameError.Text = "Please Enter a Valid Carroll ID";
            }
        }

        protected void gridview_OrgMember_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //hide header row
                e.Row.Visible = false;
            }
        }

        public void AssignInformationCarrollId(App_Data.Student studentForEdit)
        {
            try
            {
                pnlEditing.Visible = true;
                pnlOrgMember.Visible = true;

                pnlSearchStudent.Visible = false;
                txtLastNameSelect.Text = string.Empty;
                txtCarrollIdSelect.Text = string.Empty;

                lblNameStudent.Text = studentForEdit.FirstName + " " + studentForEdit.LastName;

                gridview_OrgMember.DataSource = StudentDAO.getHistoricalOrgsByID(Convert.ToInt32(studentForEdit.Carroll_ID));
                gridview_OrgMember.DataBind();

                txtStudentEmail.Text = studentForEdit.Email;
                txtPrefPhoneNo.Text = studentForEdit.PreferredPhone;
                txtStudentFirstName.Text = studentForEdit.FirstName;
                txtStudentLastName.Text = studentForEdit.LastName;
                txtCarrollID.Text = studentForEdit.Carroll_ID.ToString();
                txtGradClass.Text = studentForEdit.ClassOf.ToString();
                txtMajor.Text = studentForEdit.Major;
                txtMajor2.Text = studentForEdit.Major2;

                txtRace.Text = studentForEdit.Race;

                if (studentForEdit.OnCampus.ToString().Equals("Y"))
                    cbOnCampus.Checked = true;
                else
                    cbOnCampus.Checked = false;

                if (studentForEdit.International.ToString().Equals("Y"))
                    cbIntl.Checked = true;
                else
                    cbIntl.Checked = false;

                lblStuID.Text = studentForEdit.Student_ID.ToString();
                if (studentForEdit.GreekGPA == true)
                    chkGreekGPA.Checked = true;
                else
                    chkGreekGPA.Checked = false;
                if (studentForEdit.Gender == true)
                {
                    rblGender.SelectedIndex = 0;
                }
                else
                {
                    rblGender.SelectedIndex = 1;
                }
                if (studentForEdit.GPABoard == true)
                    chklGrades.Items[0].Selected = true;
                if (studentForEdit.GPAOrg == true)
                    chklGrades.Items[1].Selected = true;
                if (studentForEdit.Active == true)
                {
                    rblStatus.SelectedIndex = 0;
                }
                else
                {
                    rblStatus.SelectedIndex = 1;
                }
                if (studentForEdit.CertifiedDriver == true)
                    chklDrvingPermission.Items[0].Selected = true;
                if (studentForEdit.ApprovedDriver == true)
                    chklDrvingPermission.Items[1].Selected = true;            
            }
            catch (Exception)
            {
                lblMessage.Text = "Unable to retrieve the Student data!!";
                pnlEditing.Visible = false;
                pnlSearchStudent.Visible = false;
                txtLastNameSelect.Text = string.Empty;
                txtCarrollIdSelect.Text = string.Empty;
            }
        }
    }
}