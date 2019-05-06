<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="SMPP_web.Account.Coordinator.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 5%;">
        <div class="row">
            <h4>Meeting Statistics</h4>
            <hr />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"></asp:GridView>
        </div>
        <div class="row">
            <h4>Group Grades</h4>
            <hr />
            <asp:GridView ID="GridView2" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"></asp:GridView>
        </div>
        <div class="row">
            <h4>Groups & Supervisors</h4>
            <hr />
            <asp:GridView ID="GridView3" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="true"></asp:GridView>
        </div>
    </div>
</asp:Content>
