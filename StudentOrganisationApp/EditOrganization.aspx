<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master" CodeBehind="EditOrganization.aspx.cs" Inherits="StudentOrganisationApp.Organization.EditOrganizationSelect" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Panel ID="pnlSelectOrganization" runat=server DefaultButton="btnGoMain">
        <table width="100%">
            <tr>
                <td width="30%"  >
                    <asp:Label ID="lblSelectOrganization" runat="server">Select Organization </asp:Label>
                </td>
                <td width="30%" >
                      <asp:ComboBox ID="ddlOrganization" runat="server" AppendDataBoundItems="True" 
                              AutoCompleteMode="Suggest" ForeColor="Black" MaxLength="0" 
                          Width="220px">
                              <asp:ListItem Selected=True Text="Select Organization" Value="-1" />
                          </asp:ComboBox>
                </td>
                <td width="40%">
                    <asp:Button ID="btnGoMain" runat="server" Text="Select" width='50pt' onclick="btnGoMain_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <table width="100%">
        <tr>
            <td >
                <asp:Label ID="lblOrganizationEdit" runat="server" Font-Bold="True"></asp:Label>
            </td>                        
            <td>&nbsp;</td>
            <td>&nbsp;</td>    
        </tr>
        <tr>
            <td colspan="3">
                <asp:Panel ID="pnlEditing" runat="server" Visible = "false" Width="100%">
                    <asp:TabContainer ID="tabContainerEditOrg" runat="server" ActiveTabIndex="3" Font-Bold="true"
                         style="margin-bottom: 0px" Width="100%" Visible="true">

                        <asp:TabPanel ID="tabPanelEditOrg" runat="server" HeaderText="Organization" Font-Bold="false">
                            <ContentTemplate>
                                <table width="100%">
                                     <tr>
                                        <td align="left">
                                            <asp:Panel ID="pnlOrganization" runat="server" BorderColor="#CCCCCC" Height= "100%"
                                             HorizontalAlign="Left" GroupingText="Organization" Width="100%" Font-Bold="False">
                                                <table style="background: #CCCCCC; width:100%; height:100%">
                                                    <tr>
                                                        <td class="style4" style="width: 20%;">
                                                            <asp:Label ID="lblOrg" runat="server">Name </asp:Label>
                                                        </td>
                                                        <td align="left" colspan="2" valign="middle" width="80%">
                                                            <asp:TextBox ID="txtorg" runat="server" CssClass="text-box" ForeColor="Black" 
                                                                Width="300px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style4" style="width: 20%;">
                                                            <asp:Label ID="lblCategory" runat="server">Category </asp:Label>
                                                        </td>
                                                        <td colspan="2" width="80%">
                                                            <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" 
                                                                width="200px" ForeColor="Black">
                                                             <asp:ListItem Text="Select Organization Category" Value="-1" /></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 20%" class="style4">
                                                            <asp:Label ID="lblDescription" runat="server">Description </asp:Label>
                                                        </td>
                                                        <td colspan="3" width="80%">
                                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="largeTextbox" 
                                                                ForeColor="Black" TextMode="MultiLine" Width="90%" Height="100px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 20%" class="style4">
                                                            <asp:Label ID="lblStatus" runat="server">Status </asp:Label>
                                                        </td>
                                                        <td width="80%">
                                                            <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True" 
                                                                width="220px" ForeColor="Black">
                                                            <asp:ListItem Text="Select Status" Value="-1" /></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 20%" class="style4">
                                                            <asp:Label ID="lblAdvisor" runat="server">Select Advisor </asp:Label>
                                                        </td>
                                                        <td style="width: 30%" width="500px">
                                                            <asp:ComboBox ID="ddlAdvisor" runat="server" AppendDataBoundItems="True" 
                                                                AutoCompleteMode="Suggest" ForeColor="Black" MaxLength="0" Width="200px">
                                                                <asp:ListItem Text="Select Advisor" Value="-1" />
                                                            </asp:ComboBox>
                                                        </td>
                                                        <td width="25%">
                                                            <asp:Button ID="btnAddAdvisor" runat="server" Text="Add to list" 
                                                                onclick="btnAddAdvisor_Click" />
                                                        </td>
                                                        <td width="25%">
                                                            <asp:Button ID="btnRefreshAdvisorList" runat="server" Text="Refresh list" 
                                                                                        onclick="btnRefreshAdvisorList_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="20%: ;" class="style4">
                                                        </td>
                                                        <td style="width: 30%">
                                                            <asp:GridView ID="grdAdvisors" runat="server" 
                                                                onrowdatabound="grdAdvisors_RowDataBound" 
                                                                onrowdeleting="grdAdvisors_RowDeleting" Width="100%" Font-Bold="False">
                                                                <Columns>
                                                                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" 
                                                                        ButtonType="Button" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <td width="25%">
                                                            <asp:Button ID="btnNewAdvisor" runat="server" OnClick="btnNewAdvisor_Click" 
                                                                Text="New Advisor" />
                                                        </td>
                                                        <td width="25%">
                                                            <asp:Button ID="btnEditAdvisor" runat="server" Text="Edit Advisor" 
                                                                onclick="btnEditAdvisor_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td align="left">
                                            <asp:Panel ID="pnlMeetings" runat="server" BorderColor="#CCCCCC" Height= "100%"
                                             HorizontalAlign="Left" GroupingText="Meetings" Width="100%" Font-Bold="False">
                                                <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
                                                    <tr>
                                                        <td width="20%">
                                                            <asp:Label ID="lblMeetBuilding" runat="server">Building </asp:Label>
                                                        </td>
                                                        <td style="width: 20%" width="30%">
                                                            <asp:TextBox ID="txtBuilding" runat="server"  ForeColor="Black" Width="200px"></asp:TextBox>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td style="width: 20%">
                                                            <asp:Label ID="lblMeetRoom" runat="server">Room </asp:Label>
                                                        </td>
                                                        <td width="30%">
                                                            <asp:TextBox ID="txtMeetRoom" runat="server"  ForeColor="Black" Width="200px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>  
                                                        <td width="20%">
                                                            <asp:Label ID="lblMeetFrequency" runat="server">Frequency </asp:Label>
                                                        </td>                        
                                                        <td align="left" valign="middle" width="30%">
                                                            <asp:DropDownList  AppendDataBoundItems="True" ID="ddlMeetingFrequency" runat="server" 
                                                                Height="19px" Width="200px" ForeColor="Black">
                                                                <asp:ListItem Text="Select Meeting Frequency" Value="-1" />
                                                                <asp:ListItem Text="Weekly" Value="0" />
                                                                <asp:ListItem Text="Every Other Week" Value="1" />
                                                                <asp:ListItem Text="First Week of the month" Value="2" />
                                                                <asp:ListItem Text="Second Week of the month" Value="3" />
                                                                <asp:ListItem Text="Third Week of the month" Value="4" />
                                                                <asp:ListItem Text="Fourth Week of the month" Value="5" />
                                                                <asp:ListItem Text="Fifth Week of the month" Value="6" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td style="width: 20%">
                                                            <asp:Label ID="lblMeetDay" runat="server">Day </asp:Label>
                                                        </td>
                                                        <td width="30%">
                                                            <asp:DropDownList  AppendDataBoundItems="True" ID="ddlMeetingDay" runat="server" 
                                                                Height="19px" Width="200px" ForeColor="Black">
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
                                                        <td width="20%">
                                                            <asp:Label ID="lblMeetTime" runat="server">Time </asp:Label>
                                                        </td>
                                                        <td style="width: 20%" width="30%">
                                                            <asp:TextBox ID="txtMeetTime" runat="server" ForeColor="Black" Width="200px"></asp:TextBox>
                                                        </td>
                                                        <td colspan="3"><span style="color: #FF0000">*</span><br />
                                                            <asp:Label ID="errormsg" runat="server" Text="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" style="color: #FF0000"></asp:Label>
                                                            
                                                            <%--<asp:RegularExpressionValidator ID="revtime" runat="server" 
                                                                ControlToValidate="txtMeetTime" 
                                                                ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                                                                ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>--%>
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
                                            <asp:Panel ID="pnlRequirement" runat="server" BorderColor="#CCCCCC" Height= "100%"
                                             HorizontalAlign="Left" GroupingText="Requirement" Width="100%" Font-Bold="False">
                                                <table style="background: #CCCCCC; width:100%; height:100%" width="100%">                 
                                                    <tr>
                                                        <td class="style3" width="20%">
                                                            <asp:Label ID="lblRegApproval" runat="server">Registar's Approval </asp:Label>
                                                        </td>                        
                                                        <td align="left" valign="middle" width="30%"> 
                                                            <asp:TextBox ID="txtRegApproval" runat="server" contenteditable="false" 
                                                                Width="100pt" ForeColor="Black"></asp:TextBox>
                                                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                                                                Format="MM/dd/yyyy" PopupButtonID="imgRegApproval" 
                                                                TargetControlID="txtRegApproval">
                                                            </asp:CalendarExtender>
                                                            <asp:ImageButton ID="imgRegApproval" Width="16px" Height="16px" 
                                                                runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                                                        </td>
                                                        <td align="left" class="style3" width="20%">
                                                            <asp:Label ID="lblCXCode" runat="server">CX Code </asp:Label>
                                                        </td>
                                                        <td align="left" width="30%">
                                                            <asp:TextBox ID="txtCXCode" runat="server"  ForeColor="Black" Width="100px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="style3" width="20%">
                                                            <asp:Label ID="lblReqMet" runat="server">Requirements Met </asp:Label>
                                                        </td>
                                                        <td align="left" width="30%">
                                                            <asp:CheckBox ID="chkBoxRegApproval" runat="server" AutoPostBack="True" 
                                                                OnCheckedChanged="chkBoxRegApproval_CheckedChanged" />
                                                        </td>
                                                        <td class="style3" width="20%">
                                                            <asp:Label ID="lblRequirementMetDate" runat="server" Visible="False">Requirements Met Date</asp:Label>
                                                        </td>
                                                        <td style="width: 20%" width="30%">
                                                            <asp:CalendarExtender ID="calExtenderReuirmentsMet" runat="server" 
                                                                Format="MM/dd/yyyy" PopupButtonID="btnCalPopReuirmentsMet" 
                                                                TargetControlID="txtRequirementMetDate" Enabled="True" />
                           
                                                            <asp:TextBox ID="txtRequirementMetDate" Runat="server" width="100pt" 
                                                                    Visible="False" contentEditable="false" ForeColor="Black" 
                                                                     />
                                                            <asp:ImageButton ID="btnCalPopReuirmentsMet" runat="server" 
                                                                CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                Width="16px" Visible="False"/>
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
                                                    <td style="width: 20%">
                                                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" onclick="btnCanel_Click" CausesValidation="False" />
                                                        <asp:Button ID="btnContinueMain" runat="server" OnClick="btnSubmitMain_Click" Text="Save" />
                                                    </td>
                                                </tr>
                                             </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:TabPanel>

                        <asp:TabPanel ID="tabPanelDates" runat="server" HeaderText="Dates" Font-Bold="false">
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td align="left">
                                            <asp:Panel ID="pnlProposal" runat="server" BorderColor="#CCCCCC" Height= "100%"
                                                HorizontalAlign="Left" GroupingText="Proposal" Width="100%" Font-Bold="False">
                                                <table style="background: #CCCCCC; width:100%; height:100%" width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblDateProposalPacket" runat="server">Proposed </asp:Label>
                                                        </td>
                                                        <td>
                                                            <div ID="divcalDatePrposalPacketSub" style="display:none;">
                                                                <asp:CalendarExtender ID="calDatePrposalPacketSub" runat="server" 
                                                                    Format="MM/dd/yyyy" PopupButtonID="imgDatePrposalPacketSub" 
                                                                    TargetControlID="txtDatePrposalPacketSub" Enabled="True" />
                                                            </div>
                                                            <asp:TextBox ID="txtDatePrposalPacketSub" Runat="server" width="100pt" 
                                                                contentEditable="false" ForeColor="Black"/>
                                                            <asp:ImageButton ID="imgDatePrposalPacketSub" runat="server" 
                                                                CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                Width="16px" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblDateDenied" runat="server">Denied </asp:Label>
                                                        </td>
                                                        <td>
                                                            <div ID="divcalDateDenied" style="display:none;">
                                                                <asp:CalendarExtender ID="calDatedenied" runat="server" Format="MM/dd/yyyy" 
                                                                    PopupButtonID="imgDatedenied" TargetControlID="txtDatedenied" 
                                                                    Enabled="True" />
                                                            </div>
                                                            <asp:TextBox ID="txtDatedenied" Runat="server" width="100pt" 
                                                                contentEditable="false" ForeColor="Black" />
                                                            <asp:ImageButton ID="imgDatedenied" runat="server" CausesValidation="False" 
                                                                Height="16px" ImageUrl="~/Images/calender.bmp" Width="16px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td>
                                                            <asp:Label ID="lblDateAccepted" runat="server">Accepted </asp:Label>
                                                        </td>
                                                        <td>
                                                            <div ID="divcalDateAccepted" style="display:none;">
                                                                <asp:CalendarExtender ID="calDateAccepted" runat="server" Format="MM/dd/yyyy" 
                                                                    PopupButtonID="imgDateAccepted" TargetControlID="txtDateAccepted" 
                                                                    Enabled="True" />
                                                            </div>
                                                            <asp:TextBox ID="txtDateAccepted" Runat="server" width="100pt" 
                                                                contentEditable="false" ForeColor="Black"  />
                                                            <asp:ImageButton ID="imgDateAccepted" runat="server" CausesValidation="False" 
                                                                Height="16px" ImageUrl="~/Images/calender.bmp" Width="16px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblProposalNotes" runat="server">Notes </asp:Label>
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="txtProposalNotes" Runat="server" CssClass="largeTextbox"
                                                                TextMode="MultiLine" ForeColor="Black" Width="90%" Height="100px"  />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlConstitution" runat="server" BorderColor="#CCCCCC" Height= "100%"
                                                HorizontalAlign="Left" GroupingText="Constitution" Width="100%" Font-Bold="False">
                                                <table style="background: #CCCCCC; width:100%; height:100%">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblConstitution" runat="server">Original </asp:Label>
                                                        </td>
                                                        <td>
                                                            <div ID="divcalConstitution" style="display:none;">
                                                                <asp:CalendarExtender ID="calConstitution" runat="server" Format="MM/dd/yyyy" 
                                                                    PopupButtonID="imgConstitution" TargetControlID="txtConstitution" 
                                                                    Enabled="True" />
                                                            </div>
                                                            <asp:TextBox ID="txtConstitution" Runat="server" width="100pt" 
                                                                contentEditable="false" ForeColor="Black"  />
                                                            <asp:ImageButton ID="imgConstitution" runat="server" CausesValidation="False" 
                                                                Height="16px" ImageUrl="~/Images/calender.bmp" Width="16px" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblConstitutionDenied" runat="server" Visible="False">Denied </asp:Label>
                                                        </td>
                                                        <td>
                                                            <div  style="display:none;" Visible="false" >
                                                                <asp:CalendarExtender ID="calConstitutionDenied" runat="server" 
                                                                    Format="MM/dd/yyyy" PopupButtonID="imgConstitutionDenied" 
                                                                    TargetControlID="txtConstitutionDenied" Enabled="True" />
                                                            </div>
                                                            <asp:TextBox ID="txtConstitutionDenied" Runat="server" width="100pt" 
                                                                Visible="False" contentEditable="false" ForeColor="Black" />
                                                            <asp:ImageButton ID="imgConstitutionDenied" runat="server" 
                                                                CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                Width="16px" Visible="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server">Updated </asp:Label>
                                                        </td>
                                                        <td>
                                                            <div style="display:none;">
                                                                <asp:CalendarExtender ID="calConstitutionUpdated" runat="server" 
                                                                    Format="MM/dd/yyyy" PopupButtonID="imgConstitutionUpdated" 
                                                                    TargetControlID="txtConstitutionUpdated" Enabled="True" />
                                                            </div>
                                                            <asp:TextBox ID="txtConstitutionUpdated" Runat="server" width="100pt" 
                                                                contentEditable="false" ForeColor="Black" />
                                                            <asp:ImageButton ID="imgConstitutionUpdated" runat="server" 
                                                                CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                Width="16px" />
                                                        </td>    
                                                        <td >
                                                            <asp:Label ID="lblConstitutionAccepted" runat="server" Visible="False" >Accepted </asp:Label>
                                                        </td>
                                                        <td>
                                                            <div id="divcalConstitutionAccepted" style="display:none;">
                                                                <asp:CalendarExtender ID="calConstitutionAccepted" runat="server" 
                                                                    Format="MM/dd/yyyy" PopupButtonID="imgConstitutionAccepted" 
                                                                    TargetControlID="txtConstitutionAccepted" Enabled="True" />
                                                            </div>
                                                            <asp:TextBox ID="txtConstitutionAccepted" Runat="server" width="100pt" 
                                                                Visible="False" contentEditable="false" ForeColor="Black"/>
                                                            <asp:ImageButton ID="imgConstitutionAccepted" runat="server" 
                                                                CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                                                                Width="16px" Visible="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblConstitutionNotes" runat="server">Notes </asp:Label>
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:TextBox ID="txtConstitutionNotes" Runat="server"
                                                                TextMode="MultiLine" CssClass="largeTextbox" ForeColor="Black" 
                                                                Width="90%" Height="100px" />
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
                                                    <td style="width: 30%">
                                                        <asp:Button ID="btnCanelDates" runat="server" OnClick="btnCanelDates_Click" 
                                                            Text="Cancel" CausesValidation="False" />
                                                        <asp:Button ID="btnContinueDates" runat="server" OnClick="btnSubmitDates_Click" 
                                                            Text="Save" CausesValidation="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:TabPanel>

                        <asp:TabPanel ID="tabPanelExecutiveMenbers" runat="server" HeaderText="Executive Members" Font-Bold="false">
                            <ContentTemplate>
                                <asp:Panel ID="pnlExecutiveMembers" runat="server" DefaultButton="btnAddExeMember" BorderColor="#CCCCCC" Height= "100%"
                                 HorizontalAlign="Left" Width="100%" GroupingText="Executive Members">
                                <table style="background: #CCCCCC; width:100%; height:100%">
                                        <tr>
                                            <td style="width: 173px">
                                                <asp:Label ID="lblSelectStudent" runat="server">Select a Student </asp:Label>
                                            </td>
                                            <td>
                                                <asp:ListBox ID="cmbStudents" runat="server" AppendDataBoundItems="True" 
                                                    ForeColor="Black" Height="150px" Width="200pt">
                                                    <asp:ListItem Text="Enter Name" Value="-1"></asp:ListItem>
                                                </asp:ListBox>
                                                <asp:ListSearchExtender ID="cmbStudents_ListSearchExtender" runat="server" 
                                                    Enabled="True" IsSorted="True" TargetControlID="cmbStudents">
                                                </asp:ListSearchExtender>
                                                <br />
                                            </td>
                                            <td align="left">
                                                <asp:Button ID="btnAddExeMember" runat="server" onclick="btnAddExeMember_Click" 
                                                    Text="Add to Executive Members">
                                                 </asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblGPANotMet" runat="server" ForeColor="Red" />
                                            </td>
                                            <td colspan="2">
                                                <asp:GridView ID="grdExeMember" runat="server" 
                                                    onrowdatabound="grdExeMember_RowDataBound" Width="100%" Font-Bold="False">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText = "Member Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMemberType" runat="server" Text='<%# Eval("MemberID") %>' Visible = "false" />
                                                                <asp:DropDownList ID="ddlMemberType" runat="server" OnSelectedIndexChanged="ddlMemberType_SelectedIndexChanged" AutoPostBack = "true">
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>  
                                                        <asp:TemplateField HeaderText = "Primary Contact">
                                                            <ItemTemplate>
                                                            <asp:Label ID="lblPrimaryContact" runat="server" Text='<%# Eval("IsPrimaryContact") %>' Visible = "false" />
                                                                <asp:CheckBox ID="chkPrimaryContact" runat="server" OnCheckedChanged="chkStatus_OnCheckedChanged"
                                                                    AutoPostBack="true"                             
                                                                    Checked='<%# Convert.ToBoolean(Eval("IsPrimaryContact")) %>'/>
                                                            </ItemTemplate>                    
                                                        </asp:TemplateField>     
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 173px">
                                                <asp:Button ID="btnCancelExeMembers" runat="server"  
                                                    Text="Cancel" onclick="btnCancelExeMembers_Click" CausesValidation="False">
                                                </asp:Button>
                                                <asp:Button ID="btnSubmitExeMembers0" runat="server" 
                                                    OnClick="btnSubmitExeMembers_Click" Text="Save" CausesValidation="False" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr> 
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:TabPanel>
        
                        <asp:TabPanel ID="tabPanelMembers" runat="server" HeaderText="Members" Font-Bold="false">
                            <HeaderTemplate>Members</HeaderTemplate>
                            <ContentTemplate>
                                <asp:Panel ID="pnlMembers" runat="server" BorderColor="#CCCCCC" Height= "100%"
                                 HorizontalAlign="Left" Width="100%" GroupingText="Members" DefaultButton="btnAddMember">
                                    <table style="background: #CCCCCC; width:100%; height:100%">
                                        <tr>
                                            <td style="width: 173px">
                                                <asp:Label ID="lblStudentsMembers" runat="server">Select a Student </asp:Label>
                                            </td>
                                            <td>
                                                 <asp:ListBox ID="cmbStudentsInMembers" runat="server" AppendDataBoundItems="True" 
                                                    width="200pt" ForeColor="Black" Height="150px">
                                                 <asp:ListItem Text="Enter Name" Value="-1" />
                                                </asp:ListBox>
                                                <asp:ListSearchExtender id="LSE" runat="server" TargetControlID="cmbStudentsInMembers" IsSorted="True" Enabled="True"/>
                                            </td>
                                            <td align="left">
                                                <asp:Button ID="btnAddMember" runat="server"
                                                    Text="Add to Members" onclick="btnAddMember_Click">
                                                 </asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblGPANotMetmember" runat="server" ForeColor="Red" />
                                            </td>
                                            <td colspan="2">
                                                <asp:GridView ID="grdMember" runat="server" AutoGenerateColumns="False" 
                                                    onrowdeleting="grdMember_RowDeleting" 
                                                    onrowdatabound="grdMember_RowDataBound" Width="100%" Font-Bold="False" >
                                                    <Columns>
                                                        <asp:BoundField DataField="LastName" Headertext="LastName"/>
                                                        <asp:BoundField DataField="FirstName" Headertext="FirstName"/>
                                                        <asp:BoundField DataField="CarrollID" Headertext="Carroll ID" />
                                                        <asp:CommandField ButtonType="Button" HeaderText="Remove" 
                                                            ShowDeleteButton="True" ShowHeader="True" DeleteText="Remove" />
                                                        <asp:BoundField DataField="Student_ID" Headertext="Student_ID"/>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 173px">
                                                <asp:Button ID="btnCancelMembers" runat="server"  
                                                    Text="Cancel" onclick="btnCancelMembers_Click" CausesValidation="False">
                                                </asp:Button>
                                                <asp:Button ID="btnSubmitMembers0" runat="server" 
                                                    OnClick="btnSubmitMembers_Click" Text="Save" CausesValidation="False" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr> 
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:TabPanel>

        <asp:TabPanel ID="tabPanelRequiredEvents" runat="server" HeaderText="Required Events" Font-Bold="false">
            <ContentTemplate>
                <asp:TabContainer ID="tabContainerReqEvent" runat="server" ActiveTabIndex="0" Width="100%">
             <asp:TabPanel ID="tabPanelSignUp" runat="server" HeaderText="Sign Up">
             <ContentTemplate>
                <asp:Panel ID="pnlSignUP" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="SignUP">
                <table style="background: #CCCCCC; width:100%; height:100%" width="100%">

                    <tr>
                        <td>
                        <asp:Label ID="lblrequiredEvent" runat="server">Select Required Event </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlReqEventSignUp" runat="server" AppendDataBoundItems="True" 
                                width="200pt">
                            <asp:ListItem Text="Select Required Event" Value="-1" />
                            </asp:DropDownList>
                     </td> 
                        <td>
                        <asp:Button ID="btnGoRequiredEventSignUp" runat="server" Text="Select" 
                                onclick="btnGoRequiredEventSignUp_Click"  />
                     </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="grdMeetings" runat="server" 
                                onrowdatabound="grdMeetings_RowDataBound" 
                                onrowdeleting="grdMeetings_RowDeleting" Width="100%" Font-Bold="False">
                                <Columns>
                                 <asp:CommandField ButtonType="Button" DeleteText="SignUp" HeaderText="SignUp" 
                                     ShowDeleteButton="True" />
