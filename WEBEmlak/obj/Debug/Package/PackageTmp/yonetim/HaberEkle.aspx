<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="HaberEkle.aspx.cs" Inherits="WEBEmlak.yonetim.HaberEkle" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 459px;
        }
        .auto-style4 {
            width: 116px;
            height: 22px;
        }
        .auto-style5 {
            width: 459px;
            height: 22px;
        }
        .auto-style6 {
            height: 22px;
        }
        .auto-style7 {
            width: 116px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style4"><strong>Haber Adı:</strong></td>
            <td class="auto-style5">
                <asp:TextBox ID="txtHaberAdi" runat="server" Width="477px"></asp:TextBox>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Haber Detayı:</strong></td>
            <td class="auto-style3">
                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" Height="263px" Width="776px"></CKEditor:CKEditorControl>
               </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style3">
            <asp:Button ID="btnHaberEkle" runat="server" CssClass="btn" Text="Haberi Ekle" OnClick="btnHaberEkle_Click" />
            &nbsp;<asp:Button ID="btnHaberGuncelle" runat="server" CssClass="btn" Text="Haberi Güncelle" OnClick="btnHaberGuncelle_Click" Visible="False" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
