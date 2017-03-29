using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentOrganisationApp.Data_Access
{
    public class ShortDate
    {
        private string _SDate;
        public string SDate
        {
            get
            {
                return this._SDate;
            }
            set
            {
                this._SDate = value;

            }
        }
        private DateTime _Date;
        public DateTime Date
        {
            get
            {
                return this._Date;
            }
            set
            {
                this._Date = value;

            }

        }
    }
}