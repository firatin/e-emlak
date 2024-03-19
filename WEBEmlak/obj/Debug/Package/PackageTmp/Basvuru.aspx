<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSite.Master" AutoEventWireup="true" CodeBehind="Basvuru.aspx.cs" Inherits="WEBEmlak.Basvuru" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Ad Soyad</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdSoyad" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbBasvur"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtAdSoyad" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Tel</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTel" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbBasvur"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtTel" runat="server" Width="300px"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtTel"></asp:FilteredTextBoxExtender>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gsm</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtGsm" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbBasvur"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtGsm" runat="server" Width="300px"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="txtGsm_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Numbers,Custom" TargetControlID="txtGsm" ValidChars=" ">
                </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Mail</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMail" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbBasvur"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMail" runat="server" Width="300px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMail" ErrorMessage="Mail adresizini kontrol ediniz." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grbBasvur"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Resim</td>
            <td class="auto-style3">:*</td>
            <td>
                <asp:FileUpload ID="FuResim" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Adres</td>
            <td class="auto-style3">:*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAdres" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbBasvur"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtAdres" runat="server" Height="50px" MaxLength="250" TextMode="MultiLine" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btnTamam" runat="server" OnClick="btnTamam_Click" Text="Başvuruyu Gönder" ValidationGroup="grbBasvur" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
</asp:Content>
