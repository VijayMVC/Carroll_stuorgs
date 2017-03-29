using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentOrganisationApp.Data_Access
{
    public class StudentHistory
    {
        private string _Organization;
        public string Organization
        {
            get
            {
                return this._Organization;
            }
            set
            {
                this._Organization = value;
            }
        }

        private string _MemberType;
        public string MemberType
        {
            get
            {
                return this._MemberType;
            }
            set
            {
                this._MemberType = value;
            }
        }

        private string _Session;
        public string Session
        {
            get
            {
                return this._Session;
            }
            set
            {
                this._Session = value;
            }
        }

        private int _Year;
        public int Year
        {
            get
            {
                return this._Year;
            }
            set
            {
                this._Year = value;
            }
        }
        public StudentHistory()
        { }
    }
}