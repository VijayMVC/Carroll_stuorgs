using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentOrganisationApp.Data_Access
{
    public class OrgForAdvisorList
    {
        private string _Name;
        public string Name
        {
            get
            {
                return this._Name;
            }
            set
            {
                this._Name = value;

            }

        }
        private string _StartDate;
        public string StartDate
        {
            get
            {
                return this._StartDate;
            }
            set
            {
                this._StartDate = value;

            }
        }
        private string _EndDate;
        public string EndDate
        {
            get
            {
                return this._EndDate;
            }
            set
            {
                this._EndDate = value;

            }
        }
       

    }
}