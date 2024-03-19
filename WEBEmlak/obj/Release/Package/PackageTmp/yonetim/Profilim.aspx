<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="Profilim.aspx.cs" Inherits="WEBEmlak.yonetim.Profilim" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .style4
        {
            width: 20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <table>
         <tr id="divUyeler" runat="server" visible="false">
              <td class="style4">
                   Üyelik Tipi:</td>
                <td>
                  
                    <asp:DropDownList ID="ddYetkiust" runat="server" Width="180px">
                        <asp:ListItem Value="0">Editör</asp:ListItem>
                        <asp:ListItem Value="1">Yönetici</asp:ListItem>
                    </asp:DropDownList>
                  &nbsp;
                  <a id="divDropuyeler" runat="server" >
                Kayıtlı Yöneticiler:
                    <asp:DropDownList ID="ddUyeler" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddUyeler_SelectedIndexChanged">
                    </asp:DropDownList></a>
                
                </td>
         </tr>
        <tr>
            <td class="style4">
                Kullanıcı Adı:</td>
            <td class="style1">
                <asp:TextBox ID="txtKullanici" runat="server" Width="166px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtKullanici" ErrorMessage="Bu alanı boş bırakmayınız." 
                    ForeColor="Red" ValidationGroup="grub1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Mail</td>
            <td class="style1">
                <asp:TextBox ID="txtMail" runat="server" Width="166px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtMail" ErrorMessage="Doğru bir mail adresi giriniz." 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="grub1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Şifre İşlemi:</td>
            <td>
                <asp:CheckBox ID="cboxSifre" runat="server" AutoPostBack="True" 
                    oncheckedchanged="cboxSifre_CheckedChanged" Text="Şifre Değiştir" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                Şifre:</td>
            <td>
                <asp:TextBox ID="txtSifre" runat="server" Enabled="False" TextMode="Password" 
                    Width="166px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Şifre Tekrar:</td>
            <td>
                <asp:TextBox ID="txtSifreTekrar" runat="server" Enabled="False" 
                    TextMode="Password" Width="166px"></asp:TextBox>
                <br />
                <asp:LinkButton ID="lnkSifreTavsiye" runat="server" 
                    onclick="lnkSifreTavsiye_Click" Visible="False">Şifre Tavsiyesi:</asp:LinkButton>
                <br />
                <asp:Label ID="lblSifre" runat="server"></asp:Label>
&nbsp;<asp:TextBox ID="txtTavsiye" runat="server" Visible="False" Width="100px"></asp:TextBox>
                <asp:Label ID="lblSifreBilgi" runat="server" 
                    Text="Lütfen kopyalayıp Şifre ve Şifre tekrar alanlarına yapıştırınız." 
                    Visible="False"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnGuncelle" runat="server" CssClass="btn" 
                    onclick="btnGuncelle_Click" Text="Güncelle" ValidationGroup="grub1" />
&nbsp;<asp:Button ID="btnGeri" runat="server" CssClass="btn" OnClick="btnGeri_Click" Text="&lt;&lt; Geri" Visible="False" />
                <asp:Button ID="btnSil" runat="server" CssClass="btn" Text="Yöneticiyi Sil" Visible="False" OnClick="btnSil_Click" />
                <asp:ConfirmButtonExtender ID="btnSil_ConfirmButtonExtender" runat="server" ConfirmText="Dikkat bu yöneticiyi silmek istediğinizden emin misiniz?" Enabled="True" TargetControlID="btnSil">
                </asp:ConfirmButtonExtender>
                <asp:Label ID="lblBilgi" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
          </table>
    <div id="divYeniUye" runat="server" visible="false">

   
    <table>
         <tr>
                <td class="style4">
                    <strong>Yeni Yönetici Ekle</strong></td>
                <td>
                    <asp:Label ID="lblYeniBilgi" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
       <tr>
                <td class="style4">
                   Üyelik Tipi:</td>
                <td>
                  
                    <asp:DropDownList ID="ddYetki" runat="server" Width="180px">
                        <asp:ListItem Value="0">Editör</asp:ListItem>
                        <asp:ListItem Value="1">Yönetici</asp:ListItem>
                    </asp:DropDownList>
                  
                </td>
            </tr>
          <tr>
                <td class="style4">
                    Kullanıcı Adı:</td>
                <td>
                    <asp:TextBox ID="txtYeniKullanici" runat="server" Width="166px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtYeniKullanici" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="grub2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Mail:</td>
                <td>
                    <asp:TextBox ID="txtYeniMail" runat="server" Width="166px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtYeniMail" ErrorMessage="Doğru bir mail adresi giriniz." 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="grub2"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Şifre:</td>
                <td>
                    <asp:TextBox ID="txtYeniSifre" runat="server" Width="166px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtYeniSifre" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="grub2"></asp:RequiredFieldValidator>
&nbsp;<asp:LinkButton ID="lnkYeniSifreTavsiye" runat="server" 
                        onclick="lnkYeniSifreTavsiye_Click">Şifre Tavsiyesi:</asp:LinkButton>
                    <br />
                    <asp:Label ID="lblYeniSifre" runat="server"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtYeniTavsiye" runat="server" Visible="False" Width="100px"></asp:TextBox>
                    <asp:Label ID="lblYeniSifreBilgi" runat="server" 
                        Text="Lütfen kopyalayıp Şifre ve Şifre tekrar alanlarına yapıştırınız." 
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Şifre Tekrar:</td>
                <td>
                    <asp:TextBox ID="txtYeniTekrar" runat="server" Width="166px" 
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtYeniTekrar" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="grub2"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtYeniSifre" ControlToValidate="txtYeniTekrar" 
                        ErrorMessage="Şifreler Uyuşmuyor." ForeColor="Red" ValidationGroup="grub2"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnEkle" runat="server" CssClass="btn" 
                        onclick="btnEkle_Click" Text="Ekle" ValidationGroup="grub2" />
                &nbsp;</td>
            </tr>
       
    </table>
   
     </div>
</asp:Content>
