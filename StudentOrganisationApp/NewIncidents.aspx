<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Shared/Site.Master" CodeBehind="NewIncidents.aspx.cs" Inherits="StudentOrganisationApp.Incidents.CreateIncidents" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
<div>
<table style="width:100%; height:100%">
<tr>
<td>
      <asp:TabContainer ID="tabContainerNewIncident" runat="server" 
          ActiveTabIndex="0" Font-Bold="true"
       style="margin-bottom: 0px" Width="100%">       
         <asp:TabPanel ID="tabPanelNewIncident" runat="server" HeaderText="Incident" Font-Bold="false">     
            <ContentTemplate>
            <table width="100%">
            <tr>
                <td align="left" width="100%">
                <asp:Panel ID="pnlIncident" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Incident" Width="100%" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                <tr>
                    <td width="20%">
                        <asp:Label ID="lblNewIncidentDate" runat="server">Date </asp:Label>
                    </td>
                    <td width="30%">
                        <div ID="divcalNewIncidentDate" style="display:none;">
                            <asp:CalendarExtender ID="calNewIncidentDate" runat="server" Enabled="True" 
                                Format="MM/dd/yyyy" PopupButtonID="imgNewIncidentDate" 
                                TargetControlID="txtNewIncidentDate">
                            </asp:CalendarExtender>
                        </div>
                        <asp:TextBox ID="txtNewIncidentDate" runat="server" contenteditable="false" 
                            Width="100pt" ForeColor="Black" ></asp:TextBox>
                        <asp:ImageButton ID="imgNewIncidentDate" runat="server" 
                            CausesValidation="False" Height="16px" ImageUrl="~/Images/calender.bmp" 
                            Width="16px" />
                    </td>
                    <td width="20%">
                        <asp:Label ID="lblNewIncidentTime" runat="server">Time </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewIncidentTime" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>                   
                    <td>
                        <asp:RegularExpressionValidator ID="revtime" runat="server" 
                            ControlToValidate="txtNewIncidentTime" 
                            ErrorMessage="Please enter time in a correct format e.g. 11:30 am or 02:45 PM" ForeColor="Red" 
                            ValidationExpression="^ *(1[0-2]|[1-9]):[0-5][0-9] *(a|p|A|P)(m|M) *$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>                   
                    <td width="20%">
                        <asp:Label ID="lblNewIncidentDateReported" runat="server">Date Reported </asp:Label>
                    </td>                        
                    <td width="30%">
                       <div id="divcalNewIncidentDateReported" style="display:none;">
                           <asp:CalendarExtender ID="calNewIncidentDateReported" runat="server" 
                               TargetControlID="txtNewIncidentDateReported" PopupButtonID="imgNewIncidentDateReported" 
                               Format="MM/dd/yyyy" Enabled="True" />
                        </div>
                        <asp:TextBox ID="txtNewIncidentDateReported" Runat="server" width="100pt" 
                            contenteditable="false" ForeColor="Black" />
                        <asp:ImageButton ID="imgNewIncidentDateReported" Width="16px" Height="16px" 
                            runat="server" ImageUrl="~/Images/calender.bmp" CausesValidation="False" />
                        
                    </td>
                    <td width="20%">
                         <asp:Label ID="lblNewIncidentReportedBy" runat="server">Reported By </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewIncidentReportedBy" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>     
                <tr>
                 <td width="20%">
                        <asp:Label ID="lblNewIncidentLocation" runat="server">Location </asp:Label>
                    </td>
                    <td width="30%">
                        <asp:TextBox ID="txtNewIncidentLocation" runat="server" ForeColor="Black"></asp:TextBox>
                    </td>
                </tr>
           
                </table>
                </asp:Panel>
                </td>
            </tr>
            <tr>
                <td align="left" width="100%">
                <asp:Panel ID="pnlPeopleInvolved" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="People Involved" Width="100%" 
                        Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                <tr>
                <td style="text-decoration: underline">
                    <asp:Label ID="lblMembers" runat="server">Members </asp:Label>
                    </td>
                </tr>
                <tr>                   
                    <td colspan="2">
                        <asp:DropDownList ID="ddlOrganization" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged" 
                            Width="150pt" ForeColor="Black">
                            <asp:ListItem Text="Select Organization" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                                <td colspan="2">
                                    <asp:DropDownList  AppendDataBoundItems="True" ID="ddlSearchMember" 
                                        runat="server" width = '150pt' ForeColor="Black">
                                        <asp:ListItem Text="Select For Member" Value="-1" />
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btnAddMember" runat="server" Text="Add Member" 
                                        onclick="btnAddMember_Click1" />
                                </td>
                            </tr> 
                <tr>                     
                    <td colspan="3">
                        <asp:GridView ID="grdPplInvolved" runat="server" 
                            onrowdeleted="grdPplInvolved_RowDeleted" 
                            onrowdeleting="grdPplInvolved_RowDeleting" 
                            onrowdatabound="grdPplInvolved_RowDataBound" AutoGenerateColumns="False" 
                            Width="100%" Font-Bold="False">
                            <Columns>
                                <asp:BoundField DataField="LastName" Headertext="LastName"/>
                                <asp:BoundField DataField="FirstName" Headertext="FirstName"/>
                                <asp:BoundField DataField="Position" Headertext="Position" />
                                <asp:CommandField ButtonType="Button" HeaderText="Remove" 
                                    ShowDeleteButton="True" ShowHeader="True" DeleteText="Remove" />
                                     <asp:BoundField DataField="Student_ID" Headertext="Student_ID" />
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
                                    <asp:Button ID="btnAddNonMember" runat="server" Text="Add Non Member" onclick="btnAddNonMember_Click" 
                                        />
                                </td>
                            </tr> 
                <tr>                     
                    <td colspan="3">
                        <asp:GridView ID="grdNonMembersInvolved" runat="server" onrowdeleting="grdNonMembersInvolved_RowDeleting"                            
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
                <td align="left" width="100%">
                <asp:Panel ID="pnlDetils" runat="server" BorderColor="#CCCCCC" Height= "100%"
                 HorizontalAlign="Left" GroupingText="Details" Width="100%" Font-Bold="False">
                <table style="background: #CCCCCC; width:100%; height:100%">
                <tr>
                    <td valign="top">
                        <asp:Label ID="lblIncident" runat="server">Incident </asp:Label>
                    </td>                        
                    <td width="80%">
                        <asp:TextBox ID="txtincident" runat="server"  ForeColor="Black" 
                            TextMode="MultiLine" CssClass="largeTextbox" Height="100px" Width="90%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Label ID="lblFollowUp" runat="server" >Follow Up </asp:Label>
                    </td>                        
                    <td width="80%">
                        <asp:TextBox ID="txtFollowUp" runat="server"  ForeColor="Black" 
                            TextMode="MultiLine" CssClass="largeTextbox" Height="100px" Width="90%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
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
            <td width="100%">
            <table>
            <tr>
                    <td>
                        <asp:Button ID="btnCanel" runat="server" Text="Cancel" 
                            onclick="btnCanel_Click" CausesValidation="False" />
                    </td>                        
                    <td >
                        <asp:Button ID="btnContinueNewIncident" runat="server" Text="Continue" onclick="btnContinue_Click"/>
                    </td>
                </tr>
                </table>
                </td>
                </tr>                
            </table>
        </ContentTemplate>
          </asp:TabPanel>
         <asp:TabPanel ID="tabPanelComments" runat="server" HeaderText="Comments" Font-Bold="False">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td valign = "top" width="20%">
                            <asp:Label ID="lblEnterComments" runat="server" >Comments </asp:Label>
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" 
                                CssClass="largeTextbox" ForeColor="Black" Height="200px" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <table>
                         
                        <tr>
                        <td align="center" width="100%">
                            <asp:Button ID="btnBackComments" runat="server" OnClick="btnBack_Click" 
                                Text="Back" />
                            <asp:Button ID="btnCancelComments0" runat="server" 
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
      <asp:ValidationSummary ID="vs1" runat="server" DisplayMode="BulletList" 
        ForeColor="Red" ShowMessageBox="false" ShowSummary="true" Width="600pt" />
      </td>
     </tr> 
</table>
</div>
</asp:Content>
