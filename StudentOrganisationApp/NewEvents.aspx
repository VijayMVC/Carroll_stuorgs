<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master" CodeBehind="NewEvents.aspx.cs" Inherits="StudentOrganisationApp.Events.CreateEvents" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%; height:100%">
        <tr>
            <td>
                <asp:TabContainer ID="tabContainerNewEvent" runat="server" ActiveTabIndex="0" Font-Bold="true" style="margin-bottom: 0px" Width="100%">
                    <asp:TabPanel ID="tabPaneNewEvent" runat="server" HeaderText="Event" Font-Bold="false">
                        <HeaderTemplate>
                          Event
                        </HeaderTemplate>

                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Panel ID="pnlEvent" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Event" Width="100%" Font-Bold="False"  ForeColor="Black">
                                            <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
                                            <tr>
                                                <td width="20%">
                                                    <asp:Label ID="lblNewEventOrgEncharge" runat="server">For Organization</asp:Label>
                                                </td>
                                                <td colspan="2" width="30%">
                                                    <asp:DropDownList  AppendDataBoundItems="True" ID="ddlNewEventOrgEncharge" 
                                                         runat="server" ForeColor="Black" Width="100%" >
                                                        <asp:ListItem Text="Select Organization" Value="-1" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="20%">
                                                    <asp:Label ID="lblNewEventTitle" runat="server">Title </asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <asp:TextBox ID="txtNewEventTitle" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>                        
                                                <td width="30%">
                                                    &nbsp;
                                                </td>
                                            </tr> 
                                            <tr>
                                                <td width="20%" style="height: 71px" >
                                                    <asp:Label ID="lblNewEventDescription" runat="server">Description </asp:Label>
                                                </td>
                                                <td colspan = "4" width="30%" style="height: 71px">
                                                    <asp:TextBox ID="txtNewEventDescription" runat="server"  ForeColor="Black" 
                                                        TextMode="MultiLine" CssClass="largeTextbox" Height="100px" Width="90%"></asp:TextBox>
                                                </td>
                                                      <td style="height: 71px" width="30%">
                                                          &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="20%">
                                                    <asp:Label ID="lblNewEventLocation" runat="server">Location</asp:Label>
                                                </td>
                                                <td width="30%" >
                                                    <asp:TextBox ID="txtNewEventLocation" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                 <td align="right" width="20%" >
                                                    <asp:CheckBox ID="chkEventLocationOffCampus" runat="server" />
                                                </td>
                                                <td width="30%">
                                                    <asp:Label ID="lblNewEventOffCampus" runat="server">Off Campus?</asp:Label>
                                                </td>
                                                <td width="30%">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="20%" style="height: 26px">
                                                    <asp:Label ID="lblNewEventDate" runat="server" >Date</asp:Label>

                                                </td>
                                                <td width="30%" style="height: 26px">
                                                    <div id="divcalNewEventDate" style="display:none;">
                                                        <asp:CalendarExtender ID="calNewEventDate" runat="server" 
                                                           TargetControlID="txtNewEventDate" PopupButtonID="imgNewEventDate" 
                                                           Format="MM/dd/yyyy" Enabled="True" >
                                                        </asp:CalendarExtender>
                                                    </div>
                                                    <asp:TextBox ID="txtNewEventDate" Runat="server" width="100pt" contenteditable="false" ForeColor="Black" />
                                                    <asp:ImageButton ID="imgNewEventDate" Width="16px" Height="16px" runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                                                </td>
                                                <td width="20%" style="height: 26px">
                                                    <asp:Label ID="lblNewEventTime" runat="server">Time</asp:Label>
                                                </td>
                                                <td width="30%" style="height: 26px">
                                                    <asp:TextBox ID="txtNewEventTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td style="height: 26px" width="30%">
                                                    <asp:RegularExpressionValidator ID="revtime" runat="server" 
                                                        ControlToValidate="txtNewEventTime" 
                                                        ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                                        ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                </td>
                                            </tr> 
                                            <tr>
                                                <td width="20%">
                                                    <asp:Label ID="lblAttendence" runat="server">Attendence</asp:Label>
                                                </td>
                                                <td width="30%">
                                                    <asp:TextBox ID="txtNewEventAttendence" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td width="20%">
                                                    <asp:Label ID="lblCreatedBy" runat="server">Event Added By</asp:Label>
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
                                        <asp:Panel ID="pnlPartner" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Partner" Width="100%" Font-Bold="False">
                                            <table style="background: #CCCCCC;  height:100%" width="100%">
                                                <tr >
                                                    <td width="20%">
                                                        <asp:Label ID="lblNewEventOrgWorkedWith" runat="server">Community Partner</asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtNewEventOrgWorkedWith" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    <td width="20%">
                                                        <asp:Label ID="lblNewEventContactPerson" runat="server">Contact Name </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtNewEventContactPerson" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="20%">
                                                        <asp:Label ID="lblNewEventEmailID" runat="server">Contact Email </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtNewEventEmailID" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="revemail" runat="server" 
                                                            ControlToValidate="txtNewEventEmailID" 
                                                            ErrorMessage="Please enter a valid e-mail" ForeColor="Red" 
                                                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:Label ID="lblNewEventPhone" runat="server">Contact Phone </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtNewEventPhone" runat="server" ForeColor="Black"></asp:TextBox>
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
                                                    <asp:Button ID="btnNewEventCancel" runat="server" Text="Cancel" onclick="btnNewEventCancel_Click" CausesValidation="False" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnNewEventContinue" runat="server" Text="Continue" onclick="btnContinue_Click" />
                                                </td>                    
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
  
                    <asp:TabPanel ID="tabPaneNewEventMoreInfo" runat="server" HeaderText="More Info" Font-Bold="false">
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Panel ID="pnlTransport" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Transport" Width="100%" Font-Bold="False">
                                        <table style="background: #CCCCCC; width:100%; height:100%">
                                            <tr>
                                                <td align="left" style="width: 134px" valign="top">
                                                  <asp:Label ID="lblNewEventTransportation" runat="server">Transportation </asp:Label>  
                                                </td>
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                            <td valign="top">
                                                                <asp:Label ID="lblNewEventBus" runat="server"># of Buses</asp:Label>  
                                                            </td>
                                                            <td align="center" style="height: 28px" valign="middle">
                                                                <asp:TextBox ID="txtNewEventBus" runat="server" ForeColor="Black"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                <asp:Label ID="lblNewEventVan" runat="server"># of Vans</asp:Label>  
                                                            </td>
                                                            <td align="center" valign="middle">
                                                                <asp:TextBox ID="txtNewEventVan" runat="server" ForeColor="Black"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <asp:Label ID="lblNewEventDrivers" runat="server">Drivers</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList  AppendDataBoundItems="True" ID="ddlSelectDrivers" 
                                                        runat="server" width = '200pt' ForeColor="Black">
                                                    <asp:ListItem Text="Select Driver" Value="-1" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="center" valign="middle">
                                                    <asp:Button ID="btnNewEventAddDriver" runat="server" Text="Add To List" onclick="btnNewEventAddDriver_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                </td>
                                                <td colspan="1">
                                                    <asp:GridView ID="grdNewEventDrivers" runat="server" 
                                                        onrowdeleting="grdNewEventDrivers_RowDeleting" 
                                                        onrowdatabound="grdNewEventDrivers_RowDataBound" Font-Bold="False" 
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                                                                HeaderText="Delete" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                                <td align="center" valign="middle">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        </asp:Panel>
                                    </td>
                                </tr> 
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlCost" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Cost" Width="100%" Font-Bold="False">
                                        <table style="background: #CCCCCC; width:100%; height:100%">
                                            <tr>
                                                <td  align="left" valign="top" width="20%">
                                                    <asp:Label ID="lblNewEventDollarSpend" runat="server">Spent By Org </asp:Label>
                                                </td>
                                                <td align="left" valign="middle" width="30%">
                                                    <asp:TextBox ID="txtNewEventDollarSpend" runat="server" ForeColor="Black"></asp:TextBox>
                                                </td>
                                                <td  align="left" valign="top" style="width:100px" width="20%">
                                                    <asp:Label ID="Label1" runat="server">Spent By Partner</asp:Label>
                                                </td>
                                                <td align="left" valign="middle" width="30%">
                                                    <asp:TextBox ID="txtNewEventDollarSpendByPartner" runat="server" 
                                                        ForeColor="Black"></asp:TextBox>
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
                                                <td width="100%" >
                                                    <asp:Button ID="btnNewEventMoreInfoBack" runat="server" Text="Back" onclick="btnBack_Click" />
                                                    <asp:Button ID="btnNewEventMoreInfoCancel" runat="server" 
                                                        OnClick="btnNewEventMoreInfoCancel_Click" Text="Clear" />
                                                    <asp:Button ID="btnNewEventMoreInfoContinue" runat="server" 
                                                        OnClick="btnContinue_Click" Text="Continue" />
                                                </td>  
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table> 
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel ID="tabPanelComments" runat="server" HeaderText="Comments" Font-Bold="false">
                        <ContentTemplate>
                            <table width="100%">                    
                                <tr>
                                    <td valign = "top" width="20%">
                                        <asp:Label ID="lblEnterComments" runat="server" >Comments </asp:Label>
                                    </td>
                                    <td width="80%">
                                        <asp:TextBox ID="txtComments" Runat="server" CssClass="largeTextbox" TextMode="MultiLine" Height="100pt" Width="90%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" width="80%">
                                        <table>
                                            <tr>
                                                <td align="center" width="100%">
                                                    <asp:Button ID="btnBackComments" runat="server" OnClick="btnBack_Click" 
                                                        Text="Back" />
                                                    <asp:Button ID="btnCancelComments" runat="server" 
                                                        OnClick="btnCancelComments_Click" Text="Cancel" />
                                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" 
                                                        Text="  Add  " />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>                    
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
        <tr>
            <td  style="width:300px">
                <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
                <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" ForeColor="Red" ShowMessageBox="false" ShowSummary="true" Width="600pt" />
            </td>
        </tr>   
    </table>
</asp:Content>
