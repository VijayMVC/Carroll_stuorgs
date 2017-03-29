<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveMembers.aspx.cs"  MasterPageFile="~/Shared/Site.Master" Inherits="StudentOrganisationApp.ActiveMembers" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;height:100%">
        <tr>
            <td colspan="5">
                <asp:Label runat="server">This date-driven report will list the total number of active users for all organizations.</asp:Label>
            </td>
        </tr>
        <tr>
             <td colspan="5">
                <asp:Label runat="server">Tip: To get all active members, choose the first day of the session and an end date in the future.</asp:Label>
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
                <asp:TextBox ID="txtBeginDate" Runat="server" width="100pt" contentEditable="false"/>
                <asp:ImageButton ID="imgBeginDate" Width="16px" Height="16px" runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
            </td>
            <td>
                <asp:Label ID="lblToDate" runat="server" Text="To Date"></asp:Label>
            </td>
            <td>
                <div id="divcalEndDate" style="display:none;">
                    <asp:CalendarExtender ID="calEndDate" runat="server" TargetControlID="txtEndDate" PopupButtonID="imgEndDate" Format="MM/dd/yyyy" Enabled="True" />
                </div>
                <asp:TextBox ID="txtEndDate" Runat="server" width="100pt" contentEditable="false"/>
                <asp:ImageButton ID="imgEndDate" Width="16px" Height="16px" runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
            </td>
            <td>
                <asp:Button ID="btnReport" runat="server" Text="Generate Report" onclick="btnReport_Click"/>
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
                    <asp:BoundField DataField="Number_of_Members" Headertext="Number of Members"/>
                </Columns>
            </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>