</Columns>
</asp:GridView> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnCancelSignUp" runat="server" Text="Cancel" 
                                onclick="btnCancelSignUp_Click" Visible = "False" CausesValidation="False"></asp:Button>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                </ContentTemplate>
             </asp:TabPanel>                
             <asp:TabPanel ID="tabPanelTrack" runat="server" HeaderText="Track">
              <ContentTemplate>
                  <asp:Panel ID="pnlTrack" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" Width="100%" GroupingText="Track">
                <table style="background: #CCCCCC; width:100%; height:100%">                
                    <tr>
                        <td>
                        <asp:Label ID="lblRegEventAttended" runat="server">Select Required Event </asp:Label>
                        </td> 
                        <td>
                            <asp:DropDownList ID="ddlReqEvent" runat="server" AppendDataBoundItems="True" 
                                width="300px">
                            <asp:ListItem Text="Select Required Event" Value="-1" />
                            </asp:DropDownList>
                     </td>
                        <td>
                        <asp:Button ID="btnRegEventAttendGo" runat="server" Text="Select" 
                                onclick="btnRegEventAttendGo_Click" />
                     </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblReqEventMeetingDate" runat="server">Select Meeting Date </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlReqEventMeetingDate" runat="server" 
                                AppendDataBoundItems="True" width="300px" Enabled = "False">
                            <asp:ListItem Text="Select Meeting Date" Value="-1" />
                            </asp:DropDownList>
                     </td> 
                        <td>
                        <asp:Button ID="btnMeetingDateGo" runat="server" Text="Select" 
                                onclick="btnMeetingDateGo_Click" />
                     </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblReqEventMeetingTime" runat="server">Select Meeting Time </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlReqEventMeetingTime" runat="server" 
                                AppendDataBoundItems="True" width="300px" Enabled = "False">
                            <asp:ListItem Text="Select Meeting Time" Value="-1" />
                            </asp:DropDownList>
                     </td>  
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblStudent1" runat="server">Student1 </asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="txtStudent1" runat="server" ForeColor="#999999" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>                            
                            <asp:Label ID="lblStudent2" runat="server">Student2 </asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="txtStudent2" runat="server" 
                               ForeColor="#999999" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnReqEventAttendedCancel" runat="server" Text="Cancel" 
                                onclick="btnReqEventAttendedCancel_Click" CausesValidation="False">
                            </asp:Button>
                            <asp:Button ID="btnReqEventAttendedSubmit" runat="server" 
                                OnClick="btnReqEventAttendedSubmit_Click" Text="Save" />
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                </ContentTemplate>
                              
                 
             </asp:TabPanel>               
                
             </asp:TabContainer>
                
 

            </ContentTemplate>
            
 

        </asp:TabPanel>
        <asp:TabPanel ID="tabPanelComments" runat="server" HeaderText="Comments" Font-Bold="false" Width="100%">
            <ContentTemplate>
                <table width="100%">
                   <tr>
                        <td valign = "top" width="20%">
                            <asp:Label ID="lblEnterComments" runat="server">Comments </asp:Label>
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="txtComments" Runat="server" TextMode="MultiLine" 
                                CssClass="largeTextbox" ForeColor="Black" Height="140px" Width="90%"/>
                        </td>
                    </tr>
                   <tr>
                        <td colspan="2" width="100%">
                            <table>
                                <tr>
                                    <td align="center" style="width:250px">
                                        <asp:Button ID="btnBackComments" runat="server" OnClick="btnBack_Click" 
                                            Text="Back" CausesValidation="False" />
                                        <asp:Button ID="btnCancelComments0" runat="server" 
                                            OnClick="btnCancelComments_Click" Text="Cancel" CausesValidation="False" />
                                        <asp:Button ID="btnSubmit0" runat="server" OnClick="btnSubmit_Click" 
                                            Text="Add Comment" CausesValidation="False" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                   <tr>
                    <td colspan="2">
                        <asp:GridView ID="grdComments" runat="server" 
                            EnableSortingAndPagingCallbacks="True" onsorting="grdComments_Sorting" 
                            AllowSorting="True" Width="100%" Font-Bold="False">
                        </asp:GridView>
                    </td>
                    </tr>

                    
                    

                </table>  
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
    <asp:Button ID="btnCanelAll" runat="server" Text="Cancel"  Visible="false" 
        onclick="btnCanelAll_Click" CausesValidation="False"/>
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
</asp:Content>