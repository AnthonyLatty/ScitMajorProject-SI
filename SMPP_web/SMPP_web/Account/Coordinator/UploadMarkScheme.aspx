<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UploadMarkScheme.aspx.cs" Inherits="SMPP_web.Account.Coordinator.UploadMarkScheme" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <div class="form-horizontal">
        <br />
        <br />
        <h4>Upload a MarkScheme</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
        <p>
            <asp:Label runat="server" ID="txtSuccess" CssClass="text-success" />
        </p>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-2 control-label">MarkScheme to be uploaded </asp:Label>
                    <div class="col-md-7">
                        <asp:FileUpload ID="MarkSchemeFileUpload" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2">
                        <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="TitleTxtbx" runat="server"></asp:TextBox>
                    </div>                

                </div>

                <asp:Button ID="BtnUploadMarkScheme" runat="server" Text="Upload MarkScheme" CssClass="btn btn-success" OnClick="BtnUploadMarkScheme_Click" />
            </div>
        </div>
    </div>

</asp:Content>