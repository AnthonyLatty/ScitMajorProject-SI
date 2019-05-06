<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Grades.aspx.cs" Inherits="SMPP_web.Account.Coordinator.Grades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top:5%;">
        <div class="row">
            <div class="col-md-6">
                <h4>Select group</h4>
                <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
            </div>
            <div class="col-md-6">
                <h4>Enter grade</h4>
                <asp:TextBox ID="GradeTxtbx" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <asp:Button ID="SubmitBtn" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitBtn_Click"/>
        </div>
    </div>
</asp:Content>
