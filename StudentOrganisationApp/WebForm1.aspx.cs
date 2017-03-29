using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Xml.Serialization;
using StudentOrganisationApp.App_Data;
using System.Data;


namespace StudentOrganisationApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fileName = FileUpload1.ResolveClientUrl(FileUpload1.PostedFile.FileName);
            int count = 0;
            StudentOrganizationDBClassDataContext dataContext = new StudentOrganizationDBClassDataContext();
            try
            {
                DataTable dtExcel = new DataTable();
                string SourceConstr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + fileName + "';Extended Properties= 'Excel 8.0;HDR=Yes;IMEX=1'";
                OleDbConnection con = new OleDbConnection(SourceConstr);
                string query = "Select * from [Sheet1$]";
                OleDbDataAdapter data = new OleDbDataAdapter(query, con);
                data.Fill(dtExcel);
                for (int i = 1; i < dtExcel.Rows.Count; i++)
                {
                    try
                    {
                        string lastName = dtExcel.Rows[i][1].ToString();
                        string firstName = dtExcel.Rows[i][0].ToString();
                        string email = dtExcel.Rows[i][2].ToString();
                        string phoneNumber = dtExcel.Rows[i][3].ToString();
                        bool offCampus;
                        if( dtExcel.Rows[i][4].ToString() == "0")
                            offCampus = false;
                        else
                            offCampus = true;

                        //count += dataContext.sp_NewAdvisor(lastName, firstName, email, phoneNumber, offCampus);
                        //dataContext.SubmitChanges();
                    }
                    catch (Exception ex)
                    {
                        continue;
                    }
                }
                if (count == dtExcel.Rows.Count)
                {
                    lblMessage.Text = "Success";
                }
                else
                {
                    lblMessage.Text = "failure";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}