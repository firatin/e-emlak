<%@ Page Title="" Language="C#" MasterPageFile="~/msDetay.Master" AutoEventWireup="true" CodeBehind="ilandetay.aspx.cs" Inherits="WEBEmlak.ilandetay2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style1 {
            width: 148px;
        }
        .auto-style2 {
            width: 133px;
        }
        .auto-style3 {
            width: 173px;
        }
        .auto-style5 {
            width: 14px;
        }
         .auto-style18 {
            width: 100%;
            margin-bottom: 0px;
        }

        .auto-style19 {
            width: 68px;
            font-weight: bold;
        }

        .auto-style20 {
            width: 68px;
            font-weight: bold;
            height: 22px;
        }

        .auto-style21 {
            height: 22px;
        }
        .auto-style22 {
            width: 111px;
        }
    </style>

        <script type="text/javascript" lang="Javascript">

            function textCounter(field, countfield, maxlimit) {

                if (field.value.length > maxlimit) {

                    field.value = field.value.substring(0, maxlimit);

                    field.enabled = false;

                }

                else

                    countfield.value = maxlimit - field.value.length;

            }
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
    <div id="content"><div class="container">
    <div id="main">
        <div class="row">
            <div class="span9">

                <div class="carousel property">
                    <div class="preview">
                        <img src="../Resimler/ilan/800/<%=ilanResim%>" title="<%=ilanAdi%>" alt="<%=ilanAdi%>" class="resimboyut" />
                    </div><!-- /.preview -->

                    <div class="content">

                        <a class="carousel-prev" href="#">Previous</a>
                        <a class="carousel-next" href="#">Next</a>
                        <ul>
                             <asp:Repeater ID="dlResimler" runat="server" >
                                <ItemTemplate>
                            <li>
                                        <div class="active">
                                            
                                                <img src="../Resimler/ilan/800/<%#Eval("ResimYolu150")%>" alt="<%=ilanAdi%>" /></a>
                                        </div>
                                    </li>
                  
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <!-- /.content -->
                </div>
                <!-- /.carousel -->
             
                <div class="property-detail">
                     <div>
            <strong>Konum:</strong>
            <asp:Label ID="lblKonum" runat="server"></asp:Label>
        </div>
                    <div class="pull-left overview">
                      
                        <div class="row"><br />
                            <div class="myspan">
                                <h2>Genel</h2>

                                <table>
                                    <tbody>

                                        <tr>
                                            <th class="auto-style22">İlan No:</th>
                                            <td>
                                                <asp:Label ID="lblilanNo" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="auto-style22">Fiyat:</th>
                                            <td class="price">
                                                <asp:Label ID="lblFiyat" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="auto-style22">Durum:</th>
                                            <td>
                                                <span class="contract-type">
                                                    <asp:Label ID="lblTur" runat="server"></asp:Label>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr id="trKonutTipi" runat="server">
                                            <th class="auto-style22">Konut Tipi:</th>
                                            <td><strong>
                                                <asp:Label ID="lblKonutTip" runat="server"></asp:Label></strong></td>
                                        </tr>
                                        <tr id="trisyeriTipi" runat="server" visible="false">
                                            <th class="auto-style22">İşyeri Tipi:</th>
                                            <td><strong>
                                                <asp:Label ID="lblisyeriTip" runat="server"></asp:Label></strong></td>
                                        </tr>
                                        <tr id="trArsaTipi" runat="server" visible="false">
                                            <th class="auto-style22">Arsa Tipi:</th>
                                            <td><strong>
                                                <asp:Label ID="lblArsaTip" runat="server"></asp:Label></strong></td>
                                        </tr>



                                        <tr>
                                            <th class="auto-style22">Metrekare:</th>
                                            <td>
                                                <asp:Label ID="lblMetrekare" runat="server"></asp:Label></td>
                                        </tr>


                                        <tr id="trArsaTapu" runat="server" visible="false">
                                            <th class="auto-style22">Tapu Durumu:</th>
                                            <td>
                                                <asp:Label ID="lblTapuDurumu" runat="server"></asp:Label></td>
                                        </tr>
                                         <tr id="trTakas" runat="server" visible="false">
                                            <th class="auto-style22">Takas Durumu:</th>
                                            <td>
                                                <asp:Label ID="lblTakasDurum" runat="server"></asp:Label></td>
                                        </tr>
                                         <tr id="trKredi" runat="server" visible="false">
                                            <th class="auto-style22">Kredi Durumu:</th>
                                            <td>
                                                <asp:Label ID="lblKrediDurum" runat="server"></asp:Label></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.span2 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    

                    <p><strong><div id="divGayrimenkul" runat="server">   <h2>Gayrimenkul Bilgileri</h2>
                <table>


                    <tr>
                        <td class="auto-style3"><strong>Yapı Tipi</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblYapiTipi" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1"><strong>Yapının Durumu</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style11">
                            <asp:Label ID="lblYapidurum" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3"><strong>Kullanım Durumu</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblKullanimdurum" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1"><strong>Yapım Yılı</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style11">
                            <asp:Label ID="lblYapimyili" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3"><strong>Kat Sayısı</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblKatSayi" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1"><strong>Bulunduğu Kat</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style11">
                            <asp:Label ID="lblBulundugukat" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trEvOda">
                        <td class="auto-style3"><strong>Oda Sayısı</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblOdaSayi" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1"><strong>Yatak Odası</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style11">
                            <asp:Label ID="lblYatakOdasi" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr runat="server" id="trEvBalkonBahce">
                        <td class="auto-style3"><strong>Balkon</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblBalkon" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1"><strong>Bahçe</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style11">
                            <asp:Label ID="lblBahce" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3"><strong>Isınma Tipi</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="lblisinmatip" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style1"><strong>Yakıt Tipi</strong></td>
                        <td class="auto-style5">:</td>
                        <td class="auto-style11">
                            <asp:Label ID="lblYakitTip" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                </table>

                               </div>
                        </strong>

                        <br />
                        <div id="divKirala" runat="server" visible="false">
                            <table class="auto-style18">
                                <tr>
                                    <td>
                            <asp:Label ID="Label6" runat="server" Text="TCNo"></asp:Label>
                                    </td>
                                    <td>
                            <asp:TextBox ID="txtTcno" runat="server" MaxLength="11" TextMode="Number"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label2" runat="server" Text="Ad"></asp:Label>
                                    </td>
                                    <td>
                            <asp:TextBox ID="txtAd" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label3" runat="server" Text="Soyad"></asp:Label>
                                    </td>
                                    <td>
                            <asp:TextBox ID="txtSoyad" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label4" runat="server" Text="Tel"></asp:Label>
                                    </td>
                                    <td>
                            <asp:TextBox ID="txtTelno" runat="server" TextMode="Phone"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label5" runat="server" Text="E-Posta"></asp:Label>
                                    </td>
                                    <td>
                            <asp:TextBox ID="txtEposta" runat="server" TextMode="Email"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label8" runat="server" Text="Giriş Tarihi"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtGtarih" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="clGiris" runat="server" Enabled="True" TargetControlID="txtGtarih">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                            <asp:Label ID="Label9" runat="server" Text="Çıkış Tarihi"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCtarih" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="clCikis" runat="server" Enabled="True" TargetControlID="txtCtarih">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr><br />
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnKirala" runat="server" Text="Başvur" CssClass="btn-inverse" Height="36px" Width="134px" OnClick="btnKirala_Click1" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            </div>
                          <h2 id="divAciklama" runat="server">Açıklama</h2>
                         <p>
                <asp:Literal ID="ltrlAciklama" runat="server"></asp:Literal>
                           <div  style="margin-top:180px;" id="divArsaDuzelt" runat="server" visible="false" ></div>
            </p>
                    
