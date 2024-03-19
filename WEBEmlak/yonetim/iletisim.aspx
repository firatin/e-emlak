<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="WEBEmlak.yonetim.iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 102px;
        }
        .auto-style3 {
            width: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table class="auto-style1">
        <tr>
            <td class="auto-style2">Adres</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtAdres" runat="server" Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Tel</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtTel1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gsm</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtTel2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Fax</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtFax" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Mail</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td class="auto-style2">Mail Şifreniz</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td class="auto-style2">Mail SMTP</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtMailSmtp" runat="server"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td class="auto-style2">SMTP Portu</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtPort" runat="server"></asp:TextBox>
            </td>
        </tr>
          <tr>
            <td class="auto-style2">Google Harita</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtHarita" runat="server" Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btnKaydet" runat="server" CssClass="btn" OnClick="btnKaydet_Click" Text="Kaydet" />
            </td>
        </tr>
    </table>
</asp:Content>
