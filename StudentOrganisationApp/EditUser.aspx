<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Site.Master" CodeBehind="EditUser.aspx.cs" Inherits="StudentOrganisationApp.EditUser" %>  
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<table width="100%">
    <tr>
        <td>
            <asp:Panel ID="pnlSelectUser" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td style="width:10%">
                            <asp:Label ID="lblUserID0" runat="server" Text="Users"></asp:Label>
                        </td>
                        <td style="width:30%">
                            <asp:DropDownList ID="ddlSelectUser" runat="server" AppendDataBoundItems="true" width="200pt">
                                <asp:ListItem Text="Select User" Value="-1" />
                            </asp:DropDownList>
                        </td>
                        <td style="width:5%">
                            <asp:Button ID="btnGo" runat="server" onclick="btnGo_Click" Text="Select" />
                        </td>
                        <td style="width:55%">
                            <asp:LinkButton ID="lnkdisabledusers" style="font-size:small;" runat="server" OnClick="lnkdisabledusers_Click">Include Disabled Users</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Label ID="lblNameUser" runat="server" Font-Bold="True"></asp:Label>
            <asp:Panel ID="pnlUserDetails" runat="server" GroupingText="User Details" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" Width="100%" Wrap="True" Visible="false">
                <table style="background: #CCCCCC; width:100%; height:100%">
                    <tr>
                        <td>
                            <asp:Label ID="FNameLabel" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server" ForeColor="Black" MaxLength="20"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter First Name" EnableClientScript="true" SetFocusOnError="true" Text="*"   
                                ForeColor="Red"    ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="LNameLabel" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" ForeColor="Black" MaxLength="20"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter First Name" EnableClientScript="true" SetFocusOnError="true" Text="*"  
                            ForeColor="Red"     ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="PhoneLabel" runat="server" Text="Phone #"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Phone" runat="server" ForeColor="Black" MaxLength="15"></asp:TextBox>
                        </td>
                        <td></td>
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
                            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" ForeColor="Black" MaxLength="20"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Please Enter Password" EnableClientScript="false" SetFocusOnError="true" Text="*"
                            ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        </td>
                        <td> 
                            <asp:Label ID="lblActive" runat="server" Text="Disable User?"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkIsInActive" runat="server" Checked="true"/>
                        </td>  
                        <td></td>
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
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="pnlUserOrgs" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" Visible="false" Width="100%" GroupingText="Limit Access for this User to the Following Organizations" Wrap="True">
                <table style="width: 100%;">
                    <tr>
                        <td style="width:15%">
                            <asp:Label ID="OrgLabel" runat="server" Text="Organizations"></asp:Label>
                        </td>
                        <td style="width:30%">
                            <asp:DropDownList ID="ddlSelectOrg" runat="server" AppendDataBoundItems="true" width="200pt">
                                <asp:ListItem Text="Select Organization" Value="-1" />
                            </asp:DropDownList>
                        </td>
                        <td style="width:55%">
                            <asp:Button ID="btnOrg" runat="server" onclick="btnOrg_Click" Text="Select" />
                        </td>
                    </tr>
                </table>
                <br/>
                <asp:GridView ID="LimitedOrgList" runat="server" onrowdatabound="LimitedOrgList_RowDataBound" onrowdeleting="LimitedOrgList_RowDeleting">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <br/>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td colspan="6" style="height: 22px">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="false" DisplayMode="BulletList" ShowSummary="true" />
        </td>
    </tr>
    <tr> 
        <td>
            <asp:Panel ID="pnlControlPanel" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" Width="100%" GroupingText="" Wrap="True" Visible ="false">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" onclick="btnCancel_Click" CausesValidation="False" />            
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" Text="Save" />
            </asp:Panel>
        </td>
    </tr>
</table>
</asp:Content>