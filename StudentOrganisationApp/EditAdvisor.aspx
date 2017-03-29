<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Site.Master" CodeBehind="EditAdvisor.aspx.cs" Inherits="StudentOrganisationApp.Advisor.EditAdvisor" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table width="100%">
<tr>
<td width="100%">
   <asp:Panel ID="pnlSelection" runat="server" Visible = "true" align= "left" DefaultButton="btnGo">  
         <table>
             <tr>
                  <td width="30%">
                    <asp:Label ID="lblSelectAdvisor" runat="server">Select Advisor </asp:Label>
                  </td>                        
                  <td width="30%" >
                      <asp:ComboBox ID="ddlSelectAdvisor" runat="server" AppendDataBoundItems="True" 
                          AutoCompleteMode="Suggest" ForeColor="Black" MaxLength="0" Width="200px">
                          <asp:ListItem Text="Select Advisor" Value="-1" Selected=True/>
                      </asp:ComboBox>
                  </td>
                  <td width="40%">
                      <asp:Button ID="btnGo" runat="server" Height="24px" onclick="btnGo_Click" 
                          Text="Select" width="50pt" />
                  </td>
             </tr>
         </table>
    </asp:Panel>
    <asp:Label ID="lblAdvisorName" runat="server" Font-Bold="True"></asp:Label>
</td>
</tr>
<tr>
<td>
<asp:Panel ID="pnlEditing" runat="server" Visible = "false" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Advisor"
                 Wrap="True">          
   
    <table style="background: #CCCCCC; width:100%; height:100%">
               <%-- <tr style="height:50px">
                    <asp:Label ID="lblNewAdvisor" runat="server"></asp:Label>
                </tr>--%>
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
                            onclick="btnCanel_Click" CausesValidation="False"/>
                        <asp:Button ID="btnEditAdvisor0" runat="server" onclick="btnEditAdvisor_Click" 
                            Text="Save" />
                    </td>                        
                </tr> 
                <tr>
                <td colspan="5" align="center">
                    <asp:GridView ID="grdOrganization" runat="server" BorderStyle="Solid" 
                        Width="100%">
                    </asp:GridView>
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
    
</asp:Content>
