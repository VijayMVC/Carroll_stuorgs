using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;


namespace StudentOrganisationApp.Data_Access
{
    [Serializable()]
    public class OrgMember:ISerializable
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
            private int _MemberID;
            public int MemberID
            {
                get
                {
                    return this._MemberID;
                }
                set
                {
                    this._MemberID = value;

                }

            }
            private int _CarrollID;
            public int CarrollID
            {
                get
                {
                    return this._CarrollID;
                }
                set
                {
                    this._CarrollID = value;

                }

            }
            private string _Status;
            public string Status
            {
                get
                {
                    return this._Status;
                }
                set
                {
                    this._Status = value;

                }

            }
            private bool _IsPrimaryContact;
            public bool IsPrimaryContact
            {
                get
                {
                    return this._IsPrimaryContact;
                }
                set
                {
                    this._IsPrimaryContact = value;

                }

            }
            private string _AddDate;
            public string AddDate
            {
                get
                {
                    return this._AddDate;
                }
                set
                {
                    this._AddDate = value;

                }
            }


        public void GetObjectData(SerializationInfo info, StreamingContext context) 
        {
                info.AddValue("Student_ID", Student_ID);
                info.AddValue("FirstName",FirstName);
                info.AddValue("LastName",LastName);
                info.AddValue("Position",Position);
                info.AddValue("CarrollID", CarrollID);
                info.AddValue("Status", Status);
                info.AddValue("IsPrimaryContact", IsPrimaryContact);
                info.AddValue("AddDate", AddDate);
                info.AddValue("MemberID", MemberID);
        }
 
        public OrgMember(SerializationInfo info, StreamingContext ctxt) 
        {
            
            LastName = (String)info.GetValue("LastName", typeof(string));
            AddDate = (String)info.GetValue("AddDate", typeof(string));
            FirstName = (String)info.GetValue("FirstName", typeof(string));
            Position = (String)info.GetValue("Position", typeof(string));            
            Student_ID = (int)info.GetValue("Student_ID", typeof(int));
            CarrollID = (int)info.GetValue("CarrollID", typeof(int));
            Status = (String)info.GetValue("Status", typeof(String));
            IsPrimaryContact = (bool)info.GetValue("IsPrimaryContact", typeof(bool));
            MemberID = (int)info.GetValue("MemberID", typeof(int));
        }

        public OrgMember() 
        { }
        }
}
    