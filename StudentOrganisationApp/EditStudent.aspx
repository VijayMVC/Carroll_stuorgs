<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master"  CodeBehind="EditStudent.aspx.cs" Inherits="StudentOrganisationApp.Student.EditStudent" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="pnlSearchStudent" runat="server">
        <asp:Panel ID="pnlLastNameSearch" runat=server DefaultButton=btnGoLastName Width="100%">
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="lblLastNameSelect" runat="server">Enter Last Name </asp:Label>
                    </td>
                    <td style="width: 160px">
                        <asp:TextBox ID="txtLastNameSelect" runat="server" ForeColor="#999999"></asp:TextBox>
                    </td>
                    <td style="width: 20%">
                        <asp:Button ID="btnGoLastName" runat="server" Height="24px" 
                            onclick="btnGoLastName_Click" Text="Search" width="50pt" />
                    </td>
                </tr>
             </table>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat=server DefaultButton=btnGoCarrollId>
            <table width="100%">
                <tr>
                    <td>
                        Enter Carroll ID</td>
                    <td style="width: 160px">
                        <asp:TextBox ID="txtCarrollIdSelect" runat="server" ForeColor="#999999"></asp:TextBox>
                    </td>
                    <td style="width: 20%">
                        <asp:Button ID="btnGoCarrollId" runat="server" Height="24px" 
                            onclick="btnGoCarrollId_Click" Text="Search" width="50pt" />
                    </td>
                </tr>
            </table>
         </asp:Panel>

        <table width="100%">
            <tr>
                <td>
                    <asp:Label ID="lblLastNameError" runat="server" ForeColor="Red" Visible="true"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdLastNameStudents" runat="server" 
                        AutoGenerateColumns="False" 
                        onselectedindexchanged="grdLastNameStudents_SelectedIndexChanged" 
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="LastName" Headertext="LastName" />
                            <asp:BoundField DataField="FirstName" Headertext="FirstName" />
                            <asp:BoundField DataField="Carroll_ID" Headertext="Carroll_ID" />
                            <asp:CommandField ButtonType="Button" HeaderText="Select" 
                                ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <table width="100%">
        <tr>
            <td colspan="3" > 
                <asp:Panel ID="pnlEditing" runat="server" Visible = "false" Width="100%">
                    <table Width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblNameStudent" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                                <asp:Label ID="lblStuID" runat="server" Visible="False"></asp:Label>
                                <asp:Panel ID="pnlDemographic" runat="server" BorderColor="#CCCCCC" GroupingText="Demographic" Height="100%" HorizontalAlign="Left" Width="100%" Wrap="True">
                                    <table style="background: #CCCCCC; width: 100%; height: 100%" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCarrollID" runat="server">ID</asp:Label>
                                            </td>
                                            <td style="width: 250px">
                                                <asp:TextBox ID="txtCarrollID" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblGradClass" runat="server">Class Of </asp:Label>
                                            </td>
                                            <td >
                                                <asp:TextBox ID="txtGradClass" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblStudentFirstName" runat="server">First Name </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtStudentFirstName" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblStudentLastName" runat="server">Last Name </asp:Label>
                                            </td>
                                            <td style="width: 250px">
                                                <asp:TextBox ID="txtStudentLastName" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblStudentEmail" runat="server">Email </asp:Label>
                                            </td>
                                            <td style="width: 250px">
                                                <asp:TextBox ID="txtStudentEmail" runat="server" BackColor="#CCCCCC" ForeColor="Black" ReadOnly="True" Width="230px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPrefPhoneNo" runat="server">Phone </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrefPhoneNo" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblMajor" runat="server">Major </asp:Label>
                                            </td>
                                            <td style="width: 250px">
                                                <asp:TextBox ID="txtMajor" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblMajor2" runat="server">Major2</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMajor2" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblGender" runat="server">Gender </asp:Label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblGender" runat="server" BackColor="#CCCCCC" contenteditable="false" Enabled="False" RepeatDirection="Horizontal" Width="147px">
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblOnCampus" runat="server">Lives on Campus </asp:Label>
                                            </td>
                                            <td style="width: 250px">
                                                <asp:CheckBox ID="cbOnCampus" runat="server" Enabled="False"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblRace" runat="server">Race/Ethnicity</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtRace" runat="server" BackColor="#CCCCCC" ForeColor="Black" Enabled="False" Width="230px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblIntl" runat="server">International Student </asp:Label>
                                            </td>
                                            <td style="width: 250px">
                                                <asp:CheckBox ID="cbIntl" runat="server" Enabled="False"></asp:CheckBox>
                                            </td>
							            </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" width="100%">
                                <asp:Panel ID="pnlEligibility" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Eligibility" Width="100%" Wrap="True">
                                    <table style="background: #CCCCCC;" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblGrades" runat="server" ReadOnly="True" >GPA Requirements </asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBoxList ID="chklGrades" runat="server" RepeatDirection="Horizontal" 
                                                    BackColor="#CCCCCC" ReadOnly="True" Enabled="False">
                                                    <asp:ListItem>Executive</asp:ListItem>  
                                                    <asp:ListItem>Standard</asp:ListItem> 
                                                </asp:CheckBoxList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblGreekGPA" runat="server" Visible ="false">Greek GPA </asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkGreekGPA" runat="server" Visible="false"/>                      
                                            </td>
                                        </tr>               
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblStudentStatus" runat="server">Status </asp:Label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rblStatus" runat="server" 
                                                    RepeatDirection="Horizontal" BackColor="#CCCCCC" ReadOnly="True" 
                                                    Enabled="False">
                                                    <asp:ListItem>Active</asp:ListItem>  
                                                    <asp:ListItem>Inactive</asp:ListItem> 
                                                </asp:RadioButtonList>
                                            </td>                
                                            <td>
                                                <asp:Label ID="lblDrivingPermission" runat="server">Driving Permission </asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBoxList ID="chklDrvingPermission" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem>Certified</asp:ListItem>  
                                                    <asp:ListItem>Approved</asp:ListItem> 
                                                </asp:CheckBoxList>
                        
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" width="100%">
                                <asp:Panel ID="pnlOrgMember" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Organization Member" Width="100%" Wrap="True" Visible ="false">
                                    <asp:GridView ID="gridview_OrgMember" runat="server" style="background: #CCCCCC; width:100%; height:100%" onrowdatabound="gridview_OrgMember_RowDataBound" BorderStyle="Solid"></asp:GridView>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td width="100%">
                                <table width="100%">
                                    <tr>
                                        <td width="100%" >
                                            <asp:Button ID="btnCanel" runat="server" Text="Cancel" onclick="btnCanel_Click" CausesValidation="False"/>
                                            <asp:Button ID="btnEditStudent" runat="server" onclick="btnEditStudent_Click" Text="Save" />
                                        </td>                        
                                    </tr> 
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td  style="width:300px" width="100%">
                <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>