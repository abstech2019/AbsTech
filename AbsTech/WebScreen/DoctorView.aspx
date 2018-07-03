<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorView.aspx.cs" Inherits="AbsTech.WebScreen.DoctorView" MasterPageFile="~/WebScreen/DicomViewer.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/DoctorView.css" rel="stylesheet" />
    <link href="../Content/DataTables-1.10.6/extensions/TableTools/css/dataTables.tableTools.min.css" rel="stylesheet" />
    <link href="../Content/DataTables-1.10.6/extensions/TableTools/css/dataTables.tableTools.min.css"
        rel="stylesheet" type="text/css" />
    <link href="../Content/DataTables-1.10.6/extensions/ColVis/css/dataTables.colVis.css"
        rel="stylesheet" type="text/css" />
    <link href="../Content/DataTables-1.10.6/extensions/ColVis/css/dataTables.colvis.jqueryui.css"
        rel="stylesheet" type="text/css" />
    <link href="../Content/DataTables-1.10.6/extensions/ColReorder/css/dataTables.colReorder.min.css"
        rel="stylesheet" type="text/css" />
    <link href="../Content/DataTables-1.10.6/extensions/Scroller/css/dataTables.scroller.min.css"
        rel="stylesheet" type="text/css" />
    <link href="../Content/DataTables-1.10.6/extensions/Responsive/css/dataTables.responsive.css" rel="stylesheet" />
    <script type="text/javascript">
        function pageLoad(sender, args) {
            initializeFormControls();
        };
        function initializeFormControls() {
            initializeDateTimePicker();
        }
        function initializeDateTimePicker() {

            var today = new Date();
            //today.setMonth(today.getMonth() + 2);
            $(".simpleDatePicker").datetimepicker({
                format: 'dd M yyyy',
                minView: 2,
                autoclose: true,
                todayBtn: false,
                pickerPosition: "bottom-left",
                endDate: today
            });

            //dateTimePicker
            $(".dateTimePicker").datetimepicker({
                format: 'dd M yyyy HH:ii P',
                autoclose: true,
                todayBtn: false,
                pickerPosition: "bottom-left",
                endDate: today
            });

            //monthPicker
            $(".monthPicker").datetimepicker({
                format: 'M yyyy',
                minView: 3,
                startView: 3,
                autoclose: true,
                todayBtn: false,
                pickerPosition: "bottom-left"
            });

            //yearPicker
            $(".yearPicker").datetimepicker({
                format: 'yyyy',
                minView: 4,
                startView: 4,
                autoclose: true,
                todayBtn: false,
                pickerPosition: "bottom-left"
            });
        };
    </script>
    <script src="../Scripts/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables-1.10.6/media/js/jquery.dataTables.min.js"></script>
    <script src="../Scripts/DataTables-1.10.6/extensions/TableTools/js/dataTables.tableTools.min.js"
        type="text/javascript"></script>
    <script src="../Scripts/DataTables-1.10.6/extensions/Responsive/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables-1.10.6/media/js/ColumnFilter.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables-1.10.6/extensions/ColVis/js/dataTables.colVis.min.js"></script>
    <script src="../Scripts/DataTables-1.10.6/extensions/ColReorder/js/dataTables.colReorder.min.js"
        type="text/javascript"></script>
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
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><i class="fa fa-folder-open"></i>Filter</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="checkbox">
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox1">
                                                <label for="inlineCheckbox1">All</label>
                                            </div>
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox2" checked="">
                                                <label for="inlineCheckbox2">CR</label>
                                            </div>
                                        </div>
                                        <div class="checkbox">
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox3" checked="">
                                                <label for="inlineCheckbox3">ES</label>
                                            </div>
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox4">
                                                <label for="inlineCheckbox4">NM</label>
                                            </div>
                                        </div>
                                        <div class="checkbox">
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox5">
                                                <label for="inlineCheckbox5">RF</label>
                                            </div>
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox6" checked="">
                                                <label for="inlineCheckbox6">US</label>
                                            </div>
                                        </div>
                                        <div class="checkbox">
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox7" checked="">
                                                <label for="inlineCheckbox7">CT</label>
                                            </div>
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox8">
                                                <label for="inlineCheckbox8">MG</label>
                                            </div>
                                        </div>
                                        <div class="checkbox">
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox9">
                                                <label for="inlineCheckbox9">OT</label>
                                            </div>
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox10" checked="">
                                                <label for="inlineCheckbox10">RT</label>
                                            </div>
                                        </div>
                                        <div class="checkbox">
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox11" checked="">
                                                <label for="inlineCheckbox11">XA</label>
                                            </div>
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox12">
                                                <label for="inlineCheckbox12">DX</label>
                                            </div>
                                        </div>
                                        <div class="checkbox">
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox13">
                                                <label for="inlineCheckbox13">MR</label>
                                            </div>
                                            <div class="checkbox checkbox-success checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox14" checked="">
                                                <label for="inlineCheckbox14">PT</label>
                                            </div>
                                        </div>
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
                                    <div class="input-group date form_datetime padleftdatetimepickers simpleDatePicker cursor-pointer"
                                        data-date-format="dd M yyyy">
                                        <asp:TextBox ID="txtDateFrom" ToolTip="Select Date" data-toggle="tooltip" data-placement="top" CssClass="form-control cursor-pointer" runat="server" ReadOnly="False" placeholder="From"></asp:TextBox>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-remove"></span></span><span class="input-group-addon">
                                                <span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <div class="input-group date form_datetime padleftdatetimepickers simpleDatePicker cursor-pointer"
                                        data-date-format="dd M yyyy">
                                        <asp:TextBox ID="txtDateTo" ToolTip="Select Date" data-toggle="tooltip" data-placement="top" CssClass="form-control cursor-pointer" runat="server" ReadOnly="False" placeholder="To"></asp:TextBox>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-remove"></span></span><span class="input-group-addon">
                                                <span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">

                                <div class="col-xs-2">
                                    <asp:Button ID="btnSearch" CssClass="form-control btn btn-primary" runat="server" Text="Search" />
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnReset" CssClass="form-control btn btn-primary" runat="server" Text="Reset" />
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnToday" CssClass="form-control btn btn-primary" runat="server" Text="Today" />
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnYesterday" CssClass="form-control btn btn-primary" runat="server" Text="Yesterday" />
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnLastWeek" CssClass="form-control btn btn-primary" runat="server" Text="Last Week" />
                                </div>
                                <div class="col-xs-2">
                                    <asp:Button ID="btnThisMonth" CssClass="form-control btn btn-primary" runat="server" Text="This Month" />
                                </div>
                            </div>
                        </div>
                        <div class="well">
                            <table>
                                <tr>
                                    <td><i class="fa fa-graduation-cap"><b>Study Details</b></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;Main Account <span class="badge">2</span></td>
                                    <td>&nbsp;Transferred Account <span class="badge">9</span></td>
                                    <td>&nbsp;Reviewed: 0 </td>
                                    <td>&nbsp;TAT Failed: <span class="badge">2</span> </td>
                                    <td>&nbsp;Draft: <span class="badge">7</span> </td>
                                    <td>&nbsp;Disputed: <span class="badge">89</span> </td>
                                    <td>&nbsp;Total Study: <span class="badge">10</span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="light" class="white_content">
                    <div class="row">
                        <table class="testTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Legacy ID</th>
                                    <th>Parent ID</th>
                                    <th>Name</th>
                                    <th>Inform</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Abdul Fahim Khan</td>
                                    <td>Abdul Fahim Khan</td>
                                    <td>Abdul Fahim Khan</td>
                                    <td>Abdul Fahim Khan</td>
                                    <td>Abdul Fahim Khan</td>
                                    <td><a href=""><i class="fa fa-external-link-square themeTextColor" aria-hidden="true"></i></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="Button" OnClick="btn_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
