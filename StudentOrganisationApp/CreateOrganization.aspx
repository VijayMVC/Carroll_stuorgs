<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Site.Master" CodeBehind="CreateOrganization.aspx.cs" Inherits="StudentOrganisationApp.Main" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%; height:100%">
<tr>
<td>
    <asp:TabContainer ID="tabContainerCreateOrg" runat="server" ActiveTabIndex="0" 
         style="margin-bottom: 0px" Width="100%" Font-Bold="true">
        <asp:TabPanel ID="tabPanelCreateOrg" Width="100%" runat="server" HeaderText="Organization" Font-Bold="false">
            <HeaderTemplate>
                Organization
            </HeaderTemplate>
        <ContentTemplate>
              <table Width="100%">
            <tr>
                <td align="left" width="100%">
                <asp:Panel ID="pnlOrganization" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Organization" Width="100%" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                    <tr>
                    <td width="20%">
                        <asp:Label ID="lblOrg" runat="server">Name </asp:Label>
                    </td>                        
                    <td colspan="3" align="left" valign="middle" width="80%" >
                        <asp:TextBox ID="txtorg" runat="server" ForeColor="Black" Width="320px" 
                            CssClass="text-box" Height="23px"></asp:TextBox>
                    </td>
               </tr>
                <tr>
                    <td width="20%" >
                        <asp:Label ID="lblCategory" runat="server">Category </asp:Label>
                    </td>                        
                    <td colspan="3" align="left" valign="middle" width="80%">
                        <asp:DropDownList  AppendDataBoundItems="True" ID="ddlCategory" runat="server" 
                            Height="18px" Width="320px" ForeColor="Black">
                        <asp:ListItem Text="Select Organization Category" Value="-1" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="20%" >
                        <asp:Label ID="lblDescription" runat="server">Description </asp:Label>
                    </td>                        
                    <td colspan="3" align="left" valign="middle" width="80%">
                        <asp:TextBox ID="txtDescription" runat="server"  ForeColor="Black" 
                            TextMode="MultiLine" CssClass="largeTextbox" Width="90%" Height="100px"></asp:TextBox>
                    </td>
               </tr> 
                    </table></asp:Panel></td></tr>
                   <tr>
                <td align="left">
                <asp:Panel ID="pnlMeetings" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Meetings" Width="100%" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                    <tr>
                    <td width="20%">
                        <asp:Label ID="lblMeetBuilding" runat="server">Building </asp:Label>
                    </td>                        
                    <td align="left" valign="middle" width="30%">
                        <asp:TextBox ID="txtBuilding" runat="server"  ForeColor="Black"></asp:TextBox>
                    </td>
                        <td align="left" valign="middle">
                            &nbsp;</td>
                    <td width="20%">
                        <asp:Label ID="lblMeetRoom" runat="server">Room </asp:Label>
                    </td>                        
                    <td align="left" valign="middle" width="30%">
                        <asp:TextBox ID="txtMeetRoom" runat="server"  ForeColor="Black"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                      <td width="20%">
                        <asp:Label ID="lblMeetFrequency" runat="server">Frequency </asp:Label>
                    </td>                        
                    <td align="left" valign="middle" width="30%">
                    <asp:DropDownList  AppendDataBoundItems="True" ID="ddlMeetingFrequency" runat="server" 
                            Height="19px" ForeColor="Black">
                        <asp:ListItem Text="Select Meeting Frequency" Value="-1" />
                        <asp:ListItem Text="Weekly" Value="0" />
                        <asp:ListItem Text="Every Other Week" Value="1" />
                        <asp:ListItem Text="First Week of the month" Value="2" />
                        <asp:ListItem Text="Second Week of the month" Value="3" />
                        <asp:ListItem Text="Third Week of the month" Value="4" />
                        <asp:ListItem Text="Fourth Week of the month" Value="5" />
                        <asp:ListItem Text="Fifth Week of the month" Value="6" />
                        </asp:DropDownList></td>
                      <td align="left" valign="middle">
                          &nbsp;</td>
                    <td width="20%">
                        <asp:Label ID="lblMeetDay" runat="server">Day </asp:Label>
                    </td>                        
                    <td align="left" valign="middle" width="30%">
                    <asp:DropDownList  AppendDataBoundItems="True" ID="ddlMeetingDay" runat="server" 
                            Height="19px" ForeColor="Black">
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
                    
                
               
                </tr><tr>

                    <td align="left" valign="middle" width="20%" >
                        <asp:Label ID="lblMeetTime" runat="server">Time </asp:Label>
                    </td>
                    <td align="left" valign="middle" width="30%">
                        <asp:TextBox ID="txtMeetTime" runat="server"  ForeColor="Black"></asp:TextBox>
                    </td>
                        <td align="left" valign="middle">
                            <asp:RegularExpressionValidator ID="revtime" runat="server" 
                                ControlToValidate="txtMeetTime" 
                                ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                        </td>
                     </tr>
                    </table>
                </asp:Panel>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Panel ID="pnlAccounts" runat="server" BorderColor="#CCCCCC" Height= "100%"
                        HorizontalAlign="Left" GroupingText="Accounts" Width="100%" Font-Bold="False">
                        <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
                            <tr>
                                <td width="20%">
                                    <asp:Label ID="lblOAccount" runat="server">O Account </asp:Label>
                                </td>
                                <td style="width: 20%" width="30%">
                                    <asp:TextBox ID="txtOAccount" runat="server" ForeColor="Black" Width="200px" MaxLength="6"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>
									<asp:Label ID="lblProjectCode" runat="server">Project Code </asp:Label>
								</td>
                                <td>
									<asp:TextBox ID="txtProjectCode" runat="server" ForeColor="Black" Width="200px" MaxLength="4"></asp:TextBox>
								</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td align="left">
                <asp:Panel ID="pnlApproval" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Approval" Width="100%" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                     <tr>
                    <td width="20%">
                        <asp:Label ID="lblRegApproval0" runat="server">Registar's Approval </asp:Label>
                    </td>                        
                    <td align="left" valign="middle"> 
                        <asp:TextBox ID="txtRegApproval" runat="server" contenteditable="false" 
                            Width="100pt" ForeColor="Black" ></asp:TextBox>
                        <asp:CalendarExtender ID="calExtenderRegApproval" runat="server" Enabled="True" 
                            Format="MM/dd/yyyy" PopupButtonID="imgRegApproval" 
                            TargetControlID="txtRegApproval">
                        </asp:CalendarExtender>
                        <asp:ImageButton ID="imgRegApproval" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                    </td>
                    <td>
                        <asp:Label ID="lblCXCode" runat="server">CX Code </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCXCode" runat="server"  ForeColor="Black"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   
                    <td align="right" width="20%">
                        <asp:CheckBox ID="chkBoxRegApproval" runat="server" 
                            oncheckedchanged="chkBoxRegApproval_CheckedChanged" AutoPostBack="True" />
                    </td>                        
                    <td align="left" valign="middle" >
                        <asp:Label ID="lblReqMet" runat="server">Requirements Met </asp:Label>
                    </td>
                     <td>
                        <asp:Label ID="lblRegApproval" runat="server" Visible="False">Requirements Met Date </asp:Label>
                    </td>                        
                    <td align="left" valign="middle"> 
                        <asp:TextBox ID="txtRequirementMetDate" runat="server" contenteditable="false" 
                            Width="100pt" Visible="False" ForeColor="Black" ></asp:TextBox>
                        <asp:CalendarExtender ID="calExtenderRequirementMetDate" runat="server" Enabled="True" 
                            Format="MM/dd/yyyy" PopupButtonID="imgRequirementMetDate" 
                            TargetControlID="txtRequirementMetDate">
                        </asp:CalendarExtender>
                        <asp:ImageButton ID="imgRequirementMetDate" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" 
                            Visible="False" />
                    </td>
                </tr>
                    </table></asp:Panel></td></tr>
                
                          
               <tr>
                   <td>
                       <table>

                <tr>
                    <td style="width: 20%" >
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" CausesValidation="False" />
                        <asp:Button ID="btnContinue" runat="server" OnClick="btnContinue_Click" 
                            Text="Continue" />
                    </td>                        
                </tr>
                       </table>
                   </td>
               </tr> 
               
            </table>
        </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanelDates" runat="server" HeaderText="Dates" Font-Bold="false">
            <HeaderTemplate>
                Dates
            </HeaderTemplate>
            <ContentTemplate> 
                 <table width="100%">
                    <tr>
                <td align="left">
                <asp:Panel ID="pnlProposal" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Proposal" Width="100%" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                    <tr>
                        <td width="20%">
                            <asp:Label ID="lblDateProposalPacket" runat="server">Proposal Submitted </asp:Label>
                        </td>                        
                        <td style="width:200px" align="left" valign="middle">
                            <div id="divcalDatePrposalPacketSub" style="display:none;">
                                <asp:CalendarExtender ID="calDatePrposalPacketSub" runat="server" 
                                    TargetControlID="txtDatePrposalPacketSub" 
                                    PopupButtonID="imgDatePrposalPacketSub" Format="MM/dd/yyyy" Enabled="True" />
                            </div>
                            <asp:TextBox ID="txtDatePrposalPacketSub" Runat="server" width="100pt" 
                                contenteditable="false" ForeColor="Black" />
                            <asp:ImageButton ID="imgDatePrposalPacketSub" Width="16px" Height="16px" 
                                runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        </td>
                        <td  >
                            <asp:Label ID="lblDateDenied" runat="server">Denied </asp:Label>
                        </td>                        
                        <td  align="left" valign="middle">
                            <div id="divcalDateDenied" style="display:none;">
                                <asp:CalendarExtender ID="calDatedenied" runat="server" 
                                    TargetControlID="txtDatedenied" PopupButtonID="imgDatedenied" 
                                    Format="MM/dd/yyyy" Enabled="True" />
                            </div>
                            <asp:TextBox ID="txtDatedenied" Runat="server" width="100pt" 
                                contenteditable="false" ForeColor="Black" />
                            <asp:ImageButton ID="imgDatedenied" Width="16px" Height="16px" runat="server" 
                                ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td  style="width:100px" align="left" valign="middle" width="20%" >
                            <asp:Label ID="lblDateApproved" runat="server">Approved </asp:Label>
                        </td>                        
                        <td style="width:200px" align="left" valign="middle" >
                            <div id="divcalDateApproved" style="display:none;">
                                <asp:CalendarExtender ID="calDateApproved" runat="server" 
                                    TargetControlID="txtDateApproved" PopupButtonID="imgDateApproved" 
                                    Format="MM/dd/yyyy" Enabled="True" />
                            </div>
                            <asp:TextBox ID="txtDateApproved" Runat="server" width="100pt" 
                                contenteditable="false" ForeColor="Black" />
                            <asp:ImageButton ID="imgDateApproved" Width="16px" Height="16px" runat="server" 
                                ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100px" width="20%"  >
                            <asp:Label ID="lblProposalNotes" runat="server">Notes </asp:Label>
                        </td>                        
                        <td  colspan="3" align="left" valign="middle" >
                            <asp:TextBox ID="txtProposalNotes" Runat="server" CssClass="largeTextBox" 
                                TextMode="MultiLine" ForeColor="Black" Width="90%" Height="100px" />
                        </td>
                    </tr>
                    </table></asp:Panel></td></tr>
                         <tr>
                <td align="left">
                <asp:Panel ID="pnlConstitution" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Constitution" Width="100%" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                     <tr>
                        <td style="width:237px" width="20%"  >
                            <asp:Label ID="lblConstitutionSubmission" runat="server">Constitution Submission </asp:Label>
                        </td>                        
                        <td align="left" valign="middle" width="80%" >
                            <div id="divcalConstitutionSubmission" style="display:none;">
                                <asp:CalendarExtender ID="calConstitutionSubmission" runat="server" 
                                    TargetControlID="txtConstitutionSubmission" 
                                    PopupButtonID="imgConstitutionSubmission" Format="MM/dd/yyyy" Enabled="True" />
                            </div>
                            <asp:TextBox ID="txtConstitutionSubmission" Runat="server" width="100pt" 
                                contenteditable="false" ForeColor="Black" />
                            <asp:ImageButton ID="imgConstitutionSubmission0" runat="server" 
                                CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                Width="16px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:237px; height: 26px;" width="20%"  >
                            <asp:Label ID="lblConstitution" runat="server">Constitution </asp:Label>
                        </td>                        
                        <td style="height: 26px;" align="left" valign="middle" width="80%" >
                            <div id="divcalConstitution" style="display:none;">
                                <asp:CalendarExtender ID="calConstitution" runat="server" 
                                    TargetControlID="txtConstitution" PopupButtonID="imgConstitution" 
                                    Format="MM/dd/yyyy" Enabled="True" />
                            </div>
                            <asp:TextBox ID="txtConstitution" Runat="server" width="100pt" 
                                contenteditable="false" ForeColor="Black" />
                            <asp:ImageButton ID="imgConstitution" runat="server" CausesValidation="False" 
                                Height="16px" ImageUrl="~/Images/calender.bmp" Width="16px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:237px" width="20%"  >
                            <asp:Label ID="lblConstitutionNotes" runat="server">Notes </asp:Label>
                        </td>                        
                        <td align="left" valign="middle" width="80%"  >
                            <asp:TextBox ID="txtConstitutionNotes" Runat="server" CssClass="largeTextBox" 
                                TextMode="MultiLine" ForeColor="Black" Width="90%" Height="100px" />
                        </td>
                    </tr>
                    </table></asp:Panel></td></tr>
