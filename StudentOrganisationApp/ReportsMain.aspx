<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportsMain.aspx.cs"  MasterPageFile="~/Shared/Site.Master"  Inherits="StudentOrganisationApp.ReportsMain" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Table runat="server" style="width:100%;height:100%">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Student Related Reports</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkStudentRoster" runat="server" onclick="lnkStudentRoster_Click">Student Roster Report</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkAllMembers" runat="server" onclick="lnkAllMembers_Click">All Active Members, with filters</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkActiveMembers" runat="server" onclick="lnkActiveMembers_Click">Active Member Count, By Organization</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkExecutiveMembers" runat="server" onclick="lnkExecutiveMembers_Click">All Active Executive Members</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkGPAfail" runat="server" onclick="lnkGPAfail_Click">Members failing GPA requirements</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkHistoryOfMembers" runat="server" onclick="lnkHistoryOfMembers_Click">Student Roster CX Export</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table runat="server" style="width:100%;height:100%">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Event Related Reports</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkUpcomingEvents" runat="server" onclick="lnkUpcomingEvents_Click">Upcoming Events</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table runat="server" style="width:100%;height:100%">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Organization Related Reports</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkOrgDump" runat="server" onclick="lnkOrgDump_Click">Organization Dump</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkDeactivatedOrganizations" runat="server" onclick="lnkDeactivatedOrganizations_Click">Deactivated Organizations</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table runat="server" style="width:100%;height:100%">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>User Related Reports</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:LinkButton ID="lnkActiveUsers" runat="server" onclick="lnkActiveUsers_Click">Active Users</asp:LinkButton>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>