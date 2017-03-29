<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs"  MasterPageFile="~/Shared/Site.Master"  Inherits="StudentOrganisationApp.AddUser" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<div align="left">
    <table align="left" width="100%">
        <tr>
            <td align="left">
                <asp:Panel ID="pnlUser" runat="server" BorderColor="#CCCCCC" Height= "100%"
                    HorizontalAlign="Left" Width="100%" GroupingText="User" Wrap="True">

                <table style="background: #CCCCCC; width:100%; height:100%">
                <tr>
                    <td>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server" ForeColor="Black" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="Please enter a First Name" EnableClientScript="true" SetFocusOnError="true" Text="*"   
                            ForeColor="Red"    ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server" ForeColor="Black" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvLasttName" runat="server" ErrorMessage="Please enter a Last Name" EnableClientScript="true" SetFocusOnError="true" Text="*"  
                            ForeColor="Red" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text="Phone #"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Phone" runat="server" ForeColor="Black" MaxLength="15" ></asp:TextBox>
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <asp:Label ID="EmlLabel" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Email" runat="server" ForeColor="Black" MaxLength="100"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="revemail" runat="server" 
                            ControlToValidate="Email" ErrorMessage="Please enter a valid e-mail" 
                            ForeColor="Red" 
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>  
                <tr>
                    <td>
                        <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" ForeColor="Black" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ErrorMessage="Please Enter UserID" EnableClientScript="true" SetFocusOnError="true" Text="*"  
                        ForeColor="Red"     ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" ForeColor="Black" TextMode="password" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Please Enter Password" EnableClientScript="true" SetFocusOnError="true" Text="*"
                            ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top"> 
                        <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblRoles" ClientIDMode="Static" runat="server">
                        <asp:ListItem>Admin</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvRole" runat="server" ErrorMessage="Please select a Role" EnableClientScript="true" SetFocusOnError="true" Text="*"  
                                ControlToValidate="rblRoles" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td rowspan="1" colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="false" DisplayMode="BulletList" ShowSummary="true" />
                    </td>
                </tr>     
                <tr>
                    <td colspan="6">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            </asp:Panel>
            </td>
        </tr>   
        <tr>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Save" onclick="btnSubmit_Click" />
            </td>
        </tr>
    </table>

</div>
</asp:Content>
