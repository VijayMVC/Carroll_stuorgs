<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CXExport.aspx.cs" MasterPageFile="~/Shared/Site.Master"  Inherits="StudentOrganisationApp.Reports.CXExport" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;height:100%"> 
        <tr>
            <td colspan="5">
                <asp:Label runat="server">This report will generate the excel file that can be sent to ITS to update CX with the student rosters.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label runat="server">Tip: If there are entries with a blank CX Organization Code, please go back and correct this before exporting.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label runat="server">Tip: Only after running this report and <b>exporting</b> it, should you reset the student rosters for this term.</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinqDataSource ContextTypeName="StudentOrganizationDBClassDataContext" ID="LinqDataSource1" AutoSort="true" OnSelecting="LinqDataSource_Selecting" runat="server"></asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td colspan = "3">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnExport" runat="server" Text="Export To CSV" onclick="btnExport_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan= "3" valign="middle" align = "center">
                <asp:GridView DataSourceID="LinqDataSource1" AutoGenerateColumns="false" AllowSorting="true" ID="GridView1" runat="server">
                    <Columns>
                        <asp:BoundField DataField="CX_Code" Headertext="CX Organization Code"/>
                        <asp:BoundField DataField="Carroll_ID" Headertext="Carroll Student ID"/>
                        <asp:BoundField DataField="MemberName" Headertext="Position"/>
                        <asp:BoundField DataField="Session" Headertext="Session"/>
                        <asp:BoundField DataField="Year" Headertext="Year"/>
                    </Columns>
                </asp:GridView>
            </td> 
        </tr>
</table>
</asp:Content>