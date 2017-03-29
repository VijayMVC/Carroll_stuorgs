using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace StudentOrganisationApp.Data_Access
{
    [Serializable()]
    public class AdvisorList : ISerializable
    {
        private string _LastName;
        public string LastName
        {
            get
            {
                return this._LastName;
            }
            set
            {
                this._LastName = value;

            }
        }
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
        private string _Type;
        public string Type
        {
            get
            {
                return this._Type;
            }
            set
            {
                this._Type = value;

            }

        }

        private string _FirstName;
        public string FirstName
        {
            get
            {
                return this._FirstName;
            }
            set
            {
                this._FirstName = value;

            }
        }
        private int _AdvisorID;
        public int AdvisorID
        {
            get
            {
                return this._AdvisorID;
            }
            set
            {
                this._AdvisorID = value;

            }
        }

        public void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            info.AddValue("AdvisorID", AdvisorID);
            info.AddValue("FirstName", FirstName);
            info.AddValue("LastName", LastName);
            info.AddValue("Drivertype", Type);
            info.AddValue("Name", Name);
        }

        public AdvisorList(SerializationInfo info, StreamingContext ctxt)
        {
            AdvisorID = (int)info.GetValue("AdvisorID", typeof(int));
            LastName = (String)info.GetValue("LastName", typeof(string));
            FirstName = (String)info.GetValue("FirstName", typeof(string));
            Type = (String)info.GetValue("Drivertype", typeof(string));
            Name = (String)info.GetValue("Name", typeof(string));
        }



        public AdvisorList()
        { }
       }
}