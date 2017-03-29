using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentOrganisationApp.App_Data;
using System.Data;
using System.IO;
using System.Data.SqlClient;

namespace StudentOrganisationApp.Reports
{
    public partial class OrganizationDump : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinqDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

          //  e.Result = dataContext.sp_GetOrgAndStudentDump();

        }



        protected void btnExport_Click(object sender, EventArgs e)
        {


        }
    }
    }
