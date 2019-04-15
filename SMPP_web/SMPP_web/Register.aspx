<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SMPP_web.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new student account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">User Account</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-3 control-label">Email</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                        CssClass="text-danger" ErrorMessage="The email field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 control-label">Password</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                        CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-3 control-label">Confirm password</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Student Account Information</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtIDNumber" CssClass="col-md-3 control-label">ID No.</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtIDNumber" CssClass="form-control" TextMode="Number" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtIDNumber"
                                        CssClass="text-danger" ErrorMessage="The ID number field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-3 control-label">First Name</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName"
                                        CssClass="text-danger" ErrorMessage="The first name field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-3 control-label">Last Name</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName"
                                        CssClass="text-danger" ErrorMessage="The last name field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtAddress" CssClass="col-md-3 control-label">Address</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" TextMode="MultiLine" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress"
                                        CssClass="text-danger" ErrorMessage="The address field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlFaculty" CssClass="col-md-3 control-label">Faculty</asp:Label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlFaculty" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Please select a Faculty</asp:ListItem>
                                        <asp:ListItem Value="1">College of Health Sciences (COHS)</asp:ListItem>
                                        <asp:ListItem Value="2">College of Business and Management (COBAM)</asp:ListItem>
                                        <asp:ListItem Value="3">Faculty of Education and Liberal Studies (FELS)</asp:ListItem>
                                        <asp:ListItem Value="4">Faculty of The Built Environment (FOBE)</asp:ListItem>
                                        <asp:ListItem Value="5">Faculty of Engineering and Computing (FENC)</asp:ListItem>
                                        <asp:ListItem Value="6">Faculty of Law (FOL)</asp:ListItem>
                                        <asp:ListItem Value="7">Faculty of Science and Sport (FOSS)</asp:ListItem>
                                        <asp:ListItem Value="8">Joint Colleges of Medicine, Oral Health & Veterinary Sciences</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="ddlFaculty"
                                        CssClass="text-danger" ErrorMessage="The faculty field is required." />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="panel panel-primary">
            <div class="panel-heading">Group Information</div>
            <div class="panel-body">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtGroupName" CssClass="col-md-3 control-label">Group Name</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="txtGroupName" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGroupName"
                            CssClass="text-danger" ErrorMessage="The group name field is required." />
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Sign up for online access" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
</asp:Content>
