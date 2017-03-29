<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditServiceProject.aspx.cs" MasterPageFile="~/Shared/Site.Master"  Inherits="StudentOrganisationApp.EditServiceProject" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<asp:Panel runat="server" Width="100%" ID="pnlSelection" DefaultButton="btnGoOrg">
   <table width="100%">
             <tr>
                  <td>
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
                                  <asp:Button ID="btnGoOrg" runat="server" onclick="btnGoOrg_Click" Text="Select" 
                                      width="50pt" />
                              </td>
                          </tr>
                      </table>
                      <asp:GridView ID="gridServiceProject" runat="server" 
                          AutoGenerateColumns="False" Font-Bold="False" 
                          onselectedindexchanged="gridServiceProject_SelectedIndexChanged" 
                          Width="100%">
                          <Columns>
                              <asp:BoundField DataField="ServiceProject_ID" HeaderText="ID" />
                              <asp:BoundField DataField="OrganizationName" HeaderText="Organization" />
                              <asp:BoundField DataField="StartDate" HeaderText="Start" 
                                  DataFormatString="{0:d}" />
                              <asp:BoundField DataField="EndDate" HeaderText="End" DataFormatString="{0:d}" />
                              <asp:BoundField DataField="Location" HeaderText="Location" />
                              <asp:CommandField ButtonType="Button" HeaderText="Select" SelectText="Select" 
                                  ShowHeader="True" ShowSelectButton="true" />
                          </Columns>
                      </asp:GridView>
                  </td>                        
         
             </tr>
             </table>
             </asp:Panel>
<asp:Panel ID="pnlEditing" runat="server" Visible = "false" Width="100%">
<table width="100%">
<tr>
<td>
    <asp:Label ID="lblNameOrganization" runat="server" Font-Bold="True"></asp:Label>
    <asp:Label ID="lblServiceProjectID" runat="server" Visible="False"></asp:Label>
   </td>
