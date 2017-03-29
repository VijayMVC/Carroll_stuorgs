<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Site.Master" CodeBehind="CreateAdvisor.aspx.cs" Inherits="StudentOrganisationApp.Advisor.CreateAdvisor" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <div align="left">
    <table align="left" width="100%">
                <tr>
                   <%-- <asp:Label ID="lblNewAdvisor" runat="server" CssClass="Headers">New Advisor</asp:Label>--%>
                </tr>
                <tr>
                <td align="left">
                <asp:Panel ID="pnlAdvisor" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Advisor"
                 Wrap="True" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                <tr>
                    <td>
                        <asp:Label ID="lblLastName" runat="server">Last Name </asp:Label>
                    </td>                        
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>
                    <td>
                         <asp:Label ID="lblFirstName" runat="server">First Name </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>                    
                    <td>
                        &nbsp;</td>
                </tr> 
                <tr>
                    <td>
                        <asp:Label ID="lblPhoneNumber" runat="server">Phone Number </asp:Label>
                    </td>                        
                    <td>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" ForeColor="Black"></asp:TextBox>    
                    </td>
                    <td>
                         <asp:Label ID="lblEmailID" runat="server">Email </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmailID" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="revemail" runat="server" 
                            ControlToValidate="txtEmailID" ErrorMessage="Please enter a valid e-mail" 
                            ForeColor="Red" 
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>   
                <tr>
                    <td>
                        <asp:Label ID="lblProfessionalTitle" runat="server">Professional Title </asp:Label>
                    </td>                        
                    <td>
                        <asp:TextBox ID="txtProfessionalTitle" runat="server" ForeColor="Black"></asp:TextBox>    
                    </td>                
                    <td>
                        <asp:Label ID="lblAdvisorTitle" runat="server">Advisor Title </asp:Label>
                    </td>                        
                    <td>
                        <asp:TextBox ID="txtAdvisorTitle" runat="server" ForeColor="Black"></asp:TextBox>    
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAdvisorType" runat="server">Advisor Type </asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:RadioButtonList ID="rblAdvisorType" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem>Carroll Advisor</asp:ListItem>  
                            <asp:ListItem>Community Advisor</asp:ListItem> 
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr> 
                <tr>
                    <td>
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click"/>
                        <asp:Button ID="btnAdd" runat="server" onclick="btnAddAdvisor_Click" 
                            Text="  Add  " />
                    </td>                        
                </tr> 
               </table>
                </asp:Panel>
                </td> 
                </tr> 
                <tr>
                <td  style="width:300px">
                <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
                    <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" 
                        ForeColor="Red" ShowMessageBox="false" ShowSummary="true" />
                </td>
                </tr> 
            </table>
     </div>
</asp:Content>