<div>
         <div id="divisKullanimAmaci" runat="server" visible="False">     <h2>Kullanım Amacı</h2>

                    <div class="row">
                        <ul class="span2">
                            <table>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbAtolye" runat="server" Text="Atölye" Width="100" Enabled="False" /></td>
                                                <td>
                                                    <asp:CheckBox ID="cbBanka" runat="server" Text="Banka" Width="100" Enabled="False" /></td>
                                                <td>
                                                    <asp:CheckBox ID="cbDershane" runat="server" Text="Dershane" Width="100" Enabled="False" /></td>
                                                <td>
                                                    <asp:CheckBox ID="cbFabrika" runat="server" Text="Toplu Ulaşıma Yakın" Width="180" Enabled="False" /></td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbShowroom" runat="server" Text="Showroom" Width="100" Enabled="False" /></td>
                                                <td>
                                                    <asp:CheckBox ID="cbHastane" runat="server" Text="Hastane" Width="100" Enabled="False" /></td>
                                                <td>
                                                    <asp:CheckBox ID="cbMarket" runat="server" Text="Market" Width="100" Enabled="False" /></td>
                                                <td>
                                                    <asp:CheckBox ID="cbMuayenehane" runat="server" Text="Muayenehane" Width="130" Enabled="False" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbOfis" runat="server" Text="Ofis" Width="130" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbPastane" runat="server" Text="Pastane" Width="130" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbPoliklinik" runat="server" Text="Poliklinik" Width="130" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbRestoran" runat="server" Text="Restoran" Width="130" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbUretimTesis" runat="server" Text="Üretim Tesisi" Width="130" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbMagaza" runat="server" Text="Mağaza" Width="130" Enabled="False" />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                
                                        </table>     </div>    
             </div>              
                        <div id="divicOzellikler" runat="server">     <h2>İç Donanım </h2>

                                        <table >
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbAdsl" runat="server" Text="Adsl" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbJakuzi" runat="server" Text="Jakuzi" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style17">
                                                    <asp:CheckBox ID="cbBoyali" runat="server" Text="Boyalı" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbkuvet" runat="server" Text="Küvet" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style16">
                                                    <asp:CheckBox ID="cbPanjur" runat="server" Text="Panjur" Width="130px" Enabled="False" />
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbAsansor" runat="server" Text="Asansör" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbKartonPiyer" runat="server" Text="Kartonpiyer" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style17">
                                                    <asp:CheckBox ID="cbSofben" runat="server" Text="Şofben" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbDiafon" runat="server" Text="Diafon" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style16">
                                                    <asp:CheckBox ID="cbsomine" runat="server" Text="Şömine" Width="130px" Enabled="False" />
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbDusaKabin" runat="server" Text="Duşakabin" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbMutfakDgaz" runat="server" Text="Mutfak Doğalgazı" Width="150px" Enabled="False" />
                                                </td>
                                                <td class="auto-style17">
                                                    <asp:CheckBox ID="cbAhsapDograma" runat="server" Text="Ahşap Doğrama" Width="150px" Enabled="False" />
                                                </td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbJenerator" runat="server" Text="Jeneratör" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style16">
                                                    <asp:CheckBox ID="cbfiberinternet" runat="server" Text="Fiber İnternet" Width="130px" Enabled="False" />
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbGommeDolab" runat="server" Text="Gömme Dolab" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbSauna" runat="server" Text="Sauna" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style17">
                                                    <asp:CheckBox ID="cbBeyazEsya" runat="server" Text="Beyaz Eşyalı" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbLaminant" runat="server" Text="Laminant" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style16">
                                                    <asp:CheckBox ID="cbalarm" runat="server" Text="Alarm" Width="130px" Enabled="False" />
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbYerdenisitma" runat="server" Text="Yerden Isıtma" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbCelikKapi" runat="server" Text="Çelik Kapı" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style17">
                                                    <asp:CheckBox ID="cbGiyinmeOda" runat="server" Text="Giyinme Odası" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbisicam" runat="server" Text="Isıcam" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style16">
                                                    <asp:CheckBox ID="cbkapici" runat="server" Text="Kapıcı" Width="130px" Enabled="False" />
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbKlima" runat="server" Text="Klima" Width="130px" Enabled="False" /></td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbcamasir" runat="server" Text="Çamaşır Odası" Width="148px" Enabled="False" />
                                                </td>
                                                <br /><td>
                                                    <asp:CheckBox ID="cbmarley" runat="server" Text="Marley" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbebeveyn" runat="server" Text="Ebeveyn Banyolu" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbparke" runat="server" Text="Parke" Width="130px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                 <td class="auto-style15">
                                                    <asp:CheckBox ID="cbhidrofor" runat="server" Text="Hidrofor" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbspotisik" runat="server" Text="Spot Işık" Width="130px" Enabled="False" />
                                                </td>
                                                 <td class="auto-style15">
                                                    <asp:CheckBox ID="cbkablo" runat="server" Text="Kavlo TV-Uydu" Width="130px" Enabled="False" />
                                                </td>
                                                <td class="auto-style15">
                                                    <asp:CheckBox ID="cbkiler" runat="server" Text="Kiler" Width="130px" Enabled="False" />
                                                </td>
                                                 <td class="auto-style15">
                                                    <asp:CheckBox ID="cbpvc" runat="server" Text="PVC Doğrama" Width="130px" Enabled="False" />
                                                </td>
                                             
                                            </tr>
                                            <tr>
                                                   <td>
                                                    <asp:CheckBox ID="cbmobilya" runat="server" Text="Mobilyalı" Width="130px" Enabled="False" />
                                                </td>
                                            </tr>
                                        </table></div>
                     <div id="divDisOzellikler" runat="server">        <h2>Dış Donanım </h2>

                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbsiteicinde" runat="server" Text="Site İçinde" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbguvenlik" runat="server" Text="Güvenlik" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbacikotopark" runat="server" Text="Açık Otopark" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbkapaliotopark" runat="server" Text="Kapalı Otopark" Width="130px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cboyunparki" runat="server" Text="Oyun Parkı" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbyuzmehavuzu" runat="server" Text="Yüzme Havuzu" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbsaglikmerkezi" runat="server" Text="Sağlık Hizmetleri" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbalisveris" runat="server" Text="Alışveriş" Width="130px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbsportesisi" runat="server" Text="Spor Tesisi" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbsudeposu" runat="server" Text="Su Deposu" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbkres" runat="server" Text="Kreş" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbymerdiven" runat="server" Text="Yangın Merdiveni" Width="150px" Enabled="False" />
                                                </td>
                                            </tr>
                                        </table></div>
                            <div id="divAltYapi" runat="server" visible="false">

                                <h2>Alt Yapı Durumu</h2>

                                <div class="row">
                                    <ul class="span2">

                                        <table class="auto-style18">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbimarli" runat="server" Text="İmarlı" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbimarsiz" runat="server" Text="İmarsız" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbifrazli" runat="server" Text="İfrazlı" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbParselli" runat="server" Text="Parselli" Width="130px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbHisseli" runat="server" Text="Hisseli" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbTapulu" runat="server" Text="Tapulu" Width="130px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbruhsat" runat="server" Text="İnşaat Ruhsatı Alınmış" Width="180px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbturizimimar" runat="server" Text="Turizim İmarlı" Width="130px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbyatirimtesvik" runat="server" Text="Yatırım Teşviki" Width="130px" Enabled="False" />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>

                                        </table>

                                    </ul>

                                </div>
                            </div>
                         <div id="divCevreOzellik" runat="server">      <h2>Çevre Durumu</h2>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbbogaz" runat="server" Text="Boğaz Manzarası" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbdeniz" runat="server" Text="Deniz Manzarası" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbdoga" runat="server" Text="Doğa İçinde" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbgol" runat="server" Text="Göl Manzarası" Width="150px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbdenizeyakin" runat="server" Text="Denize Yakın" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbdenizesifir" runat="server" Text="Denize Sıfır" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbcaddeye" runat="server" Text="Caddeye Yakın" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbhavaalani" runat="server" Text="Havaalanına Yakın" Width="150px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbtopluulasim" runat="server" Text="Toplu Ulaşıma Yakın" Width="170px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbotoban" runat="server" Text="Otobana Yakın" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbmetro" runat="server" Text="Metroya Yakın" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbilkogretim" runat="server" Text="İlköğretim Okulu" Width="150px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cblise" runat="server" Text="Lise" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbuniversite" runat="server" Text="Üniversite" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbeczane" runat="server" Text="Eczane" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbhastaneyakin" runat="server" Text="Hastane" Width="150px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbsaglikocagi" runat="server" Text="Sağlık Ocağı" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbmarketyakin" runat="server" Text="Market" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbpark" runat="server" Text="Park" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbpazar" runat="server" Text="Semt Pazarı" Width="150px" Enabled="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbpolis" runat="server" Text="Polis Merkezi" Width="150px" Enabled="False" />
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="cbamerkezi" runat="server" Text="Alışveriş Merkezi" Width="150px" Enabled="False" />
                                                </td>
                                            </tr>
                                        </table></div>

                        </ul>
                    </div></p>

                    <div class="row">
                        <ul class="span2">
                        
                        </ul>
                    </div>

                    
                </div>
                
            </div>
            <div class="sidebar span3">
                <div id="divDanisman" runat="server">
                 <div class="widget contact">
    <div class="title">
         
                          <h3>  <asp:Label ID="lbl" runat="server" Text="İlanın Gayrimenkul Danışmanı" Font-Bold="True"></asp:Label></h3>
        
    </div><!-- /.title -->

    <div class="content">
        
          <asp:Image ID="imgResim" runat="server" Width="230" />
        <table class="auto-style18">
            <tr>
                <td class="auto-style20">Danışman</td>
                <td class="auto-style21">&nbsp; :</td>
                <td class="auto-style21">
                  <asp:Label ID="lblAdSoyad" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style20">Tel</td>
                <td class="auto-style21">&nbsp; :</td>
                <td class="auto-style21">
                    <asp:Label ID="lblTel" runat="server"></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style20">Gsm</td>
                <td class="auto-style21">&nbsp; :</td>
                <td class="auto-style21">
                    <asp:Label ID="lblGsm" runat="server"></asp:Label> 
                </td>
            </tr>
            <tr>
                <td class="auto-style20">Email</td>
              
                <td class="auto-style21">&nbsp; :</td>
                <td class="auto-style21">
                    <asp:Label ID="lblMail" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style19">&nbsp;</td>
                <td></td>
                <td><a href="/danisman-<%=DanismanId%>-<%=Kontrol.UrlSeo(DanismanAdi).ToString().ToLower()%>">Diğer İlanları</a></td>
            </tr>
        </table>
    </div><!-- /.content -->
