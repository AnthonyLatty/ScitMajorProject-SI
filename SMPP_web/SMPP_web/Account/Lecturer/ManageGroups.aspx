<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageGroups.aspx.cs" Inherits="SMPP_web.Account.Lecturer.ManageGroups" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top:5%;">
        <h4>View group members</h4>
        <hr />
        <div class="row">
            
            <div class="col-md-6">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            </div>
            <div class="col-md-6">
                <asp:ListBox ID="ListBox2" runat="server"></asp:ListBox>
            </div>
        </div>
        <div class="row" style="margin-top:5%;">
            <asp:Button ID="superviseBtn" runat="server" Text="Supervise" CssClass="btn btn-primary" OnClick="superviseBtn_Click" Visible="false"/>
            <asp:Button ID="notSuperviseBtn" runat="server" Text="Don't Supervise" CssClass="btn btn-danger" OnClick="notSuperviseBtn_Click" Visible="false"/>
        </div>
    </div>
</asp:Content>
