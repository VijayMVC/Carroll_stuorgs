<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master"  CodeBehind="CreateMemberType.aspx.cs" Inherits="StudentOrganisationApp.SetUp.CreateMemberType" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<div align="left">
    <table align="left" width="100%">
                <tr>
                  <%--  <asp:Label ID="lblNewMemType" runat="server" CssClass="Headers">New Member Type</asp:Label>--%>
                </tr>
                <tr>
                <td align="left">
                <asp:Panel ID="pnlMemType" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Member Type"
                 Wrap="True">
                <table style="background: #CCCCCC; width:100%; height:100%">
                <tr>
                    <td class="style2" width="20%">
                        <asp:Label ID="lblNewMemTypeName" runat="server">Member Type </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtNewMemTypeName" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>
                     <td  class="style2" width="20%">
                        <asp:Label ID="lblAddDate" runat="server">Add Date </asp:Label>
                    </td>
                    <td width="30%">
                        <div id="dateField" style="display:none;">
                           <asp:CalendarExtender ID="calExtenderNewMemType" runat="server" 
                                TargetControlID="txtExtenderNewMemType" PopupButtonID="imgExtenderNewMemType" 
                                Format="MM/dd/yyyy" Enabled="True" />
                        </div>
                        <asp:TextBox ID="txtExtenderNewMemType" Runat="server" width="100pt" 
                            ReadOnly = "false" contentEditable="false" ForeColor="Black" />
                        <asp:ImageButton ID="imgExtenderNewMemType" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        
                    </td>
                   
                </tr> 
                <tr>
                   <td valign="top" width="20%">
                        <asp:Label ID="lblMemberDesc" runat="server">Member Description </asp:Label>
                    </td>                        
                    <td  colspan="3" width="30%">
                        <asp:TextBox ID="txtMemberDesc" runat="server" ForeColor="Black" 
                            TextMode="MultiLine" CssClass="largeTextbox" Height="100pt" Width="90%"></asp:TextBox>
                    </td>
                </tr>  
                <tr>
                <td width="20%">
                        <asp:Label ID="lblBroadMember" runat="server">Broad Member </asp:Label>
                    </td>
                 <td align ="left" width="30%">
                        <asp:CheckBox ID="chkBroadMember" runat="server" />                        
                    </td>
                    
                </tr> 
                <tr>
                    <td width="20%" >
                        <asp:Button ID="btnCanel" runat="server" Text="Clear" 
                            onclick="btnCanel_Click" />
                        <asp:Button ID="btnAddMemberType" runat="server" 
                            onclick="btnAddMemberType_Click" Text="  Add  " />
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