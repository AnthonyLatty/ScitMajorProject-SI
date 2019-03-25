<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SMPP_web._Default" %>



<asp:Content ID="BannerContent" ContentPlaceHolderID="BannerContent" runat="server">
    <img class="home-banner" src="Images/SMPP_header_2.jpg" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row" style="text-align: center">
            <div class="col-md-4">
                <h2>Get Help 24/7</h2>
                <p>With the Scit Major project Portal (SMPP), get guided help when doing your major project.</p>
            </div>
            <div class="col-md-4">
                <h2>Free Samples</h2>
                <p>Examine previous major project samples to know if you are on the right track.</p>
            </div>
            <div class="col-md-4">
                <h2>Always Free</h2>
                <p>Scit Major Project Portal (SMPP) is always free to valid UTech students undergoing his/her studies.</p>
            </div>
        </div>
    </div>
</asp:Content>
