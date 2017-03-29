<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master"  CodeBehind="CreateOrganizationCategory.aspx.cs" Inherits="StudentOrganisationApp.SetUp.CreateOrganizationCategory" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
 <div align="left">
    <table align="left" width="100%">
                <tr>
                   <%-- <asp:Label ID="lblNewOrgCat" runat="server" CssClass="Headers">New Oragnization Category</asp:Label>--%>
                </tr>
                <tr>
                <td align="left">
                <asp:Panel ID="pnlOrgCategory" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Category"
                 Wrap="True">
                <table style="background: #CCCCCC; width:100%; height:100%">
                  <tr>
                    <td width="20%">
                        <asp:Label ID="lblNewOrgCatName" runat="server">Name </asp:Label>
                    </td>                        
                    <td width="30%">
                        <asp:TextBox ID="txtNewOrgCatName" runat="server" ForeColor="Black" 
                            Width="200pt"></asp:TextBox>
                    </td> 
                    <td width="20%">
                        <asp:Label ID="lblAddDate" runat="server">Add Date </asp:Label>
                    </td>
                    <td width="30%">
                        <div id="dateField" style="display:none;">
                           <asp:CalendarExtender ID="calExtenderNewOrgCat" runat="server" 
                                TargetControlID="txtExtenderNewOrgCat" PopupButtonID="imgExtenderNewOrgCat" 
                                Format="MM/dd/yyyy" Enabled="True" />
                        </div>
                        <asp:TextBox ID="txtExtenderNewOrgCat" Runat="server" width="100pt" 
                            contentEditable="false" ForeColor="Black" />
                        <asp:ImageButton ID="imgExtenderNewOrgCat" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        
                    </td>                 
                </tr> 
                <tr>
                   <td valign="top" width="20%">
                        <asp:Label ID="lblCategoryDesc" runat="server">Description </asp:Label>
                    </td>                        
                    <td colspan ="3" width="30%">
                        <asp:TextBox ID="txtCategoryDesc" runat="server" ForeColor="Black" 
                            CssClass="largeTextbox" TextMode="MultiLine" Height="200px" Width="90%"></asp:TextBox>
                    </td>
                </tr>                   
                <tr>
                    
                    <td width="20%">
                        <asp:Label ID="Label1" runat="server">Greek Organization </asp:Label>
                    </td>
                    <td align="left" width="30%">
                        <asp:CheckBox ID="chkGreekOrg" runat="server" />                        
                    </td>
                
                </tr> 
                <tr>
                    <td width="20%" >
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" CausesValidation="False" />
                        <asp:Button ID="btnAddOrgCategory" runat="server" 
                            onclick="btnAddOrgCategory_Click" Text="  Add  " />
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
