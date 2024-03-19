<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="Temalar.aspx.cs" Inherits="WEBEmlak.yonetim.Temalar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <tr>
                                    <td class="auto-style6">&nbsp;TEMALAR :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:DropDownList ID="ddlTema" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTema_SelectedIndexChanged">
        <asp:ListItem Value="/css/realia-blue.css">Mavi</asp:ListItem>
        <asp:ListItem Value="/css/realia-magenta.css">Magenta</asp:ListItem>
        <asp:ListItem Value="/css/realia-orange.css">Turuncu</asp:ListItem>
        <asp:ListItem Value="/css/realia-green.css">Yeşil</asp:ListItem>
        <asp:ListItem Value="/css/realia-red.css">Kırmızı</asp:ListItem>
        <asp:ListItem Value="/css/realia-brown.css">Kahverengi</asp:ListItem>
        <asp:ListItem Value="/css/realia-brown-dark.css">Kahverengi(Koyu)</asp:ListItem>
        <asp:ListItem Value="/css/realia-turquiose.css">Turkuaz</asp:ListItem>
        <asp:ListItem Value="/css/realia-violet.css">Mor</asp:ListItem>
    </asp:DropDownList>
    </td>
                                    <td class="auto-style12">
                                    </td>
</asp:Content>
