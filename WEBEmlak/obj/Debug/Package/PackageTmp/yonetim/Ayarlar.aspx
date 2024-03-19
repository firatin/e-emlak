<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="Ayarlar.aspx.cs" Inherits="WEBEmlak.yonetim.Ayarlar" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 131px;
        }
        .auto-style3 {
            width: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Sms Bilgirimi Ayarı</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:DropDownList ID="ddSms" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddSms_SelectedIndexChanged">
                    <asp:ListItem Value="0">Sms Bildirimi Pasif</asp:ListItem>
                    <asp:ListItem Value="1">Sms Bildirimi Aktif</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Sms Kullanıcı Adınız</td>
            <td class="auto-style3">:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSmsAd" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbAyar"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtSmsAd" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Sms Şifreniz</td>
            <td class="auto-style3">:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSmsSifre" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbAyar"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtSmsSifre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btnKaydet" runat="server" CssClass="btn" OnClick="btnKaydet_Click" Text="Ayarları Kaydet" ValidationGroup="grbAyar" />
            </td>
        </tr>
    </table>
</asp:Content>
