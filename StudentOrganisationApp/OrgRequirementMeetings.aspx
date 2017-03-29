<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Site.Master" AutoEventWireup="true" CodeBehind="OrgRequirementMeetings.aspx.cs" Inherits="StudentOrganisationApp.OrgRequirementMeetings" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
<div align="left">
<table align="left" width="100%">                
     <tr>
                <td align="left" width="100%">
                <asp:Panel ID="pnlMeeting" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Meeting"
                 Wrap="True">
                <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
    <tr>
                   <td width="20%">
                        <asp:Label ID="lblMeetingSession" runat="server">Session </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtMeetingSession" runat="server" ForeColor="#999999"></asp:TextBox>
                    </td>
                     <td width="20%">
                        <asp:Label ID="lblMeetingYear" runat="server">Year </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtMeetingYear" runat="server" ForeColor="#999999"></asp:TextBox>
                    </td>
                </tr>   
    <tr>
                   <td width="20%">
                        <asp:Label ID="lblMeetingDate" runat="server">Date </asp:Label>
                    </td>                        
                    <td width="30%">
                            <div id="divcalMeetingDate" style="display:none;">
                                <asp:CalendarExtender ID="calMeetingDate" runat="server" TargetControlID="txtMeetingDate" PopupButtonID="imgMeetingDate" Format="MM/dd/yyyy" />
                            </div>
                            <asp:TextBox ID="txtMeetingDate" Runat="server" width="100pt" 
                                contentEditable="false"/>
                            <asp:ImageButton ID="imgMeetingDate" Width="16" Height="16" runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        
                     </td>
                     <td width="20%">
                        <asp:Label ID="lblMeetingTime" runat="server">Time </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtMeetingTime" runat="server" ForeColor="#999999"></asp:TextBox>
                    </td>
                </tr> 
    <tr>
                   <td width="20%">
                        <asp:Label ID="lblMeetingBuilding" runat="server">Building </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtMeetingBuilding" runat="server" ForeColor="#999999"></asp:TextBox>
                    </td>
                     <td width="20%">
                        <asp:Label ID="lblMeetingRoom" runat="server">Room </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtMeetingRoom" runat="server" ForeColor="#999999"></asp:TextBox>
                    </td>
                </tr>
    <tr>
                <td width="20%">
                <asp:Label ID="lblNotes" runat="server">Notes </asp:Label>
                </td>
                <td colspan="3" width="30%">
                <asp:TextBox ID="txtNotes" runat="server"  ForeColor="#999999" 
                            TextMode="MultiLine" CssClass="largeTextbox" Height="100pt" 
                        Width="90%"></asp:TextBox>
                </td>
                </tr>  
    <tr>
                    <td width="20%"  >
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" />
                        <asp:Button ID="btnAddRequiredEventMeeting" runat="server" 
                            onclick="btnAddRequiredEventMeeting_Click" Text="  Add  " />
                    </td>                        
                </tr> 
    <tr>
                        <td width="20%">
                        <asp:Label ID="lblRequiredEventID" runat="server" Visible="false"></asp:Label>
                    </td> 
                    <td width="30%">
                        <asp:Label ID="lblMeetingID" runat="server" Visible ="false"></asp:Label>
                    </td> 
                    
                </tr> 
</table>
</asp:Panel>
</td>
</tr>
     <tr>
        <td width="100%">
           <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
        </td>
      </tr> 
</table>
</div>
</asp:Content>