</tr>
    <tr>
        <td>
            <asp:TabContainer ID="tabContainerEditSP" runat="server" ActiveTabIndex="0" 
                Font-Bold="true" style="margin-bottom: 0px" width="100%">
                <asp:TabPanel ID="tabPaneNewEvent0" runat="server" Font-Bold="false" 
                    HeaderText="Service Project">
                    <HeaderTemplate>
                        Service Project
                    </HeaderTemplate>
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlServiceProject" runat="server" BorderColor="#CCCCCC" 
                                        Font-Bold="False" GroupingText="Service Project" Height="100%" 
                                        HorizontalAlign="Left" Width="100%">
                                        <table style="background: #CCCCCC; width: 100%; height: 100%" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectTitle" runat="server">Title </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectTitle" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectOrgEncharge" runat="server">For Organization</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlNewServiceProjectOrgEncharge" runat="server" 
                                                        AppendDataBoundItems="True" width="200pt">
                                                        <asp:ListItem Text="Select Organization" Value="-1" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectNoOfVolunteers" runat="server">No of Volunteers </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectNoOfVolunteers" runat="server" 
                                                        ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectVolunteersHours" runat="server">Volunteers Hours </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectVolunteersHours" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblServiceProjectDescription" runat="server">Community Impact </asp:Label>
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="txtServiceProjectDescription" runat="server" 
                                                        CssClass="largeTextbox" ForeColor="Black" Height="100pt" TextMode="MultiLine" 
                                                        Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectLocation" runat="server">Location </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectLocation" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td align="right">
                                                    <asp:Label ID="lblServiceProjectOnGoing" runat="server">OnGoing </asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:CheckBox ID="chkServiceProjectOnGoing" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="chkServiceProjectOnGoing_CheckedChanged" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Panel ID="pnlOneTime" runat="server">
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblServiceProjectDate" runat="server">Date </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <div ID="divcalServiceProjectDate" style="display:none;">
                                                                        <asp:CalendarExtender ID="calServiceProjectDate" runat="server" Enabled="True" 
                                                                            Format="MM/dd/yyyy" PopupButtonID="imgServiceProjectDate" 
                                                                            TargetControlID="txtServiceProjectDate" />
                                                                    </div>
                                                                    <asp:TextBox ID="txtServiceProjectDate" Runat="server" contenteditable="false" 
                                                                        Enabled="False" ForeColor="Black" width="100pt" />
                                                                    <asp:ImageButton ID="imgServiceProjectDate" runat="server" 
                                                                        CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                        Width="16px" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSPOneTimeFromTime" runat="server">Start Time </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtSPOneTimeFromTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:RegularExpressionValidator ID="revtime1" runat="server" 
                                                                        ControlToValidate="txtSPOneTimeFromTime" 
                                                                        ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" 
                                                                        ForeColor="Red" 
                                                                        ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSPOneTimeToTime" runat="server">End Time </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtSPOneTimeToTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:RegularExpressionValidator ID="revtime2" runat="server" 
                                                                        ControlToValidate="txtSPOneTimeToTime" 
                                                                        ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" 
                                                                        ForeColor="Red" 
                                                                        ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Panel ID="pnlOnGoing" runat="server" Visible="False">
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblServiceProjectStartDate" runat="server">Start Date </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <div ID="divcalServiceProjectStartDate" style="display:none;">
                                                                        <asp:CalendarExtender ID="calServiceProjectStartDate0" runat="server" 
                                                                            Enabled="True" Format="MM/dd/yyyy" PopupButtonID="imgServiceProjectStartDate" 
                                                                            TargetControlID="txtServiceProjectStartDate" />
                                                                    </div>
                                                                    <asp:TextBox ID="txtServiceProjectStartDate" Runat="server" 
                                                                        contenteditable="false" Enabled="False" ForeColor="Black" width="100pt" />
                                                                    <asp:ImageButton ID="imgServiceProjectStartDate" runat="server" 
                                                                        CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                        Width="16px" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="lblServiceProjectEndDate" runat="server">End Date </asp:Label>
                                                                </td>
                                                                <td style="width: 80%; height: 103px">
                                                                    <div ID="divcalServiceProjectEndDate" style="display:none;">
                                                                        <asp:CalendarExtender ID="calServiceProjectEndDate" runat="server" 
                                                                            Enabled="True" Format="MM/dd/yyyy" PopupButtonID="imgServiceProjectEndDate" 
                                                                            TargetControlID="txtServiceProjectEndDate" />
                                                                    </div>
                                                                    <asp:TextBox ID="txtServiceProjectEndDate" Runat="server" 
                                                                        contenteditable="false" Enabled="False" ForeColor="Black" width="100pt" />
                                                                    <asp:ImageButton ID="imgServiceProjectEndDate" runat="server" 
                                                                        CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                        Width="16px" />
                                                                </td>
                                                                <td style="width: 80%; height: 103px">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="lblSPOnGoingDay" runat="server">Day </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlSPOnGoingDay" runat="server" 
                                                                        AppendDataBoundItems="True" ForeColor="Black">
                                                                        <asp:ListItem Text="Select Meeting Day" Value="-1" />
                                                                        <asp:ListItem Text="Monday" Value="0" />
                                                                        <asp:ListItem Text="Tuesday" Value="1" />
                                                                        <asp:ListItem Text="Wednesday" Value="2" />
                                                                        <asp:ListItem Text="Thursday" Value="3" />
                                                                        <asp:ListItem Text="Friday" Value="4" />
                                                                        <asp:ListItem Text="Saturday" Value="5" />
                                                                        <asp:ListItem Text="Sunday" Value="6" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblSPOnGoingFromTime" runat="server">Start Time </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtSPOnGoingFromTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:RegularExpressionValidator ID="revtime" runat="server" 
                                                                        ControlToValidate="txtSPOnGoingFromTime" 
                                                                        ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" 
                                                                        ForeColor="Red" 
                                                                        ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSPOnGoingToTime" runat="server">End Time </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtSPOnGoingToTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:RegularExpressionValidator ID="revtime0" runat="server" 
                                                                        ControlToValidate="txtSPOnGoingToTime" 
                                                                        ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" 
                                                                        ForeColor="Red" 
                                                                        ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblMeetFrequency" runat="server">Meeting Frequency </asp:Label>
                                                                </td>
                                                                <td align="left" valign="middle">
                                                                    <asp:DropDownList ID="ddlMeetingFrequency" runat="server" 
                                                                        AppendDataBoundItems="True" ForeColor="Black" Height="19px" Width="305px">
                                                                        <asp:ListItem Text="Select Meeting Frequency" Value="-1" />
                                                                        <asp:ListItem Text="Weekly" Value="0" />
                                                                        <asp:ListItem Text="BiWeekly" Value="1" />
                                                                        <asp:ListItem Text="First Week of the month" Value="2" />
                                                                        <asp:ListItem Text="Second Week of the month" Value="3" />
                                                                        <asp:ListItem Text="Third Week of the month" Value="4" />
                                                                        <asp:ListItem Text="Fourth Week of the month" Value="5" />
                                                                        <asp:ListItem Text="Fifth Week of the month" Value="6" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlPartner" runat="server" BorderColor="#CCCCCC" Font-Bold="False" GroupingText="Community Partner" Height="100%" HorizontalAlign="Left" Width="100%">
                                        <table style="background: #CCCCCC; width: 100%; height: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectCP" runat="server">Community Partner </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectCP" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectCPName" runat="server">Contact Name </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectCPName" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectCPEmail" runat="server">Contact Email </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectCPEmail" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RegularExpressionValidator ID="revemail" runat="server" 
                                                        ControlToValidate="txtServiceProjectCPEmail" 
                                                        ErrorMessage="Please enter a valid e-mail" ForeColor="Red" 
                                                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblServiceProjectCPPhone" runat="server">Contact Phone </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceProjectCPPhone" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="PlannedResults" runat="server" BorderColor="#CCCCCC" Font-Bold="False" GroupingText="Planned Results" Height="100%" HorizontalAlign="Left" Width="100%">
                                        <table style="background: #CCCCCC; width: 100%; height: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server"># of Volunteers </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="planned_vols" runat="server" ForeColor="#999999"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server">Volunteer Hours</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="planned_hrs" runat="server" ForeColor="#999999"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server">Funds/Items Raised</asp:Label>
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="planned_items" runat="server" ForeColor="#999999" Width="200pt" MaxLength="250"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlResults" runat="server" BorderColor="#CCCCCC" Font-Bold="False" GroupingText="Final Results" Height="100%" HorizontalAlign="Left" Width="100%">
                                        <table style="background: #CCCCCC; width: 100%; height: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server"># of Volunteers </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3" runat="server" ForeColor="#999999"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server">Volunteer Hours </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox4" runat="server" ForeColor="#999999"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblFundsRaised" runat="server">Funds/Items Raised  </asp:Label>
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="txtFundsRaised" runat="server" ForeColor="#999999" Width="200pt" MaxLength="250"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnEditSPCancel" runat="server" CausesValidation="False" 
                                                    onclick="btnEditSPCancel_Click" Text="Cancel" />
                                                <asp:Button ID="btnEditSPContinue" runat="server" OnClick="btnSPContinue_Click" 
                                                    Text="Continue" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabPanelComments" runat="server" Font-Bold="false" 
                    HeaderText="Comments">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td valign="top" width="20%">
                                    <asp:Label ID="lblEnterComments" runat="server">Comments </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtComments" runat="server" CssClass="largeTextbox" 
                                        ForeColor="Black" Height="100pt" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%">
                                        <tr>
                                            <td align="left">
                                                <asp:Button ID="btnBackComments" runat="server" OnClick="btnBackComments_Click" 
                                                    Text="Back" />
                                                <asp:Button ID="btnCancelComments" runat="server" 
                                                    OnClick="btnCancelComments_Click" Text="Cancel" />
                                                <asp:Button ID="btnSubmit0" runat="server" OnClick="btnSubmit_Click" 
                                                    Text="Add Comment" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="grdComments" runat="server" Font-Bold="False" Width="100%">
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
        <td>
            <asp:Button ID="btnCancelAll" runat="server" CausesValidation="False" onclick="btnCancelAll_Click" Text="Cancel" />
            <asp:Button ID="btnSubmitAll" runat="server" onclick="btnSubmitAll_Click" Text="Save" />
            <asp:Button ID="bntDeleteAll" runat="server" Text="Delete Service Project" onclick="bntDeleteAll_Click" />
                <asp:ConfirmButtonExtender runat="server" ConfirmText="Are you sure you want to delete this service project?" TargetControlID="bntDeleteAll"></asp:ConfirmButtonExtender>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
            <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" 
                ForeColor="Red" ShowMessageBox="false" ShowSummary="true" Width="600pt" />
        </td>
    </tr>
</table>

</asp:Panel>
    </asp:Content>