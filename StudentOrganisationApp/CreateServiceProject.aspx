<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master" CodeBehind="CreateServiceProject.aspx.cs" Inherits="StudentOrganisationApp.CreateServiceProject" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table width="100%">
        <tr>
            <td>    
                <asp:TabContainer ID="tabContainerNewServiceProject" runat="server" ActiveTabIndex="0" Font-Bold="true" style="margin-bottom: 0px" Width="100%" >
                    <asp:TabPanel ID="tabPaneNewEvent" runat="server" HeaderText="Event" Width="100%" Font-Bold="false">
                        <HeaderTemplate>Service Project</HeaderTemplate>
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlServiceProject" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Service Project" Width="100%" Font-Bold="False">
                                            <table style="background: #CCCCCC; width:100%; height:100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblServiceProjectTitle" runat="server">Title </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtServiceProjectTitle" runat="server" ForeColor="Black" Width="200px"></asp:TextBox>
                                                    </td>                        
                                                    <td>
                                                        <asp:Label ID="lblServiceProjectOrgEncharge" runat="server">For Organization</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList  AppendDataBoundItems="True" ID="ddlNewServiceProjectOrgEncharge" runat="server" width = '200pt'>
                                                            <asp:ListItem Text="Select Organization" Value="-1" />
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Label ID="lblServiceProjectDescription" runat="server">Community Impact</asp:Label>
                                                    </td>
                                                    <td colspan = "3">
                                                        <asp:TextBox ID="txtServiceProjectDescription" runat="server"  ForeColor="Black" TextMode="MultiLine" CssClass="largeTextbox" Height="100pt" Width="90%" ></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr> 
                                                    <td>
                                                        <asp:Label ID="lblServiceProjectLocation" runat="server">Location </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtServiceProjectLocation" runat="server" ForeColor="Black" Width="200px"></asp:TextBox>
                                                    </td>                   
                                                    <td align="right">
                                                         <asp:Label ID="lblServiceProjectOnGoing" runat="server">OnGoing </asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:CheckBox ID="chkServiceProjectOnGoing" runat="server" oncheckedchanged="chkServiceProjectOnGoing_CheckedChanged" AutoPostBack="True" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" width="100%">
                                                        <asp:panel ID = "pnlOneTime" runat="server">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblServiceProjectDate" runat="server" >Date </asp:Label>
                                                                    </td>
                                                                    <td>
                                                                       <div id="divcalServiceProjectDate" style="display:none;">
                                                                           <asp:CalendarExtender ID="calServiceProjectDate" runat="server" 
                                                                               TargetControlID="txtServiceProjectDate" PopupButtonID="imgServiceProjectDate" 
                                                                               Format="MM/dd/yyyy" Enabled="True" />
                                                                        </div>
                                                                        <asp:TextBox ID="txtServiceProjectDate" Runat="server" width="100pt" 
                                                                            contenteditable="false" ForeColor="Black" />
                                                                        <asp:ImageButton ID="imgServiceProjectDate" Width="16px" Height="16px" runat="server" 
                                                                            ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblSPOneTimeFromTime" runat="server">Start Time </asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSPOneTimeFromTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RegularExpressionValidator ID="revtime" runat="server" 
                                                                            ControlToValidate="txtSPOneTimeFromTime" 
                                                                            ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                                                            ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblSPOneTimeToTime" runat="server">End Time </asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSPOneTimeToTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RegularExpressionValidator ID="revtime0" runat="server" 
                                                                            ControlToValidate="txtSPOnGoingToTime" 
                                                                            ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                                                            ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <asp:panel ID = "pnlOnGoing" runat="server" Visible="False">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblServiceProjectStartDate" runat="server" >Start Date </asp:Label>
                                                                    </td>
                                                                    <td >
                                                                       <div id="divcalServiceProjectStartDate" style="display:none;">
                                                                           <asp:CalendarExtender ID="calServiceProjectStartDate" runat="server" 
                                                                               TargetControlID="txtServiceProjectStartDate" PopupButtonID="imgServiceProjectStartDate" 
                                                                               Format="MM/dd/yyyy" Enabled="True" />
                                                                       </div>
                                                                       <asp:TextBox ID="txtServiceProjectStartDate" Runat="server" width="100pt" 
                                                                            contenteditable="false" ForeColor="Black" />
                                                                       <asp:ImageButton ID="imgServiceProjectStartDate" Width="16px" Height="16px" runat="server" 
                                                                            ImageUrl="~/Images/calender.bmp" CausesValidation="False" />

                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                    <td>
                                                                        <asp:Label ID="lblServiceProjectEndDate" runat="server" >End Date </asp:Label>
                                                                    </td>
                                                                    <td style="width: 80%; height: 103px">
                                                                       <div id="divcalServiceProjectEndDate" style="display:none;">
                                                                           <asp:CalendarExtender ID="calServiceProjectEndDate" runat="server" 
                                                                               TargetControlID="txtServiceProjectEndDate" PopupButtonID="imgServiceProjectEndDate" 
                                                                               Format="MM/dd/yyyy" Enabled="True" />
                                                                       </div>
                                                                       <asp:TextBox ID="txtServiceProjectEndDate" Runat="server" width="100pt" 
                                                                            contenteditable="false" ForeColor="Black" />
                                                                       <asp:ImageButton ID="imgServiceProjectEndDate" Width="16px" Height="16px" runat="server" 
                                                                            ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                                                                    </td>
                                                                    <td style="width: 80%; height: 103px">&nbsp;</td>
                                                                    <td>
                                                                        <asp:Label ID="lblSPOnGoingDay" runat="server">Day </asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList  AppendDataBoundItems="True" ID="ddlSPOnGoingDay" runat="server">
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
                                                                        <asp:RegularExpressionValidator ID="revtime1" runat="server" 
                                                                            ControlToValidate="txtSPOnGoingFromTime" 
                                                                            ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                                                            ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblSPOnGoingToTime" runat="server">End Time </asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSPOnGoingToTime" runat="server" ForeColor="Black"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RegularExpressionValidator ID="revtime2" runat="server" 
                                                                            ControlToValidate="txtSPOnGoingToTime" 
                                                                            ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                                                            ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblMeetFrequency" runat="server">Meeting Frequency </asp:Label>
                                                                    </td>                        
                                                                    <td align="left" valign="middle">
                                                                        <asp:DropDownList  AppendDataBoundItems="True" ID="ddlMeetingFrequency" runat="server" 
                                                                                Height="19px" Width="305px">
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
                                                        </asp:panel>
                                                    </td>
                                                </tr>
                                             </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlPartner" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Community Partner" Width="100%" Font-Bold="False">
                                            <table style="background: #CCCCCC; width:100%; height:100%">
                                                <tr>                                       
                                                    <td width="20%">
                                                        <asp:Label ID="lblServiceProjectCP" runat="server">Community Partner </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtServiceProjectCP" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                     <td width="20%">
                                                        <asp:Label ID="lblServiceProjectCPName" runat="server">Contact Name </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtServiceProjectCPName" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr> 
                                                <tr>                                       
                                                    <td width="20%">
                                                        <asp:Label ID="lblServiceProjectCPEmail" runat="server">Contact Email </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtServiceProjectCPEmail" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                         <asp:RegularExpressionValidator ID="revemail" runat="server" 
                                                             ControlToValidate="txtServiceProjectCPEmail" 
                                                             ErrorMessage="Please enter a valid e-mail" ForeColor="Red" 
                                                             ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:Label ID="lblServiceProjectCPPhone" runat="server">Contact Phone </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtServiceProjectCPPhone" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr> 
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Planned Results" Width="100%" Font-Bold="False">
                                            <table style="background: #CCCCCC; width:100%; height:100%">
                                                <tr>                                       
                                                    <td width="20%">
                                                        <asp:Label ID="Label1" runat="server"># of Volunteers </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="planned_vols" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:Label ID="Label2" runat="server">Volunteer Hours </asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="planned_hrs" runat="server" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <td width="20%">
                                                        <asp:Label ID="planned_items" runat="server">Funds/Items Raised</asp:Label>
                                                    </td>
                                                    <td colspan = "3">
                                                        <asp:TextBox ID="TextBox3" runat="server" ForeColor="Black" Width="200pt" MaxLength="250"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlResults" runat="server" BorderColor="#CCCCCC" Height= "100%" HorizontalAlign="Left" GroupingText="Final Results" Width="100%" Font-Bold="False">
                                            <table style="background: #CCCCCC; width:100%; height:100%">
                                                <tr>                                       
                                                    <td width="20%">
                                                        <asp:Label ID="lblServiceProjectNoOfVolunteers" runat="server"># of Volunteers</asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtServiceProjectNoOfVolunteers" runat="server" 
                                                            ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:Label ID="lblServiceProjectVolunteersHours" runat="server">Volunteer Hours</asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:TextBox ID="txtServiceProjectVolunteersHours" runat="server" 
                                                            ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <td width="20%">
                                                        <asp:Label ID="lblFundsRaised" runat="server">Funds/Items Raised</asp:Label>
                                                    </td>
                                                    <td colspan = "3">
                                                        <asp:TextBox ID="txtFundsRaised" runat="server" ForeColor="Black" Width="200pt" MaxLength="250"></asp:TextBox>
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
                                                    <asp:Button ID="btnCancelMain" runat="server" Text="Cancel" onclick="btnCancelMain_Click" CausesValidation="False"/>
                                                </td>              
                                                <td >
                                                    <asp:Button ID="btnContinue" runat="server" Text="Continue" onclick="btnContinue_Click"/>
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
                                    <td  valign = "top" width="20%">
                                        <asp:Label ID="lblEnterComments" runat="server">Comments </asp:Label>
                                    </td>                        
                                    <td>
                                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" 
                                            CssClass="largeTextbox" Height="100pt" Width="90%" ForeColor="Black"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="100%">
                                            <tr>
                                                <td align="left">
                                                    <asp:Button ID="btnBackComments" runat="server" OnClick="btnBack_Click" Text="Back" />
                                                    <asp:Button ID="btnCancelComments" runat="server" OnClick="btnCancelComments_Click" Text="Cancel" CausesValidation="False" />
                                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="  Add  " />
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
            <td style="width:300px">
              <asp:Label ID="lblMessage" runat="server" CssClass="Error"></asp:Label>
              <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" ForeColor="Red" ShowMessageBox="false" ShowSummary="true" Width="600pt" />
            </td>
        </tr>
     </table>
</asp:Content>