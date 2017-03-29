<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExecMemberGPAFail.aspx.cs" MasterPageFile="~/Shared/Site.Master" Inherits="StudentOrganisationApp.Reports.ExecMemberGPAFail" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;height:100%">
        <tr>
            <td colspan="5">
                <asp:Label runat="server">This report will list all students registered as members of an active Organization that are failing the appropriate GPA check.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5"></td>
        </tr>
        <tr>
            <td>
             <asp:Button ID="btnExport" runat="server" Text="Export To Excel" onclick="btnExport_Click" />
            </td>
        </tr>
        <tr>
            <td colspan = "5" valign="middle" align="center">
            <asp:GridView AutoGenerateColumns="false" AllowSorting="true" ID="grdReport" runat="server">
                <Columns>
                    <asp:BoundField DataField="Term" Headertext="Term"/>       
                    <asp:BoundField DataField="OrganizationName" Headertext="Organization"/>       
                    <asp:BoundField DataField="MemberName" Headertext="Member Type"/>       
                    <asp:BoundField DataField="Carroll_ID" Headertext="Carroll ID"/>       
                    <asp:BoundField DataField="FirstName" Headertext="First Name"/>       
                    <asp:BoundField DataField="LastName" Headertext="Last Name"/>       
                    <asp:BoundField DataField="Email" Headertext="Email"/>       
                    <asp:BoundField DataField="GPABoard" Headertext="Board GPA"/>       
                    <asp:BoundField DataField="GPAOrg" Headertext="Org GPA"/>
                </Columns>
            </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>