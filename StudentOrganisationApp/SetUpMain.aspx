<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master"  CodeBehind="SetUpMain.aspx.cs" Inherits="StudentOrganisationApp.SetUp.SetUpMain" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
     <div align="left">
         <table>
             <tr>
             <td>
                 <asp:Label ID="Label1" runat="server" Text="Organization Category"></asp:Label>
              </td>
             <td>
                 <asp:Label ID="Label2" runat="server" Text="Member types"></asp:Label>
              </td>
             </tr>
             <tr>
             <td>
                <asp:Button ID="btnCreateOrgCategory" width='200pt' runat="server" Text="Add Organization Category"  CssClass="button"  onclick="btnCreateOrgCategory_Click"></asp:Button>
              </td>
             <td>
                <asp:Button ID="btnCreateMemberType" width='200pt' runat="server" Text="Add Member Type"  CssClass="button"  onclick="btnCreateMemberTyper_Click"></asp:Button>
              </td></tr>
              <tr>
              <td>
                <asp:Button ID="btnEditOrgCategory"  width='200pt' runat="server" Text="Edit Organization Category"  CssClass="button"  onclick="btnEditOrgCategory_Click"></asp:Button>
             </td>
              <td>
                <asp:Button ID="btnEditMemberType"  width='200pt' runat="server" Text="Edit Member Type"  CssClass="button"  onclick="btnEditMemberTyper_Click"></asp:Button>
             </td></tr>
             <tr>
             <td>
                 <asp:Label ID="Label3" runat="server" Text="Organization Requirement"></asp:Label>
              </td>
             <td>
                 <asp:Label ID="Label4" runat="server" Text="Users"></asp:Label>
              </td></tr>
              <tr>
              <td>
                <asp:Button ID="btnCreateOrgRequirement"  width='200pt' runat="server" Text="Add Organization Requirement"  CssClass="button"  onclick="btnCreaterequiredEvent_Click"></asp:Button>
              </td>
              <td>
                <asp:Button ID="btnAddUser"  width='200pt' runat="server" Text="Add User"  
                      CssClass="button" onclick="btnAddUser_Click" ></asp:Button>
              </td></tr>
              <tr>
              <td>
                <asp:Button ID="btnEditOrgRequirement"  width='200pt' runat="server" Text="Edit Organization Requirement"  CssClass="button"  onclick="btnScheduleReqEventMeet_Click"></asp:Button>
                </td>
              <td>
                <asp:Button ID="btnEditUser"  width='200pt' runat="server" Text="Edit User"  
                      CssClass="button" onclick="btnEditUser_Click"></asp:Button>
                </td>
              </tr>
              <tr>
              <td>
                  <asp:Label ID="Label5" runat="server" Text="Reset"></asp:Label>
                </td>
              <td>
                  &nbsp;</td>
              </tr>
              <tr>
              <td>
                <asp:Button ID="btnResetStudentRoster"  width='200pt' runat="server" Text="Reset Student Roster"  
                      CssClass="button" onclick="btnResetStudentRoster_Click"></asp:Button>
                </td>
              <td>
                  &nbsp;</td>
              </tr>
         </table>
     </div>
</asp:Content>