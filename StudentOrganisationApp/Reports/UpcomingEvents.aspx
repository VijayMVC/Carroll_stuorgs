<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpcomingEvents.aspx.cs" MasterPageFile="~/Shared/Site.Master" Inherits="StudentOrganisationApp.Reports.UpcomingEvents" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;height:100%">
        <tr>
            <td colspan="5">
                <asp:Label runat="server">This date-driven report will list all events in the specified range.</asp:Label>
            </td>
        </tr>
        <tr>
             <td colspan="5">
                <asp:Label runat="server">Tip: To get all upcoming events, use a blank end date.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFromDate" runat="server" Text="From Date"></asp:Label>
            </td>
            <td>
                <div id="divcalBeginDate" style="display:none;">
                    <asp:CalendarExtender ID="calBeginDate" runat="server" TargetControlID="txtBeginDate" PopupButtonID="imgBeginDate" Format="MM/dd/yyyy" Enabled="True" />
                </div>
                <asp:TextBox ID="txtBeginDate" Runat="server" AutoPostBack="true" width="100pt" contentEditable="false" OnTextChanged="txtBeginDate_TextChanged"/>
                <asp:ImageButton ID="imgBeginDate" Width="16px" Height="16px" runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
            </td>
            <td>
                <asp:Label ID="lblToDate" runat="server" Text="To Date"></asp:Label>
            </td>
            <td>
                <div id="divcalEndDate" style="display:none;">
                    <asp:CalendarExtender ID="calEndDate" runat="server" TargetControlID="txtEndDate" PopupButtonID="imgEndDate" Format="MM/dd/yyyy" Enabled="True" />
                </div>
                <asp:TextBox ID="txtEndDate" Runat="server" AutoPostBack="true" width="100pt" contentEditable="false" OnTextChanged="txtEndDate_TextChanged"/>
                <asp:ImageButton ID="imgEndDate" Width="16px" Height="16px" runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
            </td>
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
                    <asp:BoundField DataField="OrganizationName" Headertext="Organization"/>       
                    <asp:BoundField DataField="Title" Headertext="Title"/>
                    <asp:BoundField DataField="ShortDate" Headertext="Date"/>
                    <asp:BoundField DataField="Location" Headertext="Location"/>
                    <asp:BoundField DataField="ContactName" Headertext="Contact Name"/>
                    <asp:BoundField DataField="ContactPhone" Headertext="Contact Phone"/>
                    <asp:BoundField DataField="ContactEmail" Headertext="Contact Email"/>
                </Columns>
            </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>