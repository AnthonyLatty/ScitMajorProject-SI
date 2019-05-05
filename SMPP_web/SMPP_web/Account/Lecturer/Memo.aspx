<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Memo.aspx.cs" Inherits="SMPP_web.Account.Lecturer.Memo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top:5%;">
        <h4>Create a memo</h4>
        <hr />
        <div class="row">
            <div class="col-md-6">
                <h6>Select a group</h6>
                <hr />
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" ></asp:ListBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListBox1" ErrorMessage="Please select a group!" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6">
                <h6>Enter memo</h6>
                <hr />
                <asp:TextBox ID="MemoTxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <asp:Button ID="SubmitBtn" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="SubmitBtn_Click"/>
        </div>
    </div>
</asp:Content>
