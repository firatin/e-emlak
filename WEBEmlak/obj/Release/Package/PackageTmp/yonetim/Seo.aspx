<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="Seo.aspx.cs" Inherits="WEBEmlak.yonetim.Seo" %>
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
            <td class="auto-style2">Title</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Description</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtDesc" runat="server" Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Keywords</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtKeyword" runat="server" Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Facebook</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtFace" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Twitter</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtTwit" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style2">Footer</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="txtFooter" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td class="auto-style2">Site Logo</td>
            <td class="auto-style3">:</td>
            <td>
                &nbsp;<asp:FileUpload ID="FuResim" runat="server" />
&nbsp;<asp:Button ID="btnYukle" runat="server" CssClass="btn" OnClick="btnYukle_Click" Text="Resmi Yükle" />
                <asp:Button ID="btnSil" runat="server" CssClass="btn" OnClick="btnSil_Click" Text="Resmi Sil" />
                <br />
                <asp:Image ID="imgResim" runat="server" Width="200px" />
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
