using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.App_Data;
using System.Collections;
using System.Data;
using StudentOrganisationApp.Data_Access;

namespace StudentOrganisationApp.Reports
{
    public partial class AllMembers : System.Web.UI.Page
    {
        StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        private void loadGrid()
        {
            string race, cl;
            char? intl, living;

            race = getRace();
            intl = getInternational();
            living = getLiving();
            cl = getClassOf();

            grdReport.DataSource = dataContext.sp_Report_AllMembers(cl, living, race, intl);
            grdReport.DataBind();

            int count = grdReport.Rows.Count;
            lbl_count.Text = "Total Count: " + count.ToString();
        }

        private string getRace()
        {
            string race = "*ALL*";

            race = race_list.SelectedValue;
            
            return race;
        }

        private string getClassOf()
        {
            string classof = "**";

            classof = cl_list.SelectedValue;

            return classof;
        }

        private char? getInternational()
        {
            char? intl = 'Y';

            if (intl_list.SelectedValue.Equals("N"))
            { 
                intl = 'N';
            }

            if (intl_list.SelectedValue.Equals("B"))
            {
                intl = 'B';
            }
            if (intl_list.SelectedValue.Equals("Y"))
            {
                intl = 'Y';
            }

            return intl;
        }

        private char? getLiving()
        {
            char? living = 'Y';

            if (living_list.SelectedValue.Equals("N"))
            {
                living = 'N';
            }

            if (living_list.SelectedValue.Equals("B"))
            {
                living = 'B';
            }
            if (living_list.SelectedValue.Equals("Y"))
            {
                living = 'Y';
            }

            return living;
        }


        protected void race_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadGrid();
        }

        protected void intl_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadGrid();
        }

        protected void living_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadGrid();
        }

        protected void cl_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadGrid();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Create Tempory Table
            DataTable dtTemp = new DataTable();
            //Creating Header Row
            dtTemp.Columns.Add("Term");
            dtTemp.Columns.Add("Organization");
            dtTemp.Columns.Add("Member Type");
            dtTemp.Columns.Add("Carroll ID");
            dtTemp.Columns.Add("First Name");
            dtTemp.Columns.Add("Last Name");
            dtTemp.Columns.Add("Email");
            dtTemp.Columns.Add("Classification");
            dtTemp.Columns.Add("Lives On Campus?");
            dtTemp.Columns.Add("Ethnicity/Race");
            dtTemp.Columns.Add("International Student?");

            DataRow drAddItem;

            string race, cl;
            char? intl, living;

            race = getRace();
            intl = getInternational();
            living = getLiving();
            cl = getClassOf();            

            int i = 0;
            var query = dataContext.sp_Report_AllMembers(cl, living, race, intl);
            foreach (var r in query)
            {
                drAddItem = dtTemp.NewRow();
                drAddItem[0] = r.Term;
                drAddItem[1] = r.OrganizationName;
                drAddItem[2] = r.MemberName;
                drAddItem[3] = r.Carroll_ID;
                drAddItem[4] = r.FirstName;
                drAddItem[5] = r.LastName;
                drAddItem[6] = r.Email;
                drAddItem[7] = r.ClassOf;
                drAddItem[8] = r.LivesOnCampus;
                drAddItem[9] = r.Race;
                drAddItem[10] = r.IntlStudent;

                dtTemp.Rows.Add(drAddItem);
                ++i;
            }
            Export.ExportToExcel(dtTemp, "AllMembers_Filtered.xlsx");
        }
    }
}