<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="ilanlar.aspx.cs" Inherits="WEBEmlak.yonetim.ilanlar" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 59px;
        }

        .auto-style6 {
            width: 93px;
        }

        .auto-style7 {
            width: 93px;
            height: 28px;
        }

        .auto-style8 {
            width: 205px;
            height: 28px;
        }

        .auto-style9 {
            height: 28px;
        }

        .auto-style12 {
            width: 205px;
        }

        .auto-style13 {
            width: 113px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnUrunler" runat="server" CssClass="btn" Text="Tüm İlanlar" OnClick="btnUrunler_Click" Visible="False" />
    <asp:Button ID="Button1" runat="server" CssClass="btn" PostBackUrl="~/yonetim/ilanekle.aspx" Text="Yeni İlan Ekle" />
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <div class="well" id="divAra" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            &nbsp;Ara<table class="auto-style1">
                                <tr>
                                    <td class="auto-style6">&nbsp;İl:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                    <td class="auto-style12">
                                        <asp:DropDownList ID="ddil" runat="server" OnSelectedIndexChanged="ddKategori_SelectedIndexChanged" Width="188px" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;İlçe:&nbsp;
                                             <asp:DropDownList ID="ddilce" runat="server" Width="188px" AutoPostBack="True" OnSelectedIndexChanged="ddilce_SelectedIndexChanged">
                                             </asp:DropDownList>
                                        &nbsp;&nbsp;&nbsp;&nbsp; Semt-Mahalle:&nbsp;
                                        <asp:DropDownList ID="ddSemt" runat="server" OnSelectedIndexChanged="ddSemt_SelectedIndexChanged" Width="188px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">veya </td>
                                    <td class="auto-style8">
                                        <asp:TextBox ID="txtAra" runat="server" CssClass="btn-toolbar" Height="16px" placeholder="İlan Numarası" ValidationGroup="grbAra" Width="180px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style6">&nbsp;</td>
                                    <td class="auto-style12">
                                        <asp:Button ID="btnAra" runat="server" CssClass="btn" OnClick="btnAra_Click" Text="İlan Ara" ValidationGroup="grbAra" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </td>
        </tr>
        <tr>
            <td>
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

                        <th></th>
                        <th>İlan No</th>
                        <th>Başlık</th>
                        <th>İlan Tipi</th>
                        <th>Konum</th>
                        <th>Danışman</th>
                        <th class="auto-style13">Fiyat</th>
                        <th>Hit</th>
                        <th>Tarih</th>
                        <th>Durum</th>
                        <th style="width: 46px;">İşlem</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RpKayit" runat="server">
                        <ItemTemplate>
                            <tr>

                                <td>
                                    <a href="ilanguncelle.aspx?ilan=<%#Eval("ilanId")%>&islem=resim">
                                        <img src="images/add.png" title="Bu ilana resim ekleyin" /></a></td>
                                <td><a href="ilanguncelle.aspx?ilan=<%#Eval("ilanId")%>" title="İlanı Güncelle"><%#Eval("ilanId")%></a></td>
                                <td><a href="ilanguncelle.aspx?ilan=<%#Eval("ilanId")%>" title="<%#Eval("ilanAdi")%> - <%#Eval("EklenmeTarihi")%>"><%#Eval("kisaad")%></a></td>
                                <td><%#Eval("ilanTipi")%></td>
                                <td><a title="<%#Eval("ilAdi")%> - <%#Eval("ilceAdi")%> - <%#Eval("SemtAdi")%>"></a><%#Eval("ilAdi")%> - <%#Eval("ilceAdi")%></a></td>
                                <td><%#Eval("AdSoyad")%></td>
                                <td><%#Eval("Fiyat","{0:c}")%></td>
                                <td><%#Eval("Hit")%></td>
                                <td><%#Eval("EklenmeTarihi", "{0:d/MM/yyyy}")%></td>
                                <td><%#Eval("Durumadi")%></td>

                                <td>


                                    <a href="ilanguncelle.aspx?ilan=<%#Eval("ilanId")%>" title="İlanı Güncelle"><i class="icon-pencil"></i></a>
                                    <a onclick="return confirm('Dikkat: (<%#Eval("ilanId") %>) Numaralı İlanı Silmek İstediğinizden Emin Misiniz?');" href="ilanlar.aspx?ilan=<%#Eval("ilanId")%>&islem=sil" title="Sil"><i class="icon-remove"></i></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

                        </div>
                        <div class="pagination">
                            <cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" LabelText="Sayfa:" NextText="İleri »" QueryStringKey="Sayfa" ResultsFormat="" PageSize="40">
                            </cc1:CollectionPager>
                        </div>

                        </div>
        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grbAra" />

            </td>
        </tr>
    </table>
</asp:Content>
