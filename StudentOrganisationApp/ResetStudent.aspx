<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="ResetStudent.aspx.cs" Inherits="StudentOrganisationApp.ResetStudent" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" 
                    Text="This action is irreversible. All student memberships for all organizations will be reset (including Executive Board Members) and there is no way to undo this action."></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" 
                    Text="Please only click on the button when you are completely sure you want to end the current semester and after you have confirmed that there are no users actively logged in."></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="height: 20px">
                <asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" Text="Reset Student Roster" />
                    <asp:ConfirmButtonExtender runat="server" ConfirmText="Are you sure you want to proceed?" TargetControlID="btnReset"></asp:ConfirmButtonExtender>
            </td>
        </tr>
    </table>
</asp:Content>