<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibrarianDashboard.aspx.cs" Inherits="SMPP_web.Account.Librarian.LibrarianDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal" style="margin-top: 5%;">
        <h4>Upload a project</h4>
        <hr />
        <div class="row" style="margin-bottom: 2%;">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="TitleTxtbx" CssClass="col-md-2 control-label">Title </asp:Label>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="TitleTxtbx" CssClass="form-control" />
                    <asp:RequiredFieldValidator ValidationGroup="Lib" ID="RequiredFieldValidator1" runat="server" ControlToValidate="TitleTxtbx"
                        CssClass="text-danger" ErrorMessage="The title field is required." />
                </div>
            </div>
        </div>
        <div class="row" style="margin-bottom: 2%;">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="DateTxtbx" CssClass="col-md-2 control-label">Date </asp:Label>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="DateTxtbx" CssClass="form-control" />
                </div>
            </div>
        </div>

    </div>
    <div class="row" style="margin-bottom: 2%; margin-left: 9em;">
        <div class="col-md-5">
            <asp:FileUpload ID="ProjectFileUpload" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-5" style="margin-left: 10em;">
            <asp:Button ID="UploadBtn" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="UploadBtn_Click" />
        </div>
    </div>

</asp:Content>
