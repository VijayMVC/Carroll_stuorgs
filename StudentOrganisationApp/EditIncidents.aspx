<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master" CodeBehind="EditIncidents.aspx.cs" Inherits="StudentOrganisationApp.Organization.EditIncidents" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="pnlSelection" runat=server DefaultButton="btnGoDate">
<table width="100%">
<tr>
    <td width="30%">
                    <asp:Label ID="lblSelectOrganization" runat="server">Select Organization </asp:Label>
                  </td>                        
    <td width="30%">
                    <asp:ComboBox ID="ddlSelectOrganization" runat="server" 
                        AppendDataBoundItems="True" AutoCompleteMode="Suggest" ForeColor="Black" 
                        MaxLength="0" Width="200px">
                        <asp:ListItem Selected="True" Text="All organizations" Value="0"/>
                    </asp:ComboBox>
                  </td>
    <td width="40%">
        <asp:Button ID="btnGoDate" runat="server" 
            onclick="btnGoDate_Click" Text="Select" width="50pt" />
    </td>
</tr>
</table>
        <table width="100%">
            <tr>
                <td>
                    <asp:GridView ID="gridIncidents" runat="server" AutoGenerateColumns="False" 
                        Font-Bold="False" 
                        onselectedindexchanged="gridIncidents_SelectedIndexChanged" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Incident_ID" HeaderText="ID" />
                            <asp:BoundField DataField="OrganizationName" HeaderText="Organization" />
                            <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:CommandField ButtonType="Button" HeaderText="Select" SelectText="Select" 
                                ShowHeader="True" ShowSelectButton="true" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
</asp:Panel>
<asp:Panel ID="pnlEditing" runat="server" Visible = "false">
<table width="100%">
<tr>
<td>
    <asp:Label ID="lblNameOrganization" runat="server" Font-Bold="True"></asp:Label>
    <asp:Label ID="lblIncidentId" runat="server" Visible="False"></asp:Label>
