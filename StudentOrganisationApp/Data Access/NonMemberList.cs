using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
namespace StudentOrganisationApp.Data_Access
{
    [Serializable()]
    public class NonMemberList : ISerializable
    {


        private string _ID;
        public string ID
        {
            get
            {
                return this._ID;
            }
            set
            {
                this._ID = value;

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

        public void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            info.AddValue("ID", _ID);
            info.AddValue("Name", Name);
        }

        public NonMemberList(SerializationInfo info, StreamingContext ctxt)
        {
            Name = (String)info.GetValue("Name", typeof(string));
            ID = (String)info.GetValue("ID", typeof(string));
        }

        public NonMemberList()
        { }
    }
}
