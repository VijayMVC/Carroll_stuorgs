<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRoster.aspx.cs"  MasterPageFile="~/Shared/Site.Master" Inherits="StudentOrganisationApp.Reports.StudentRoster" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;height:100%">
        <tr>
            <td colspan="5">
                <asp:Label runat="server">This report will list all active members for all organizations.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label runat="server">Tip: A 0 in the "Meets Min Brd GPA" or the "Meets Min Std GPA" column indicates that the student does not pass the associated minimum GPA check.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5">Tip: Click on a column heading to sort by that column.</td>
        </tr>
        <tr>
            <td colspan="5"></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnExport" runat="server" Text="Export To Excel" onclick="btnExport_Click" />
            </td>
            <td>
                <asp:LinqDataSource ContextTypeName="StudentOrganizationDBClassDataContext" ID="LinqDataSource1" AutoSort="true" OnSelecting="LinqDataSource_Selecting" runat="server">
                    <%--   <WhereParameters><asp:ControlParameter Name="Organization_ID" ControlID="ddlSelectOrganization" Type="String" />
                           </WhereParameters>    --%>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td colspan= "3" valign="middle" align = "center">
                <asp:GridView DataSourceID="LinqDataSource1" AutoGenerateColumns="false" AllowSorting="true" ID="GridView1" runat="server">
                    <Columns>
                        <asp:BoundField DataField="OrganizationName" Headertext="Organization" SortExpression="OrganizationName"/>
                        <asp:BoundField DataField="MemberName" Headertext="Member Type" SortExpression="MemberName"/>
                        <asp:BoundField DataField="Carroll_ID" Headertext="Carroll ID" SortExpression="Carroll_ID"/>
                        <asp:BoundField DataField="FirstName" Headertext="First Name" SortExpression="FirstName"/>
                        <asp:BoundField DataField="LastName" Headertext="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="Email" Headertext="Email"/>
                        <asp:BoundField DataField="GPABoard" Headertext="Meets Min Brd GPA?" SortExpression="GPABoard" />
                        <asp:BoundField DataField="GPAOrg" Headertext="Meets Min Std GPA?" SortExpression="GPAOrg" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
