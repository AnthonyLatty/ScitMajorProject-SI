<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SMPP_web.Account.Admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BannerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div id="adminContent">
        <div>
            <ul class="nav nav-tabs nav-justified">
                <li role="presentation" class="active">
                    <a data-toggle="tab" href="#nav-librarian">Librarian</a>
                </li>
                <li role="presentation">
                    <a data-toggle="tab" href="#nav-lecturer">Lecturer</a>
                </li>
                <li role="presentation">
                    <a data-toggle="tab" href="#nav-coordinator">Coordinator</a>
                </li>
            </ul>
        </div>
        <asp:Label runat="server" ID="errLBL"></asp:Label>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade in active" id="nav-librarian" role="tabpanel" aria-labelledby="nav-librarian-tab">
                <div class="form-horizontal">
                    <h4>Create a new Librarian</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EmailLibTxtbx" CssClass="col-md-2 control-label">Email </asp:Label>
                                <div class="col-md-7">
                                    <asp:TextBox runat="server" ID="EmailLibTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Lib" ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmailLibTxtbx"
                                        CssClass="text-danger" ErrorMessage="The Email field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="FirstNameLibTxtbx" CssClass="col-md-2 control-label">First Name</asp:Label>
                                <div class="col-md-7">
                                    <asp:TextBox runat="server" ID="FirstNameLibTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Lib" ID="LibFnameVal" runat="server" ControlToValidate="FirstNameLibTxtbx"
                                        CssClass="text-danger" ErrorMessage="The first name field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="LastNameLibTxtbx" CssClass="col-md-2 control-label">Last Name</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="LastNameLibTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Lib" ID="LibLnameVal" runat="server" ControlToValidate="LastNameLibTxtbx"
                                        CssClass="text-danger" ErrorMessage="The last name field is required." />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" Text="Register" ID="RegisterLibrarianBtn" CssClass="btn btn-success" CausesValidation="true" OnClick="RegisterLibrarianBtn_Click" ValidationGroup="Lib" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="nav-lecturer" role="tabpanel" aria-labelledby="nav-lecturer-tab">
                <div class="form-horizontal">
                    <h4>Create a new Lecturer</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EmailLecTxtbx" CssClass="col-md-2 control-label">Email</asp:Label>
                                <div class="col-md-7">
                                    <asp:TextBox runat="server" ID="EmailLecTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Lect" ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailLecTxtbx"
                                        CssClass="text-danger" ErrorMessage="The Email field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="FirstNameLectTxtbx" CssClass="col-md-2 control-label">First Name</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="FirstNameLectTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Lect" ID="LectFnameVal" runat="server" ControlToValidate="FirstNameLectTxtbx"
                                        CssClass="text-danger" ErrorMessage="The first name field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="LastNameLectTxtbx" CssClass="col-md-2 control-label">Last Name</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="LastNameLectTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Lect" ID="LectLnameVal" runat="server" ControlToValidate="LastNameLectTxtbx"
                                        CssClass="text-danger" ErrorMessage="The last name field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlFaculty" CssClass="col-md-2 control-label">Faculty</asp:Label>
                                    <div class="col-md-10">
                                        <asp:DropDownList ID="ddlFaculty" runat="server" CssClass="form-control">
                                            <asp:ListItem>Please select a Faculty</asp:ListItem>
                                            <asp:ListItem Value="1" Text="College of Health Sciences (COHS)"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="College of Business and Management (COBAM)"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Faculty of Education and Liberal Studies (FELS)"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Faculty of The Built Environment (FOBE)"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Faculty of Engineering and Computing (FENC)"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Faculty of Law (FOL)"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Faculty of Science and Sport (FOSS)"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="Joint Colleges of Medicine, Oral Health & Veterinary Sciences"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Lect" ControlToValidate="ddlFaculty"
                                            CssClass="text-danger" ErrorMessage="The faculty field is required." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="OfficeExtLectTextbx" CssClass="col-md-2 control-label">Office Extension</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="OfficeExtLectTextbx" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Lect" ControlToValidate="OfficeExtLectTextbx"
                                            CssClass="text-danger" ErrorMessage="The office extension field is required." />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="OfficeLectTextbx" CssClass="col-md-2 control-label">Office</asp:Label>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="OfficeLectTextbx" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Lect" ControlToValidate="OfficeLectTextbx"
                                            CssClass="text-danger" ErrorMessage="The office name field is required." />

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" Text="Register" ID="RegisterLecturerBtn" CssClass="btn btn-success" CausesValidation="true" ValidationGroup="Lect" OnClick="RegisterLecturerBtn_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="nav-coordinator" role="tabpanel" >
                <div class="form-horizontal">
                    <h4>Create a new Coordinator</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="EmailCoordTxtbx" CssClass="col-md-2 control-label">Email </asp:Label>
                                <div class="col-md-5">
                                    <asp:TextBox runat="server" ID="EmailCoordTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Coor" ID="RequiredFieldValidator3" runat="server" ControlToValidate="EmailCoordTxtbx"
                                        CssClass="text-danger" ErrorMessage="The Email field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="FirstNameCoorTxtbx" CssClass="col-md-2 control-label">First Name</asp:Label>
                                <div class="col-md-5">
                                    <asp:TextBox runat="server" ID="FirstNameCoorTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Coor" ID="CoorFnameVal" runat="server" ControlToValidate="FirstNameCoorTxtbx"
                                        CssClass="text-danger" ErrorMessage="The first name field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="LastNameCoorTxtbx" CssClass="col-md-2 control-label">Last Name</asp:Label>
                                <div class="col-md-5">
                                    <asp:TextBox runat="server" ID="LastNameCoorTxtbx" CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="Coor" ID="CoorLnameVal" runat="server" ControlToValidate="LastNameCoorTxtbx"
                                        CssClass="text-danger" ErrorMessage="The last name field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" Text="Register" ID="RegisterCoorBtn" CssClass="btn btn-success" CausesValidation="true" ValidationGroup="Coor" OnClick="RegisterCoorBtn_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
