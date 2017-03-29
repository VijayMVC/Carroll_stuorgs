using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace StudentOrganisationApp.Data_Access
{
    [Serializable()]
    public class StudentList : ISerializable
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
        private int _Student_ID;
        public int Student_ID
        {
            get
            {
                return this._Student_ID;
            }
            set
            {
                this._Student_ID = value;
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
        private string _Drivertype;
        public string Drivertype
        {
            get
            {
                return this._Drivertype;
            }
            set
            {
                this._Drivertype = value;
            }
        }

        public void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            info.AddValue("Student_ID", Student_ID);
            info.AddValue("FirstName", FirstName);
            info.AddValue("LastName", LastName);
            info.AddValue("Drivertype", Drivertype);
            info.AddValue("Name", Name);
        }

        public StudentList(SerializationInfo info, StreamingContext ctxt)
        {
            Student_ID = (int)info.GetValue("Student_ID", typeof(int));
            LastName = (String)info.GetValue("LastName", typeof(string));
            FirstName = (String)info.GetValue("FirstName", typeof(string));
            Drivertype = (String)info.GetValue("Drivertype", typeof(string));
            Name = (String)info.GetValue("Name", typeof(string));
        }

        public StudentList()
        { }
    }
}
