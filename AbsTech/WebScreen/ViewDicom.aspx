<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDicom.aspx.cs" Inherits="AbsTech.WebScreen.ViewDicom" MasterPageFile="~/WebScreen/DicomViewer.Master"%>
<%@ Register Src="~/UserControl/DicomImageViewer.ascx" TagPrefix="uc1" TagName="DicomImageViewer" %>

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
                    <uc1:DicomImageViewer runat="server" id="DicomImageViewer" />
                </div>
                
                <div class="row">
                    <div class="col-sm-3 col-md-2">
                        <asp:TextBox ID="txtPath" runat="server"></asp:TextBox>
                    </div>
                        <asp:Button ID="btnConvert" runat="server" Text="Convert" OnClick="btnConvert_Click" />
                    <div class="col-sm-3 col-md-2">
                        <asp:Label ID="txt" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
