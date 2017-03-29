<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Site.Master"  CodeBehind="EditRequiredEvent.aspx.cs" Inherits="StudentOrganisationApp.SetUp.ScheduleMeetings" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<table width="100%">
<tr>
<td>
   <asp:Panel ID="pnlSelection" runat="server" Visible = "true" align= "left">  
    <table align="left" width="100%">
                <tr>
                 <%--   <asp:Label ID="lblScheduleMeeting" runat="server" CssClass="Headers">Edit Organization Requirement</asp:Label>--%>
                </tr>
                <tr>
                    <td width="30%">
                        <asp:Label ID="lblRequiredEvent" runat="server">Select Required Event </asp:Label>
                    </td>                        
                     <td width="30%">
                            <asp:DropDownList  AppendDataBoundItems="true" ID="ddlRequiredEvents" 
                                runat="server" Width="200pt">
                            <asp:ListItem Text="Select Required Event" Value="-1" />
                            </asp:DropDownList>
                     </td>
                     <td width="40%">
                        <asp:Button ID="btnGo" runat="server" Text="Select" onclick="btnGo_Click" />
                     </td>
                </tr> 
                </table>
   </asp:Panel>
</td>
</tr>
<tr>
<td>
<asp:Panel ID="pnlEditing" runat="server" Visible = "false" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Requirement"
                 Wrap="True">          
   
    <table style="background: #CCCCCC; width:100%; height:100%">               
                <tr>
                    <td >
                        <asp:Label ID="Label1" runat="server">Requirement </asp:Label>
                    </td>                        
                    <td>
                        <asp:TextBox ID="txtRequiredEvent" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblAddDate" runat="server">Add Date </asp:Label>
                    </td>
                    <td>
                        <div id="dateField" style="display:none;">
                           <asp:CalendarExtender ID="calExtenderRequiredEvent" runat="server" 
                                TargetControlID="txtExtenderRequiredEvent" PopupButtonID="imgExtenderRequiredEvent" 
                                Format="MM/dd/yyyy" Enabled="True" />
                        </div>
                        <asp:TextBox ID="txtExtenderRequiredEvent" Runat="server" width="100pt" 
                            contenteditable="false" ForeColor="Black" />
                        <asp:ImageButton ID="imgExtenderRequiredEvent" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        
                    </td>
                </tr> 
                <tr>
                   <td valign="top">
                        <asp:Label ID="lblEventNotes" runat="server">Notes </asp:Label>
                    </td>                        
                    <td colspan="3">
                        <asp:TextBox ID="txtEventNotes" runat="server" CssClass="largeTextbox" 
                            ForeColor="Black" TextMode="MultiLine" Height="100pt" Width="90%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" CausesValidation="False"/>
                        <asp:Button ID="btnEditRequiredEvent" runat="server" 
                            onclick="btnEditRequiredEvent_Click" Text="Save" />
                    </td>                        
                </tr>    
            </table>                
</asp:Panel>
</td>
</tr>
<tr>
<td>
<asp:Panel ID="pnlMeeting" runat="server" Visible = "false" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Meeting"
                 Wrap="True" Width="100%">          
   
    <table style="background: #CCCCCC; width:100%; height:100%"> 
<tr>
<td>
    <asp:GridView ID="grdMeeting" runat="server" DataKeyNames="MeetingID" 
        onrowcommand="grdMeeting_RowCommand" 
        onrowdatabound="grdMeeting_RowDataBound" Width="100%">
 <Columns>
<asp:TemplateField ShowHeader="False">
<ItemTemplate>
 <asp:Button ID="btnEdit" runat="server" CausesValidation="false" CommandName="EditMeeting" Text="Edit" CommandArgument='<%# Eval("MeetingID") %>' />
</ItemTemplate> 
</asp:TemplateField>
</Columns>
</asp:GridView> 
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnAddMeeting" runat="server" Text="Add Meetings" 
        onclick="btnAddMeeting_Click" />
</td>
</tr>
</table>
</asp:Panel>
</td>
</tr>
<tr>
   <td  style="width:300px">
      <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
   </td>
</tr> 
</table>    
</asp:Content>