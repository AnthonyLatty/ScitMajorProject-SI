<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="SMPP_web.Account.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="table-responsive" style="margin-top:5%;">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"></asp:GridView>
    </div>
</asp:Content>