</td>
</tr>
<tr>
<td>
    <asp:TabContainer ID="tabContainerEditIncident" runat="server" 
         ActiveTabIndex="0" Font-Bold="true"
        style="margin-bottom: 0px"  Width="100%">
        <asp:TabPanel ID="tabPanelEditIncident" runat="server" HeaderText="Incident" 
              Font-Bold="false">
            <HeaderTemplate>
                Incident
            </HeaderTemplate>
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td align="left">
                            <asp:Panel ID="pnlIncident" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Incident" Width="100%" Font-Bold="False">
                                <table style="background: #CCCCCC; width:100%; height:100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEditIncidentDate" runat="server">Date </asp:Label>
                                        </td>
                                        <td>
                                            <div id="divcalEditIncidentDate" style="display:none;">
                                                <asp:CalendarExtender ID="calEditIncidentDate" runat="server" 
                               TargetControlID="txtEditIncidentDate" PopupButtonID="imgEditIncidentDate" 
                               Format="MM/dd/yyyy" Enabled="True" />
                                            </div>
                                            <asp:TextBox ID="txtEditIncidentDate" Runat="server" width="100pt" 
                            contentEditable="false" ForeColor="Black" />
                                            <asp:ImageButton ID="imgEditIncidentDate" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEditIncidentTime" runat="server">Time </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditIncidentTime" runat="server" ForeColor="Black"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="revtime" runat="server" 
                                                ControlToValidate="txtEditIncidentTime" 
                                                ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                                ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  style="width: 20%" >
                                            <asp:Label ID="lblEditIncidentDateReported" runat="server">Date Reported </asp:Label>
                                        </td>
                                        <td>
                                            <div id="divcalEditIncidentDateReported" style="display:none;">
                                                <asp:CalendarExtender ID="calEditIncidentDateReported" runat="server" 
                               TargetControlID="txtEditIncidentDateReported" 
                               PopupButtonID="imgEditIncidentDateReported" Format="MM/dd/yyyy" 
                               Enabled="True" />
                                            </div>
                                            <asp:TextBox ID="txtEditIncidentDateReported" Runat="server" width="100pt" 
                            contentEditable="false" ForeColor="Black" />
                                            <asp:ImageButton ID="imgEditIncidentDateReported" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEditIncidentReportedBy" runat="server">Reported By </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditIncidentReportedBy" runat="server" ForeColor="Black"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEditIncidentLocation" runat="server">Location </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditIncidentLocation" runat="server" ForeColor="Black"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Panel ID="pnlPeopleInvolved" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="PeopleInvolved" Width="100%" Font-Bold="False">
                                <table style="background: #CCCCCC; width:100%; height:100%">
                                    <tr>
                                        <td style="text-decoration: underline">
                                            <asp:Label ID="lblMembers" runat="server">Members </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan ="2">
                                            <asp:DropDownList ID="ddlOrganization" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged" 
                            Width="200px" ForeColor="Black">
                                                <asp:ListItem Text="Select Organization" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan ="2">
                                            <asp:DropDownList  AppendDataBoundItems="True" ID="ddlSearchMember" 
                                        runat="server" width = '200px' ForeColor="Black">
                                                <asp:ListItem Text="Select For Member" Value="-1" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAddMember" runat="server" Text="Add Member" 
                                        onclick="btnAddMember_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:GridView ID="grdPplInvolved" runat="server" AutoGenerateColumns="False" 
                            OnRowDataBound="grdPplInvolved_RowDataBound" 
                            OnRowDeleting="grdPplInvolved_RowDeleting" Width="100%" Font-Bold="False">
                                                <Columns>
                                                    <asp:BoundField DataField="LastName" HeaderText="LastName" />
                                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                                    <asp:BoundField DataField="Position" HeaderText="Position" />
                                                    <asp:CommandField ButtonType="Button" HeaderText="Delete" 
                                    ShowDeleteButton="True" ShowHeader="True" />
                                                    <asp:BoundField DataField="Student_ID" HeaderText="Student_ID" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan ="2">
                                            <asp:Label ID="lblNonMembers" runat="server" style="text-decoration: underline">Non Members </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:10px">
                                            <asp:Label ID="lblNonMemberName" runat="server">Name </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNonMemberName" runat="server" ForeColor="Black"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNonMemberID" runat="server">ID </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNonMemberID" runat="server" ForeColor="Black"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAddNonMember" runat="server" Text="Add Non Member" 
                                        onclick="btnAddNonMember_Click" 
                                        />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:GridView ID="grdNonMembersInvolved" runat="server" 
                            onrowdeleting="grdNonMembersInvolved_RowDeleting" 
                           AutoGenerateColumns="False" Width="100%" Font-Bold="False">
                                                <Columns>
                                                    <asp:BoundField DataField="Name" Headertext="Name"/>
                                                    <asp:BoundField DataField="ID" Headertext="ID"/>
                                                    <asp:CommandField ButtonType="Button" HeaderText="Remove" 
                                   DeleteText="Remove" ShowDeleteButton="True" ShowHeader="True" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Panel ID="pnlDetils" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Details" Width="100%" Font-Bold="False">
                                <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
                                    <tr>
                                        <td width="20%" valign="top">
                                            <asp:Label ID="lblIncident" runat="server">Incident </asp:Label>
                                        </td>
                                        <td width="80%">
                                            <asp:TextBox ID="txtincident" runat="server"  ForeColor="Black" 
                            TextMode="MultiLine" CssClass="largeTextbox" Height="100px" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" valign="top">
                                            <asp:Label ID="lblFollowUp" runat="server" >Follow Up </asp:Label>
                                        </td>
                                        <td width="80%">
                                            <asp:TextBox ID="txtFollowUp" runat="server"  ForeColor="Black" 
                            TextMode="MultiLine" CssClass="largeTextbox" Height="100px" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" valign="top">
                                            <asp:Label ID="lblResult" runat="server">Result </asp:Label>
                                        </td>
                                        <td width="80%">
                                            <asp:TextBox ID="txtResult" runat="server"  ForeColor="Black" 
                            TextMode="MultiLine" CssClass="largeTextbox" Height="100px" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" CausesValidation="False" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnContinueEditIncident" runat="server" Text="Continue" 
                            onclick="btnContinue_Click"/>
                                    </td>
                            </table>
                        </td>
                    </tr>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanelComments" runat="server" HeaderText="Comments" 
              Font-Bold="false">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td  valign = "top" width="20%">
                            <asp:Label ID="lblEnterComments" runat="server">Comments </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" 
                                CssClass="largeTextbox" ForeColor="Black" Height="100pt" Width="90%"
                               ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" width="100%">
                            <table>
                                <tr>
                                    <td align="center" width="100%">
                                        <asp:Button ID="btnBackComments" runat="server" OnClick="btnBack_Click" 
                                            Text="Back" />
                                        <asp:Button ID="btnCancelComments0" runat="server" 
                                            OnClick="btnCancelComments_Click" Text="Cancel" CausesValidation="False" />
                                        <asp:Button ID="btnSubmit0" runat="server" OnClick="btnSubmit_Click" 
                                            Text="Add Comment" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="grdComments" runat="server" AllowSorting="True" 
                                EnableSortingAndPagingCallbacks="True" OnSorting="grdComments_Sorting" 
                                Width="100%" Font-Bold="False">
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
 
    </td>
</tr>
<tr>
<td align="left" width="100%">
    <asp:Button ID="btnCanelAll" runat="server" Text="Cancel"
        onclick="btnCanelAll_Click" CausesValidation="False" />
    <asp:Button ID="btnSubmitAll" runat="server" Text="Save"
        onclick="btnSubmitAll_Click" />
</td>

</tr>
<tr>
<td  style="width:300px">
  <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
      <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" 
        ForeColor="Red" ShowMessageBox="false" ShowSummary="true" Width="600pt" />
      </td>
     </tr>
</table>
</asp:Panel>

</asp:Content>