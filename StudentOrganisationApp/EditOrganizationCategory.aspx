<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master"  CodeBehind="EditOrganizationCategory.aspx.cs" Inherits="StudentOrganisationApp.SetUp.EditOrganizationCategory" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<table width="100%">
<tr>
<td>
   <asp:Panel ID="pnlSelection" runat="server" Visible = "true" align= "left">  
         <table>
<tr>
   <%-- <asp:Label ID="lblEditOrgCategory" runat="server" CssClass="Headers">Edit Organization Category </asp:Label>--%>
</tr>
<tr>
    <td colspan="2" width="30%">
      <asp:Label ID="lblSelectOrgCategory" runat="server">Select Organization Category</asp:Label>
    </td>                        
    <td width="30%" >
      <asp:DropDownList  AppendDataBoundItems="true" ID="ddlSelectOrgCategory" runat="server" width = '200pt'>
        <asp:ListItem Text="Select Organization Category" Value="-1" />
      </asp:DropDownList>
    </td>
    <td width="40%" >
      <asp:Button ID="btnGo" runat="server" Text="Select" 
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
                 HorizontalAlign="Left" Width="100%" GroupingText="Category"
                 Wrap="True">          
   
    <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
                <tr  style="height:50px">
                    <asp:Label ID="lblEditOrgCat" runat="server"></asp:Label>
                </tr>
                <tr>
                    <td width="20%">
                        <asp:Label ID="lblEditOrgCatName" runat="server">Name </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtEditOrgCatName" runat="server" ForeColor="Black" 
                            Width="200px"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                <td width="20%">
                        <asp:Label ID="lblGreekOrg" runat="server">Greek Organization </asp:Label>
                    </td>
                    <td align="left" width="30%">
                        <asp:CheckBox ID="chkGreekOrg" runat="server" />                        
                    </td>
                    
                </tr> 
                <tr>
                   <td valign="top" width="20%">
                        <asp:Label ID="lblCategoryDesc" runat="server">Event Notes </asp:Label>
                    </td>                        
                    <td colspan="3" width="30%">
                        <asp:TextBox ID="txtCategoryDesc" runat="server" ForeColor="Black"  
                            CssClass="largeTextbox" TextMode="MultiLine" Height="100pt" Width="90%"></asp:TextBox>
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
                        <asp:TextBox ID="txtOrgCatAddDate" Runat="server" contentEditable="false" 
                            ForeColor="Black" />
                        <%--<asp:ImageButton ID="imgExtenderNewOrgCat" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        --%>
                        <asp:ImageButton ID="imgExtenderAddDate" runat="server" 
                            CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                            Width="16px" />
                             <asp:CalendarExtender ID="calExtenderAddDate" runat="server" 
                                TargetControlID="txtOrgCatAddDate" PopupButtonID="imgExtenderAddDate" 
                                Format="MM/dd/yyyy" Enabled="True" />
                    </td>
                    <td width="20%">
                        <asp:Label ID="lblEndDate" runat="server">End Date </asp:Label>
                    </td>
                    <td width="30%">
                        <div id="dateField" style="display:none;">
                           <asp:CalendarExtender ID="calExtenderEndDate" runat="server" 
                                TargetControlID="txtExtenderEndDate" PopupButtonID="imgExtenderEndDate" 
                                Format="MM/dd/yyyy" Enabled="True" />
                        </div>
                        <asp:TextBox ID="txtExtenderEndDate" Runat="server" width="100pt" 
                            contentEditable="false" ForeColor="Black"/>
                        <asp:ImageButton ID="imgExtenderEndDate" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        
                    </td>
                </tr>
                <tr>
                    <td width="20%" colspan="4" >
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" onclick="btnCanel_Click" 
                            style="height: 26px" CausesValidation="False" />
                        <asp:Button ID="btnUpdateOrgCategory" runat="server" 
                            onclick="btnUpdateOrgCategory_Click" Text="Save" />
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