<tr><td>
    <table>
  <tr>
                       <td style="100%: ;"  >
                            <asp:Button ID="btnBackDates" runat="server" Text="Back"  OnClick="btnBack_Click"/>
                            <asp:Button ID="btnCanelDates0" runat="server" OnClick="btnCanelDates_Click" 
                                Text="Cancel" />
                            <asp:Button ID="btnContinueDates0" runat="server" OnClick="btnContinue_Click" 
                                Text="Continue" />
                        </td>  
                        
                    </tr>
    </table>
    </td></tr>


                    
                   
                  
                 </table>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="tabPanelComments" runat="server" HeaderText="Comments" Font-Bold="false" Width="100%">
            <HeaderTemplate>
                Comments
            </HeaderTemplate>
            <ContentTemplate>
                <table Width="100%">                    
                    <tr>
                        <td  valign = "top" width="20%">
                            <asp:Label ID="lblEnterComments" runat="server">Comments </asp:Label>
                        </td>                        
                        <td width="100%">
                            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" 
                                CssClass="largeTextbox" Height="150px" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                        <table>
                         
                        <tr>
                        <td align="left" width="100%">
                            <asp:Button ID="btnBackComments" runat="server" OnClick="btnBack_Click" 
                                Text="Back" />
                            &nbsp;<asp:Button ID="btnCancelComments0" runat="server" 
                                OnClick="btnCancelComments_Click" Text="Cancel" CausesValidation="False" />
                            &nbsp;<asp:Button ID="btnSubmit1" runat="server" OnClick="btnSubmit_Click" 
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
      <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" 
        ForeColor="Red" ShowMessageBox="false" ShowSummary="true" />
      </td>
     </tr>   
</table>
</asp:Content>

