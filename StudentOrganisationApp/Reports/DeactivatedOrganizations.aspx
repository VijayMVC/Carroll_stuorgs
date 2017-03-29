<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeactivatedOrganizations.aspx.cs" MasterPageFile="~/Shared/Site.Master" Inherits="StudentOrganisationApp.Reports.DeactivatedOrganizations" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<table style="width:100%;height:100%"> 
<tr>
<td>
<asp:LinqDataSource 
    ContextTypeName="StudentOrganizationDBClassDataContext"   
    ID="LinqDataSource1"   
    AutoSort="true" 
    OnSelecting="LinqDataSource_Selecting"
    runat="server">    
</asp:LinqDataSource>
</td>
</tr>
<tr>
<td>
<asp:GridView 
    DataSourceID="LinqDataSource1" 
    AutoGenerateColumns="false"
    AllowSorting="true"
    ID="GridView1" 
    runat="server">
    <Columns>
        <asp:BoundField DataField="OrganizationName" Headertext="Organization" SortExpression="OrganizationName"/>        
        <asp:BoundField DataField="Deactivated" Headertext="Deactivated Date" SortExpression="Deactivated"/>
    </Columns>
</asp:GridView>
</td>
</tr>
<tr>
<td>
 <asp:Button ID="btnExport" runat="server" Text="Export To Excel" 
        onclick="btnExport_Click" />
</td>
</tr>
</table>
</asp:Content>