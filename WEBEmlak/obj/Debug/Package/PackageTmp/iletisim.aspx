<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSite.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="WEBEmlak.İletisim" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 81px;
            font-weight: bold;
        }
        .auto-style3 {
            width: 37px;
        }
        .auto-style13 {
            width: 81px;
            font-weight: bold;
            height: 24px;
        }
        .auto-style14 {
            width: 37px;
            height: 24px;
        }
        .auto-style15 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
<table class="auto-style1">
        <tr>
            <td class="auto-style13">Tel</td>
            <td class="auto-style14">:</td>
            <td class="auto-style15">
                <asp:Label ID="lblTel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Gsm</td>
            <td class="auto-style14">:</td>
            <td class="auto-style15">
                <asp:Label ID="lblGsm" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Faks</td>
            <td class="auto-style14">:</td>
            <td class="auto-style15">
                <asp:Label ID="lblFax" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Email</td>
            <td class="auto-style14">:</td>
            <td class="auto-style15">
                <asp:Label ID="lblMail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Adres</td>
            <td class="auto-style14">:</td>
            <td class="auto-style15">
                <asp:Label ID="lblAdres" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Bize Yazın</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Ad Soyad</td>
            <td class="auto-style14">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdSoyad" ErrorMessage="Boş geçmeyiniz" ForeColor="Red" ValidationGroup="grbiletisim">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style15">
                <asp:TextBox ID="txtAdSoyad" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Telefon</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTel" ErrorMessage="Boş geçmeyiniz" ForeColor="Red" ValidationGroup="grbiletisim">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtTel" runat="server" Width="250px"></asp:TextBox>
             
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtTel" FilterType="Numbers"></asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMail" ErrorMessage="Boş geçmeyiniz" ForeColor="Red" ValidationGroup="grbiletisim">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMail" ErrorMessage="Mail formatını kontrol edin" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grbiletisim">*</asp:RegularExpressionValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMail" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Mesaj</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMesaj" ErrorMessage="Boş geçmeyiniz" ForeColor="Red" ValidationGroup="grbiletisim">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMesaj" runat="server" Height="250px" TextMode="MultiLine" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btnGonder" runat="server" CssClass="btn btn-primary arrow-right" Text="Mesajı Gönder" ValidationGroup="grbiletisim" OnClick="btnGonder_Click" />
            </td>
        </tr>
         <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Label ID="lblHarita" runat="server" ></asp:Label></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
</asp:Content>
