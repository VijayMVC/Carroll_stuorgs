<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master" CodeBehind="EditEvents.aspx.cs" Inherits="StudentOrganisationApp.Events.EditEvents" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="pnlSelection" runat="server" Visible = "true" Width="100%" DefaultButton="btnGoMain">
        <table style="width:100%;">
            <tr>
                <td width="100%">
                    <table width="100%">
                        <tr>
                            <td width="30%">
                                  <asp:Label ID="lblSelectOrganization" runat="server">Select Organization </asp:Label>
                            </td>
                            <td width="30%">
                                  <asp:ComboBox ID="ddlSelectOrganization" runat="server" 
                                      AppendDataBoundItems="True" AutoCompleteMode="Suggest" ForeColor="Black" 
                                      MaxLength="0" Width="200px">
                                     <asp:ListItem Selected="True" Text="All organizations" Value="0" />
                                  </asp:ComboBox>
                            </td>
                            <td width="40%">
                                  <asp:Button ID="btnGoMain" runat="server" onclick="btnGoOrg_Click" 
                                      Text="Select" width="50pt" />
                            </td>
                        </tr>
                    </table>

                    <asp:GridView ID="gridediteventresults" runat="server" 
                          AutoGenerateColumns="False" Font-Bold="False" 
                          onselectedindexchanged="gridediteventresults_SelectedIndexChanged" 
                          Width="100%">
                          <Columns>
                              <asp:BoundField DataField="Event_ID" HeaderText="ID" />
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
        <table style="width:100%;">
            <tr>
                <td width="100%">
                        <asp:Label ID="lblNameOrganization" runat="server" Font-Bold="True"></asp:Label>
                        <asp:Label ID="lblEventId" runat="server" Visible="False"></asp:Label>
                      &nbsp;
                </td>
            </tr>
            <tr>
                <td width="100%">
                    <asp:TabContainer ID="tabContainerEditEvent" runat="server" ActiveTabIndex="0" Font-Bold="true" style="margin-bottom: 0px" Width="100%">
                    <asp:TabPanel ID="tabPaneEditEvent" runat="server" Font-Bold="false" HeaderText="Event">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td align="left">
                                    <asp:Panel ID="pnlEvent" runat="server" BorderColor="#CCCCCC" Font-Bold="False" GroupingText="Event" Height="100%" HorizontalAlign="Left" Width="100%">
                                        <table style="background: #CCCCCC; width: 100%; height: 100%" width="100%">
                                            <tr>
                                                <td width="20%">
                                                    <asp:Label ID="lblEditEventTitle" runat="server">Title </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <asp:TextBox ID="txtEditEventTitle" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td width="20%">
                                                    <asp:Label ID="lblEditEventOrgEncharge" runat="server">For Organization</asp:Label>
                                                </td>
                                                <td colspan="2" width="30%">
                                                    <asp:DropDownList ID="ddlEditEventOrgEncharge" runat="server" 
                                                        AppendDataBoundItems="True" ForeColor="Black" Width="100%">
                                                        <asp:ListItem Text="Select Organization" Value="-1" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" width="20%">
                                                    <asp:Label ID="lblEditEventDescription" runat="server">Description </asp:Label>
                                                </td>
                                                <td colspan="4" width="30%">
                                                    <asp:TextBox ID="txtEditEventDescription" runat="server" 
                                                        CssClass="largetextBox" ForeColor="Black" Height="100pt" TextMode="MultiLine" 
                                                        Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="20%">
                                                    <asp:Label ID="lblEditEventLocation" runat="server">Location </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <asp:TextBox ID="txtEditEventLocation" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td align="right" width="20%">
                                                    <asp:CheckBox ID="chkEventLocationOffCampus" runat="server" />
                                                </td>
                                                <td width="30%">
                                                    <asp:Label ID="lblEditEventOffCampus" runat="server">Off Campus </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="20%">
                                                    <asp:Label ID="lblEditEventDate" runat="server">Date </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <div ID="divcalEditEventDate" style="display:none;">
                                                        <asp:CalendarExtender ID="calEditEventDate" runat="server" Enabled="True" 
                                                            Format="MM/dd/yyyy" PopupButtonID="imgEditEventDate" 
                                                            TargetControlID="txtEditEventDate" />
                                                    </div>
                                                    <asp:TextBox ID="txtEditEventDate" Runat="server" contentEditable="false" 
                                                        ForeColor="Black" width="100pt" />
                                                    <asp:ImageButton ID="imgEditEventDate" runat="server" CausesValidation="False" 
                                                        Height="16px" ImageUrl="~/Images/calender.bmp" Width="16px" />
                                                </td>
                                                <td width="20%">
                                                    <asp:Label ID="lblEditEventTime" runat="server">Time </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <asp:TextBox ID="txtEditEventTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td width="30%">
                                                    <asp:RegularExpressionValidator ID="revtime" runat="server" 
                                                        ControlToValidate="txtEditEventTime" 
                                                        ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" 
                                                        ForeColor="Red" 
                                                        ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="20%">
                                                    <asp:Label ID="lblAttendence" runat="server">Attendence </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <asp:TextBox ID="txtEditEventAttendence" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td width="20%">
                                                    <asp:Label ID="lblCreatedBy" runat="server">Event Added By </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <asp:Label ID="txtCreatedByUser" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Panel ID="pnlPartner" runat="server" BorderColor="#CCCCCC" Font-Bold="False" GroupingText="Partner" Height="100%" HorizontalAlign="Left" Width="100%">
                                        <table style="background: #CCCCCC; width: 100%; height: 100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEditEventOrgWorkedWith" runat="server">Community Partner</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEditEventOrgWorkedWith" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEditEventContactPerson" runat="server">Contact Name</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEditEventContactPerson" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEditEventEmailID" runat="server">Contact Email</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEditEventEmailID" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RegularExpressionValidator ID="revemail" runat="server" 
                                                        ControlToValidate="txtEditEventEmailID" 
                                                        ErrorMessage="Please enter a valid e-mail" ForeColor="Red" 
                                                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEditEventPhone" runat="server">Contact Phone</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEditEventPhone" runat="server" ForeColor="Black"></asp:TextBox>
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
                                                <asp:Button ID="btnEditEventCancel" runat="server" CausesValidation="False" onclick="btnCancel_Click" Text="Cancel" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnEditEventContinue" runat="server" onclick="btnContinue_Click" Text="Continue" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:TabPanel>

                <asp:TabPanel ID="tabPaneEditEventMoreInfo" runat="server" Font-Bold="false" HeaderText="More Info">
                    <HeaderTemplate>
                        More Info
                    </HeaderTemplate>
                    <ContentTemplate>

                    <table width="100%">
                        <tr>
                            <td align="left" width="100%">
                                <asp:Panel ID="pnlTransport" runat="server" BorderColor="#CCCCCC" 
                                    Font-Bold="False" GroupingText="Transportation" Height="100%" HorizontalAlign="Left" 
                                    Width="100%">
                                    <table style="background: #CCCCCC; width: 100%; height: 100%" width="100%">
                                        <tr>
                                            <td align="left" style="width: 134px" valign="top">
                                                <asp:Label ID="lblEditEventTransportation" runat="server">Vehicles </asp:Label>
                                            </td>
                                            <td colspan="2">
                                                <table>
                                                    <tr>
                                                        <td valign="top">
                                                            <asp:Label ID="lblEditEventBus" runat="server"># of Buses</asp:Label>
                                                        </td>
                                                        <td align="center" style="height: 28px" valign="middle">
                                                            <asp:TextBox ID="txtEditEventBus" runat="server" ForeColor="Black"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top">
                                                            <asp:Label ID="lblEditEventVan" runat="server"># of Vans</asp:Label>
                                                        </td>
                                                        <td align="center" valign="middle">
                                                            <asp:TextBox ID="txtEditEventVan" runat="server" ForeColor="Black"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top">
                                                <asp:Label ID="lblEditEventDrivers" runat="server">Drivers</asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlSelectDrivers" runat="server" 
                                                    AppendDataBoundItems="True" ForeColor="Black" width="200pt">
                                                    <asp:ListItem Text="Select Driver" Value="-1" />
                                                </asp:DropDownList>
                                            </td>
                                            <td align="center" valign="middle">
                                                <asp:Button ID="btnEditEventAddDriver" runat="server" 
                                                    onclick="btnEditEventAddDriver_Click" Text="Add To List" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="top">
                                                &nbsp;</td>
                                            <td>
                                                <asp:GridView ID="grdEditEventDrivers" runat="server" Font-Bold="False" 
                                                    onrowdatabound="grdEditEventDrivers_RowDataBound" 
                                                    onrowdeleting="grdEditEventDrivers_RowDeleting" Width="100%">
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Button" HeaderText="Delete" 
                                                            ShowDeleteButton="True" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td align="center" valign="middle">
                                                <asp:Label ID="Label1" runat="server" Text="There is a max of 2 drivers."></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Panel ID="pnlCost" runat="server" BorderColor="#CCCCCC" Font-Bold="False" 
                                    GroupingText="Cost" Height="100%" HorizontalAlign="Left" Width="100%">
                                    <table style="background: #CCCCCC; width: 100%; height: 100%">
                                        <tr>
                                            <td align="left" valign="top" width="20%">
                                                <asp:Label ID="lblEditEventDollarSpend" runat="server">Spent By Org</asp:Label>
                                            </td>
                                            <td align="left" valign="middle" width="30%">
                                                <asp:TextBox ID="txtEditEventDollarSpend" runat="server" ForeColor="Black"></asp:TextBox>
                                            </td>
                                            <td align="left" valign="top" width="20%">
                                                <asp:Label ID="Label2" runat="server">Spent By Partner</asp:Label>
                                            </td>
                                            <td align="left" valign="middle" width="30%">
                                                <asp:TextBox ID="txtDollarSpentByPartner" runat="server" ForeColor="Black"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Panel ID="Checklist" runat="server" BorderColor="#CCCCCC" Font-Bold="False" GroupingText="Checklist" Height="100%" HorizontalAlign="Left" Width="100%">
                                    <table style="background: #CCCCCC; width: 100%; height: 100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LblRoomReserve" runat="server">Reserved room(s)/space(s) for event?</asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBroomreserved" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LblMarketing" runat="server">Emailed marketing materials to Duplication?</asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBmarketing" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LblCatering" runat="server">Will Chartwells be catering?</asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBcatering" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LblSignupForm" runat="server">Does event require an event sign-up form?</asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBsignupform" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LblActivityWaiver" runat="server">Does event require an activity waiver?</asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBactivitywaiver" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LBLCUNight" runat="server">Is this a CU@Night event?</asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="CBcunight" runat="server" />
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
                                        <td style="100%: ;">
                                            <asp:Button ID="btnEditEventMoreInfoBack" runat="server" onclick="btnBack_Click" Text="Back" />
                                            <asp:Button ID="btnEditEventMoreInfoCancel" runat="server" CausesValidation="False" OnClick="btnEditEventMoreInfoCancel_Click1" Text="Cancel" />
                                            <asp:Button ID="btnEditEventMoreInfoContinue" runat="server" OnClick="btnContinue_Click" Text="Continue" />
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
                                <asp:Label ID="lblEnterComments" runat="server">Comments</asp:Label>
                            </td>
                            <td width="80%">
                                <asp:TextBox ID="txtComments" Runat="server" CssClass="largeTextbox" Height="100pt" TextMode="MultiLine" Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td align="center" style="width:456px" width="100%">
                                            <asp:Button ID="btnBackComments" runat="server" OnClick="btnBack_Click" Text="Back" />
                                            <asp:Button ID="btnCancelComments" runat="server" CausesValidation="False" OnClick="btnCancelComments_Click" Text="Cancel" />
                                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Add Comment" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="grdComments" runat="server" AllowSorting="True" 
                                    EnableSortingAndPagingCallbacks="True" Font-Bold="False" Width="100%">
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
            <asp:Button ID="btnCancelAll" runat="server" Text="Cancel" onclick="btnCancelAll_Click" CausesValidation="False" />
            <asp:Button ID="btnSubmitAll" runat="server" Text="Save" onclick="btnSubmitAll_Click" />
            <asp:Button ID="bntDeleteAll" runat="server" Text="Delete Event" onclick="bntDeleteAll_Click" />
                <asp:ConfirmButtonExtender runat="server" ConfirmText="Are you sure you want to delete this event?" TargetControlID="bntDeleteAll"></asp:ConfirmButtonExtender>
        </td>
    </tr>
    <tr>
        <td  style="width:426px">
            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
            <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" ForeColor="Red" ShowMessageBox="false" ShowSummary="true" Width="600pt" />
        </td>
    </tr>
</table>
</asp:Panel>

</asp:Content>