</div>
                

                <div class="widget contact">
    <div class="title">
        
                          <h3>  <asp:Label ID="Label1" runat="server" Text="Danışmana Sms Gönderin" Font-Bold="True"></asp:Label></h3>

    <!-- /.title -->

    <div class="content">
        <div>
            <div class="control-group">
                <label class="control-label" for="inputName">
                    Adınız-Soyadınız *
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAdSoyad" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbMesaj" ></asp:RequiredFieldValidator>
                </label>
                <div class="controls">
                   
          
                        <asp:TextBox ID="txtAdSoyad" runat="server"></asp:TextBox>
                </div><!-- /.controls -->
            </div><!-- /.control-group -->

            <div class="control-group">
                <label class="control-label" for="inputEmail">
                    Email Adresiniz *
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMail" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbMesaj"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"  ControlToValidate="txtMail" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbMesaj" ></asp:RegularExpressionValidator>
                </label>
                <div class="controls">
                        <asp:TextBox ID="txtMail" runat="server" TargetControlID="txtTel"></asp:TextBox>
                </div><!-- /.controls -->
            </div><!-- /.control-group -->
              <div class="control-group">
                <label class="control-label" for="inputEmail">
                    Telefonunuz *
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTel" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbMesaj"></asp:RequiredFieldValidator>
                </label>
                <div class="controls">
                    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                </div><!-- /.controls -->
            </div><!-- /.control-group -->

            <div class="control-group">
                <label class="control-label" for="inputMessage">
                    Mesajınız *
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMesaj" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbMesaj"></asp:RequiredFieldValidator>
                </label>
                   
                <div class="controls">
                    <asp:TextBox ID="txtMesaj" runat="server" MaxLength="500" ViewStateMode="Disabled" onkeyup="textCounter(this, this.form.remLen, 500);" TextMode="MultiLine"></asp:TextBox>
                </div><!-- /.controls -->
            </div><!-- /.control-group -->
  Kalan Karakter Sayısı : &nbsp;&nbsp;&nbsp;&nbsp;<input  name="remLen" type="text" value="500" style="width:37px;" />

         
            <div class="form-actions"><br />
<asp:Button ID="btnMesajGonder" runat="server" Text="MesajGonder" OnClick="btnMesajGonder_Click1" CssClass="btn" Width="220px" ValidationGroup="grbMesaj" ForeColor="Black" />
            </div><!-- /.form-actions -->
        </div>
    </div><!-- /.content -->
</div><!-- /.widget --></div>
       </div>
            </div>
        </div>
    </div>
</div>
    </div><br /><br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
</asp:Content>
