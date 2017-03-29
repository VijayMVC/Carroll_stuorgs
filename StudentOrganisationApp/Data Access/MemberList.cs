using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
namespace StudentOrganisationApp.Data_Access
{
    [Serializable()]
    public class MemberList:ISerializable
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
            private string _Position;
            public string Position
            {
                get
                {
                    return this._Position;
                }
                set
                {
                    this._Position = value;

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

        public void GetObjectData(SerializationInfo info, StreamingContext context) 
        {
                info.AddValue("Student_ID", Student_ID);
                info.AddValue("FirstName",FirstName);
                info.AddValue("LastName",LastName);
                info.AddValue("Position",Position);
                info.AddValue("Name", Name);
        }
 
        public MemberList(SerializationInfo info, StreamingContext ctxt) 
        {
            
            LastName = (String)info.GetValue("LastName", typeof(string));
            FirstName = (String)info.GetValue("FirstName", typeof(string));
            Position = (String)info.GetValue("Position", typeof(string));
            Name = (String)info.GetValue("Name", typeof(string));
            Student_ID = (int)info.GetValue("Student_ID", typeof(int));
        }

        public MemberList() 
        { }
        }
    }
