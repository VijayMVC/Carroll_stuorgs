<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master"  CodeBehind="EditMemberType.aspx.cs" Inherits="StudentOrganisationApp.SetUp.EditMemberType" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<table width="100%">
<tr>
<td>
   <asp:Panel ID="pnlSelection" runat="server" Visible = "true" align= "left" 
        Width="100%">
   <table width="100%">
   <tr>
              <%--   <asp:Label ID="lblEditMemberType" runat="server" CssClass="Headers">Edit Member Type </asp:Label>--%>
             </tr>
             <tr>
                  <td  style="width: 20%" colspan="2">
                    <asp:Label ID="lblSelectMemberType" runat="server">Select Member Type </asp:Label>
                  </td>                        
                  <td style="width: 60%" >
                    <asp:DropDownList  AppendDataBoundItems="true" ID="ddlSelectMemberType" runat="server" width = '200pt'>
                        <asp:ListItem Text="Select Member Type" Value="-1" />
                     </asp:DropDownList>
                  </td>
                  <td  style="width: 20%" >
                     <asp:Button ID="btnGo" runat="server" Text="Go" width='50pt' 
                          onclick="btnGo_Click" />
                  </td>    
             </tr>
   </table>  
   </asp:Panel>   
</td>
</tr>
<tr>
<td>
<asp:Panel ID="pnlEditing" runat="server" Visible = "false" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Member Type"
                 Wrap="True">          
   
    <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
                    <tr>                  
                    <td width="20%">
                        <asp:Label ID="lblEditMemTypeName" runat="server">Member Type</asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtEditMemTypeName" runat="server" ForeColor="Black"></asp:TextBox>
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
                   <td style="height: 40px" valign="top" width="20%">
                        <asp:Label ID="lblMemberDesc" runat="server">Member Description </asp:Label>
                    </td>                        
                    <td colspan="3" style="height: 40px" width="30%">
                        <asp:TextBox ID="txtMemberDesc" runat="server"  CssClass="largeTextbox" 
                            ForeColor="Black" TextMode="MultiLine" Height="100pt" Width="90%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        <asp:Label ID="lblAddDate" runat="server">Add Date </asp:Label>
                    </td>
                    <td width="30%">
                      <%--  <div id="dateField" style="display:none;">
                           <asp:CalendarExtender ID="calExtenderNewOrgCat" runat="server" 
                                TargetControlID="txtExtenderNewOrgCat" PopupButtonID="imgExtenderNewOrgCat" 
                                Format="MM/dd/yyyy" Enabled="True" />
                        </div>--%>
                        <asp:TextBox ID="txtMemTypeAddDate" Runat="server" width="100pt" 
                            contentEditable="false" ForeColor="Black" />
                        <%--<asp:ImageButton ID="imgExtenderNewOrgCat" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        --%>
                        <asp:ImageButton ID="imgExtenderEditMemType0" runat="server" 
                            CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                            Width="16px" />
                               <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                TargetControlID="txtMemTypeAddDate" PopupButtonID="imgExtenderEditMemType0" 
                                Format="MM/dd/yyyy" Enabled="True" />
                    </td>
                    <td width="20%">
                        <asp:Label ID="lblEndDate" runat="server">End Date </asp:Label>
                    </td>
                    <td width="30%">
                        <div id="dateField" style="display:none;">
                           <asp:CalendarExtender ID="calExtenderEditMemType" runat="server" 
                                TargetControlID="txtExtenderEditMemType" PopupButtonID="imgExtenderEditMemType" 
                                Format="MM/dd/yyyy" Enabled="True" />
                        </div>
                        <asp:TextBox ID="txtExtenderEditMemType" Runat="server" width="100pt" 
                            contentEditable="false" ForeColor="Black"  />
                        <asp:ImageButton ID="imgExtenderEditMemType" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        
                    </td>
                </tr>   
 
                <tr>
                    <td class="style2" width="20%" >
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" CausesValidation="False" />
                        <asp:Button ID="btnUpdateMemberType" runat="server" 
                            onclick="btnUpdateMemberType_Click" Text="Save" />
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