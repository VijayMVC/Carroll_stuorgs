<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master"  CodeBehind="CreateRequiredEvent.aspx.cs" Inherits="StudentOrganisationApp.SetUp.CreateRequiredEvent" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
 <div align="left">
    <table align="left" width="100%">
                <tr>
                   <%-- <asp:Label ID="lblNewRequiredEvent" runat="server" CssClass="Headers">New Organization Requirement</asp:Label>--%>
                </tr>
                <tr>
                <td align="left">
                <asp:Panel ID="pnlOrgReq" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Requirement"
                 Wrap="True">
                <table style="background: #CCCCCC; width:100%; height:100%">
                <tr>
                    <td >
                        <asp:Label ID="lblRequiredEvent" runat="server">Requirement </asp:Label>
                    </td>                        
                    <td>
                        <asp:TextBox ID="txtRequiredEvent" runat="server" ForeColor="Black" 
                            Width="200px"></asp:TextBox>
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
                    <td>
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" />
                        <asp:Button ID="btnAddRequiredEvent" runat="server" 
                            onclick="btnAddRequiredEvent_Click" Text="  Add  " />
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
     </div>
</asp:Content>
