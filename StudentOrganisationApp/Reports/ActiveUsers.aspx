<%@ Page Title="Active Users" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="ActiveUsers.aspx.cs" Inherits="StudentOrganisationApp.Reports.ActiveUsers" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;height:100%">
        <tr>
            <td colspan="2">
                <asp:Label runat="server">This report will list information about all of the active users.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td width="25%">
                <asp:Label ID="lblactive" runat="server" Text="Include Inactive Users?"></asp:Label>
            </td>
            <td>
                <asp:CheckBox runat="server" ID="incl_inactive" Checked ="false" Text="" AutoPostBack="true" OnCheckedChanged="incl_inactive_CheckedChanged"/>
            </td>
        </tr>
    </table>
    <br />
    <table style="width:100%;height:100%">
        <tr>
            <td>
                <asp:Button ID="btnExport" runat="server" Text="Export To Excel" onclick="btnExport_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_count"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView AutoGenerateColumns="false" AllowSorting="true" ID="grdReport" runat="server">
                    <Columns>
                        <asp:BoundField DataField="UserName" Headertext="User Name" ControlStyle-Width="15%"/>
                        <asp:BoundField DataField="Firstname" Headertext="First Name" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="Lastname" Headertext="Last Name" ControlStyle-Width="15%"/>
                        <asp:BoundField DataField="EmailAddress" Headertext="Email" ControlStyle-Width="15%"/>
                        <asp:BoundField DataField="PhoneNumber" Headertext="Phone" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="Role_Name" Headertext="Role" ControlStyle-Width="20%"/>
                        <asp:BoundField DataField="Active" Headertext="Active?" ControlStyle-Width="5%"/>
                        <asp:BoundField DataField="LimitedOrgCount" Headertext="Count of Orgs" ControlStyle-Width="10%"/>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>