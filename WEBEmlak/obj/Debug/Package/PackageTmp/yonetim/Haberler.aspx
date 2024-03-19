<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="Haberler.aspx.cs" Inherits="WEBEmlak.yonetim.Haberler" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
            <div class="row-fluid">
                    
<div class="btn-toolbar">

    &nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnHaberEkle" runat="server" CssClass="btn" Text="Yeni Haber Ekle" PostBackUrl="~/yonetim/HaberEkle.aspx" />
            <div class="btn-group">
                &nbsp;&nbsp;<asp:Button ID="btnHaberler" runat="server" CssClass="btn" OnClick="btnHaberler_Click" Text="Tüm Haberler" />
                &nbsp;<asp:Button ID="btnAra" runat="server" CssClass="btn" OnClick="btnAra_Click" Text="Ara" ValidationGroup="grbAra" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAra" ErrorMessage="Lütfen Bir İsim Giriniz" ForeColor="Red" ValidationGroup="grbAra">*</asp:RequiredFieldValidator>
            &nbsp;<asp:TextBox ID="txtAra" runat="server" CssClass="btn-toolbar" Height="16px" ValidationGroup="grbAra"></asp:TextBox>
            &nbsp;
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>             
<div class="well">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <img src="images/yukleniyor.gif" />
            Yükleniyor...
        </ProgressTemplate>
    </asp:UpdateProgress>
            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
            &nbsp;
            <table class="table">
                <thead>
                    <tr>
                        <th>Haber Adı:</th>
                        <th>Haber Tarihi:</th>
                      
                        <th style="width: 26px;"></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RpKayit" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><a href="HaberEkle.aspx?HaberId=<%#Eval("HaberId")%>&islem=duzenle" title="Düzenle"><%#Eval("HaberAdi")%></a></td>
                                <td><%#Eval("Tarih")%></td>
                                
                                <td><a href="HaberEkle.aspx?HaberId=<%#Eval("HaberId")%>&islem=duzenle" title="Düzenle"><i class="icon-pencil"></i></a>
                                <a onclick="return confirm('Dikkat: (<%#Eval("HaberAdi") %>) Adlı Haberi Silmek İstediğinizden Emin Misiniz?');" href="Haberler.aspx?HaberId=<%#Eval("HaberId")%>&islem=sil" title="Sil"><i class="icon-remove"></i></a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
      
</div>
<div class="pagination">
  <cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" 
                    LabelText="Sayfa:" NextText="İleri »" PageNumbersDisplay="Numbers" PageSize="30" 
                    ResultsFormat="Gösterilen Kayıtlar {0}-{1} (Toplam {2})" 
                    QueryStringKey="Sayfa">
                </cc1:CollectionPager>
</div>

            </div>
        </div>
      </ContentTemplate>
    </asp:UpdatePanel>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grbAra" />
</div>
        </div>
</asp:Content>
