<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Shared/Site.Master" CodeBehind="MainPage.aspx.cs" Inherits="StudentOrganisationApp.MainPage" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="mainContent" runat="server">
    <div align="center">
        <asp:Label ID="lblMainWelcome" runat="server" Text="Welcome to the Student Organization Administrative application." ></asp:Label>
    </div>
</asp:Content>
