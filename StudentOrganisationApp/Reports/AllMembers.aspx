<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllMembers.aspx.cs" MasterPageFile="~/Shared/Site.Master" Inherits="StudentOrganisationApp.Reports.AllMembers" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <table style="width:100%;height:100%">
        <tr>
            <td colspan="5">
                <asp:Label runat="server">This report will list all active student members.</asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5"></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblclassof" runat="server" Text="Classification"></asp:Label>
            </td>
            <td>
                <asp:DropDownList class="form-control" clientidMode="Static" ID="cl_list" runat="server" name="cl_list" AutoPostBack="true"
                RepeatDirection="Vertical" RepeatLayout="Table" OnSelectedIndexChanged="cl_list_SelectedIndexChanged">
                    <asp:ListItem Value="FR">Freshmen</asp:ListItem>
                    <asp:ListItem Value="FF">First-Time Freshmen</asp:ListItem>
                    <asp:ListItem Value="SO">Sophomores</asp:ListItem>
                    <asp:ListItem Value="JR">Juniors</asp:ListItem>
                    <asp:ListItem Value="SR">Seniors</asp:ListItem>
                    <asp:ListItem Value="GR">Graduate Students</asp:ListItem>
                    <asp:ListItem Value="S">Special</asp:ListItem>
                    <asp:ListItem Value="UN">Unknown</asp:ListItem>
                    <asp:ListItem Selected="True" Value="**">All</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblliving" runat="server" Text="On Campus"></asp:Label>
            </td>
            <td>
                <asp:DropDownList class="form-control" clientidMode="Static" ID="living_list" runat="server" name="living_list" AutoPostBack="true"
                RepeatDirection="Vertical" RepeatLayout="Table" OnSelectedIndexChanged="living_list_SelectedIndexChanged">
                    <asp:ListItem Value="Y">On-Campus</asp:ListItem>
                    <asp:ListItem Value="N">Off-Campus</asp:ListItem>
                    <asp:ListItem Selected="True" Value="B">All</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblrace" runat="server" Text="Ethnicity/Race"></asp:Label>
            </td>
            <td>
                <asp:DropDownList class="form-control" clientidMode="Static" ID="race_list" runat="server" name="race_list" AutoPostBack="true"
                RepeatDirection="Vertical" RepeatLayout="Table" OnSelectedIndexChanged="race_list_SelectedIndexChanged">
                    <asp:ListItem Value="American Indian/Alaskan Native">American Indian/Alaskan Native</asp:ListItem>
                    <asp:ListItem Value="Asian">Asian</asp:ListItem>
                    <asp:ListItem Value="Black/African American">Black/African American</asp:ListItem>
                    <asp:ListItem Value="Hispanic">Hispanic</asp:ListItem>
                    <asp:ListItem Value="Non-Resident Foreign">Non-Resident Foreign</asp:ListItem>
                    <asp:ListItem Value="Native Hawaiian/Other Pacific Islander">Native Hawaiian/Other Pacific Islander</asp:ListItem>
                    <asp:ListItem Value="Two or More Races">Two or More Races</asp:ListItem>
                    <asp:ListItem Value="Unknown/Undecided">Unknown/Undecided</asp:ListItem>
                    <asp:ListItem Value="White">White</asp:ListItem>
                    <asp:ListItem Selected="True" Value="*ALL*">All</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblintl" runat="server" Text="International"></asp:Label>
            </td>
            <td>
                <asp:DropDownList class="form-control" clientidMode="Static" ID="intl_list" runat="server" name="intl_list" AutoPostBack="true"
                RepeatDirection="Vertical" RepeatLayout="Table" OnSelectedIndexChanged="intl_list_SelectedIndexChanged">
                    <asp:ListItem Value="Y">International</asp:ListItem>
                    <asp:ListItem Value="N">Domestic</asp:ListItem>
                    <asp:ListItem Selected="True" Value="B">All</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <table style="width:100%;height:100%">
        <tr>
            <td>
                <asp:Button ID="btnExport" runat="server" Text="Export To Excel" onclick="btnExport_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbl_count"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView AutoGenerateColumns="false" AllowSorting="true" ID="grdReport" runat="server">
                    <Columns>
                        <asp:BoundField DataField="Term" Headertext="Term" ControlStyle-Width="5%"/>       
                        <asp:BoundField DataField="OrganizationName" Headertext="Organization" ControlStyle-Width="15%"/>       
                        <asp:BoundField DataField="MemberName" Headertext="Member Type" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="Carroll_ID" Headertext="Carroll ID" ControlStyle-Width="5%"/>
                        <asp:BoundField DataField="FirstName" Headertext="First Name" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="LastName" Headertext="Last Name" ControlStyle-Width="15%"/>
                        <asp:BoundField DataField="Email" Headertext="Email" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="ClassOf" Headertext="Class Of" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="LivesOnCampus" Headertext="On Campus?" ControlStyle-Width="5%"/>
                        <asp:BoundField DataField="Race" Headertext="Race" ControlStyle-Width="10%"/>
                        <asp:BoundField DataField="IntlStudent" Headertext="International" ControlStyle-Width="5%"/>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>