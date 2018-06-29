<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorView.aspx.cs" Inherits="AbsTech.WebScreen.DoctorView" MasterPageFile="~/WebScreen/DicomViewer.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
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
            <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="Button" OnClick="btn_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
