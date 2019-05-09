<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Syllabus.aspx.cs" Inherits="SMPP_web.Account.Student.Syllabus" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="container" style="margin-top:5%;">
        <div class="row">
            <div class="col-md-12">
                <br />  
                <h4>Available Syllabi</h4>
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                <asp:TemplateField HeaderText="Syllabus">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Syllabus") %>' CommandName="SYLL" Text='<%# Eval("Syllabus") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mark Scheme">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Mark Scheme") %>' CommandName="MS" Text='<%# Eval("Mark Scheme") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                </asp:GridView>
            </div>
            <div class="row">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
