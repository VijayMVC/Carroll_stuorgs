<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationDump.aspx.cs" MasterPageFile="~/Shared/Site.Master"   Inherits="StudentOrganisationApp.Reports.OrganizationDump" %>

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
<td colspan = "3">
<table>
<tr>
<td>
<asp:Button ID="btnExport" runat="server" Text="Export To Excel" onclick="btnExport_Click" />
</td>
</tr>
</table>
</td>
</tr>
<tr><td colspan= "3" valign="middle" align = "center">
<asp:GridView 
    DataSourceID="LinqDataSource1" 
    AutoGenerateColumns="true"
    AllowSorting="true"
    ID="GridView1" 
    runat="server">    
</asp:GridView>
</td> </tr>
</table>
</asp:Content>


