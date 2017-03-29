<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RoleStyle.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form runat="server">
        <table style="width: 100%; height: 100%">
            <tr>
                <td colspan="2"  style="background-color:#1e2667;">
                    <img alt="Head" src="http://www.carrollu.edu/images/header.jpg" style="margin-left: 0px;" />
                </td>
            </tr>
            <tr>
                <td style="background-color: #E05206; " align="left" class="style2">
                    <asp:Label ID="lblWelcome" runat="server" Text="Welcome to Student Org Site" CssClass="label" Font-Size="Medium"></asp:Label>
                </td>                    
            </tr> 
            <tr style="height:600px">
                <td align="center">
                     <asp:Panel ID="pnlLogin" runat="server" BorderColor="#1E2667"
                             HorizontalAlign="Center" Width="312px"
                             Wrap="True" ForeColor="White" BackColor="#1e2667"> 
                        <table style="width:100%">
                            <tr style="background-color: #E05206; width:100%">
                                <td colspan="2" align="center">
                                    <asp:Label ID="lblLogin" Text="Login" runat="server" ForeColor="White" Font-Size="Large"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label Text="Username" runat="server" ForeColor="White"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                </td>                
                            </tr>
                            <tr>
                                <td>
                                        <asp:RequiredFieldValidator ID="rfvUserName" ForeColor="Red" runat="server" 
                                            ErrorMessage="Please Enter a user name" ControlToValidate="txtUserName" 
                                            Font-Size="Small"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" Text="Password" runat="server" ForeColor="White"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
               
                            </tr>
                            <tr>
                                 <td>
                                        <asp:RequiredFieldValidator ID="rfvpassword" ForeColor="Red" runat="server" 
                                            ErrorMessage="Please Enter a password" ControlToValidate="txtPassword" 
                                            Font-Size="Small"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>  
                                <td>
                                   <asp:Button id="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" Width="100%"/>
                                </td>
                             </tr>
                            <tr>
                                <td colspan="2">
                                  <asp:Label id="ErrorLabel" runat="Server" ForeColor="Red" Visible="False" Font-Size="Small" />
                                </td>
                            </tr>
                        </table>
                     </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>