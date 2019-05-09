<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="SMPP_web.Account.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:5%">
        <h4>Search for projects</h4>
        <hr />
        <div class="col-md-6">
            <asp:TextBox ID="SearchTxtbx" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-6">
            <asp:Button ID="SearchBtn" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="SearchBtn_Click"/>
            <asp:Button ID="ViewAll" runat="server" Text="View All" CssClass="btn btn-primary" OnClick="ViewAll_Click"/>
        </div>
    </div>
    <div class="table-responsive" style="margin-top:5%;">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Title") %>' CommandName="Download" Text='<%# Eval("Title") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Date" HeaderText="Academic Year" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
