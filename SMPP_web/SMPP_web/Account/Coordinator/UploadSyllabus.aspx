<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UploadSyllabus.aspx.cs" Inherits="SMPP_web.Account.Coordinator.UploadSyllabus" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <div class="form-horizontal">
        <br />
        <br />
        <h4>Upload a Syllabus</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
        <p>
            <asp:Label runat="server" ID="txtSuccess" CssClass="text-success" />
        </p>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtTitle" CssClass="col-md-2 control-label">Syllabus Title </asp:Label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" />
                        <asp:RequiredFieldValidator ValidationGroup="Lib" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                            CssClass="text-danger" ErrorMessage="The title field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-2 control-label">Associated MarkScheme ID </asp:Label>
                    <div class="col-md-7">
                        <asp:DropDownList ID="ddlMarkScheme" runat="server" DataSourceID="ddlGetMarkSchemeIdSqlDataSource" DataTextField="MarkSchemeId" DataValueField="MarkSchemeId"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="ddlGetMarkSchemeIdSqlDataSource" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [MarkSchemeId], [FilePath] FROM [MarkSchemes]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtDate" CssClass="col-md-2 control-label">Date </asp:Label>
                    <div class="col-md-7">
                        <asp:TextBox runat="server" ID="txtDate" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-2 control-label">File to be uploaded </asp:Label>
                    <div class="col-md-7">
                        <asp:FileUpload ID="SyllabusFileUpload" runat="server" />
                    </div>
                </div>

                <asp:Button ID="BtnUploadSyllabus" runat="server" Text="Upload Syllabus" CssClass="btn btn-success" OnClick="BtnUploadSyllabus_Click" />
            </div>
        </div>
    </div>

</asp:Content>
