<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorView.aspx.cs" Inherits="AbsTech.WebScreen.DoctorView" MasterPageFile="~/WebScreen/DicomViewer.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdateProgress ID="updtProgressPnlMain" AssociatedUpdatePanelID="updtPnlMain" runat="server">
        <ProgressTemplate>
            <div class="divWaiting" style="padding-top: 20%;">
                <center>
                    <div>
                        <h3>
                            <asp:Label ID="lblWait" runat="server" Text="Please wait..." CssClass="label text-midnight-blue" /></h3>
<img src="../Images/ajax-loader.gif" alt="Loading..."/>
                    </div>
                </center>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="updtPnlMain" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-md-2">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-folder-close"></span>Filter</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <span class="glyphicon glyphicon-pencil text-primary"></span><a href="http://www.jquery2dotnet.com">Articles</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="glyphicon glyphicon-flash text-success"></span><a href="http://www.jquery2dotnet.com">News</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="glyphicon glyphicon-file text-info"></span><a href="http://www.jquery2dotnet.com">Newsletters</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span class="glyphicon glyphicon-comment text-success"></span><a href="http://www.jquery2dotnet.com">Comments</a>
                                                    <span class="badge">42</span>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9 col-md-10">
                        <div class="well">
                            <div class="form-group row">
                                <div class="col-xs-2">
                                    <asp:TextBox ID="txtPatientId" CssClass="form-control" runat="server" placeholder="Patient Id"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:TextBox ID="txtPatientName" CssClass="form-control" runat="server" placeholder="Patient Name"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:TextBox ID="txtCentre" CssClass="form-control" runat="server" placeholder="Centre"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" placeholder="Description"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:TextBox ID="txtDateFrom" CssClass="form-control" runat="server" placeholder="From"></asp:TextBox>
                                </div>
                                <div class="col-xs-2">
                                    <asp:TextBox ID="txtDateTo" CssClass="form-control" runat="server" placeholder="To"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                
                                <div class="col-xs-2">
                                    <asp:Button ID="btnSearch" CssClass="form-control btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click"></asp:Button>
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnReset" CssClass="form-control btn btn-primary" runat="server" Text="Reset" OnClick="btnReset_Click"></asp:Button>
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnToday" CssClass="form-control btn btn-primary" runat="server" Text="Today" OnClick="btnToday_Click"></asp:Button>
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnYesterday" CssClass="form-control btn btn-primary" runat="server" Text="Yesterday" OnClick="btnYesterday_Click"></asp:Button>
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnLastWeek" CssClass="form-control btn btn-primary" runat="server" Text="Last Week" OnClick="btnLastWeek_Click"></asp:Button>
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnThisMonth" CssClass="form-control btn btn-primary" runat="server" Text="This Month" OnClick="btnThisMonth_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="Button" OnClick="btn_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
