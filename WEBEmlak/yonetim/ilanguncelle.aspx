<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="ilanguncelle.aspx.cs" Inherits="WEBEmlak.yonetim.ilanguncelle" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
      <link href="/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/uploadify/swfobject.js"></script>
    <script src="/uploadify/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/uploadify/jquery.uploadify.v2.1.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#<%=FileUpload1.ClientID%>").uploadify({

                'scriptData': { 'ilanId': "<%=ilanId%>" },
                'uploader': '/uploadify/uploadify.swf',
                'script': '/Upload.ashx',
                'cancelImg': '/images/cancel.png',
                'folder': '/Resimler/Temp',
                'multi': true,
                'buttonText': 'RESIM SEC',
                'fileDesc': 'Resim Dosyaları',
                'fileExt': '*.jpg;*.jpeg;*.png',
                'auto': true,
                onAllComplete: function (event, data) {
                    location.reload();
                }

            });
        });
    </script>

     <style type="text/css">
        .MyTabStyle .ajax__tab_header {
            font-family: "Helvetica Neue", Arial, Sans-Serif;
            font-size: 14px;
            font-weight: bold;
            display: block;
        }

            .MyTabStyle .ajax__tab_header .ajax__tab_outer {
                border-color: #222;
                color: #222;
                padding-left: 10px;
                margin-right: 3px;
                border: solid 1px #d7d7d7;
            }

            .MyTabStyle .ajax__tab_header .ajax__tab_inner {
                border-color: #666;
                color: #666;
                padding: 3px 10px 2px 0px;
            }

        .MyTabStyle .ajax__tab_hover .ajax__tab_outer {
            background-color: #9c3;
        }

        .MyTabStyle .ajax__tab_hover .ajax__tab_inner {
            color: #fff;
        }

        .MyTabStyle .ajax__tab_active .ajax__tab_outer {
            border-bottom-color: #ffffff;
            background-color: #d7d7d7;
        }

        .MyTabStyle .ajax__tab_active .ajax__tab_inner {
            color: #000;
            border-color: #333;
        }

        .MyTabStyle .ajax__tab_body {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            background-color: #fff;
            border-top-width: 0;
            border: solid 1px #d7d7d7;
            border-top-color: #ffffff;
        }
    </style>
     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 60px;
            height: 41px;
        }

        .auto-style6 {
            width: 23px;
            height: 41px;
        }

        .auto-style7 {
            height: 41px;
        }

        .auto-style9 {
            width: 23px;
        }

        .auto-style10 {
            width: 254px;
        }

        .auto-style11 {
            width: 129px;
        }

        .auto-style12 {
            width: 146px;
        }

        .auto-style14 {
            width: 115px;
        }
        .auto-style15 {
            width: 114px;
        }
        .auto-style16 {
            width: 112px;
        }
        .auto-style17 {
            width: 120px;
        }
        .auto-style23 {
            width: 114px;
            height: 67px;
        }
        .auto-style24 {
            width: 36px;
            height: 67px;
        }
        .auto-style25 {
            width: 36px;
        }
        .auto-style26 {
            width: 34px;
            height: 67px;
        }
        .auto-style27 {
            width: 34px;
        }
        .auto-style28 {
            width: 16px;
            height: 67px;
        }
        .auto-style29 {
            width: 16px;
        }
        .auto-style30 {
            width: 145px;
        }
        .auto-style31 {
            width: 148px;
        }
        .auto-style32 {
            height: 22px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0"  CssClass="MyTabStyle" Width="1070px">
        <asp:TabPanel runat="server" HeaderText="İlan Detayı" ID="tabDetay">
            <ContentTemplate>
  <div class="block">
        <p class="block-heading">Genel Özellikler - Lütfen bu kısımdaki tüm alanları eksiksiz doldurunuz.</p>
        <div class="block-body">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style30">İlan Durumu</td>
                    <td class="auto-style9">:</td>
                    <td>
                        <asp:DropDownList ID="ddAktifPasif" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddAktifPasif_SelectedIndexChanged">
                            <asp:ListItem Value="0">Pasif</asp:ListItem>
                            <asp:ListItem Value="1">Aktif</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trilanTip" runat="server" visible="False"> 
                    <td id="Td1" class="auto-style30" runat="server">İlan Tipi</td>
                    <td id="Td2" class="auto-style9" runat="server">:</td>
                    <td id="Td3" runat="server">
                        <asp:DropDownList ID="ddTip" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddTip_SelectedIndexChanged">
                            <asp:ListItem Value="1">Konut İlanı</asp:ListItem>
                            <asp:ListItem Value="2">İşyeri İlanı</asp:ListItem>
                            <asp:ListItem Value="3">Arsa İlanı</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">İlan Türü</td>
                    <td class="auto-style6">:</td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddTur" runat="server">
                            <asp:ListItem Value="0">Satılık</asp:ListItem>
                            <asp:ListItem Value="1">Kiralık</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr id="trKonutTipi" runat="server">
                    <td id="Td4" class="auto-style30" runat="server">Konut Tipi</td>
                    <td id="Td5" class="auto-style9" runat="server">:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddKonutTipi" ErrorMessage="Konut Tipi Seçiniz" ForeColor="Red" InitialValue="0" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                    </td>
                    <td id="Td6" runat="server">
                        <asp:DropDownList ID="ddKonutTipi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddKonutTipi_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trisyeriTipi" runat="server" visible="False">
                    <td id="Td7" class="auto-style30" runat="server">İşyeri Tipi</td>
                    <td id="Td8" class="auto-style9" runat="server">:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddisyeriTipi" ErrorMessage="İşyeri Tipi Seçiniz" ForeColor="Red" InitialValue="0" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                    </td>
                    <td id="Td9" runat="server">
                        <asp:DropDownList ID="ddisyeriTipi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddisyeriTipi_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trArsaTipi" runat="server" visible="False">
                    <td id="Td10" class="auto-style30" runat="server">Arsa Tipi</td>
                    <td id="Td11" class="auto-style9" runat="server">:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddArsaTipi" ErrorMessage="Arsa Tipi Seçiniz" ForeColor="Red" InitialValue="0" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                    </td>
                    <td id="Td12" runat="server">
                        <asp:DropDownList ID="ddArsaTipi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddArsaTipi_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">Konum</td>
                    <td class="auto-style9">:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddil" ErrorMessage="İl Seçiniz" ForeColor="Red" InitialValue="0" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddil" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddil_SelectedIndexChanged">
                        </asp:DropDownList>
                        &nbsp;-<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddilce" ErrorMessage="İlçe Seçiniz" ForeColor="Red" InitialValue="0" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                        &nbsp;<asp:DropDownList ID="ddilce" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddilce_SelectedIndexChanged">
                        </asp:DropDownList>
                        &nbsp;-&nbsp;
                                <asp:DropDownList ID="ddSemt" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddSemt_SelectedIndexChanged">
                                </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">İlan Adı</td>
                    <td class="auto-style9">:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtilanAdi" ErrorMessage="İlan Adını Yazınız" ForeColor="Red" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtilanAdi" runat="server" MaxLength="100" Width="452px"></asp:TextBox>
                        &nbsp;Max 100 Karakter</td>
                </tr>
                <tr>
                    <td class="auto-style30">Fiyatı</td>
                    <td class="auto-style9">:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFiyat" ErrorMessage="Fiyatı Giriniz" ForeColor="Red" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFiyat" runat="server"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="txtFiyat_FilteredTextBoxExtender" runat="server" Enabled="True" TargetControlID="txtFiyat" ValidChars="0123456789.,">
                        </asp:FilteredTextBoxExtender>
                        &nbsp;TL&nbsp;&nbsp; Metrekare:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMetrekare" ErrorMessage="Metre Kareyi Giriniz" ForeColor="Red" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                        &nbsp;<asp:TextBox ID="txtMetrekare" runat="server" Width="114px"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="txtMetrekare_FilteredTextBoxExtender" runat="server" Enabled="True" TargetControlID="txtMetrekare" ValidChars="0123456789">
                        </asp:FilteredTextBoxExtender>
                    </td>
                </tr>
                 <tr id="trArsaTapu" runat="server" visible="False">
                    <td id="Td13" class="auto-style30" runat="server">Tapu Durumu</td>
                    <td id="Td14" class="auto-style9" runat="server">:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddTapu" ErrorMessage="Tapu Durumu Seçiniz" ForeColor="Red" InitialValue="0" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                     </td>
                    <td id="Td15" runat="server">
                        <asp:DropDownList ID="ddTapu" runat="server">
                            <asp:ListItem>Tapu Durumu Seçiniz</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem>Kat İrtifaklı</asp:ListItem>
                            <asp:ListItem>Kat Mülkiyeti</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style30">Kredi Durumu</td>
                    <td class="auto-style9">:
                     </td>
                    <td>
                        <asp:DropDownList ID="ddKrediUygun" runat="server">
                            <asp:ListItem Value="0">Kredi Durumu Seçiniz</asp:ListItem>
                            <asp:ListItem Value="0">Bilgi Yok</asp:ListItem>
                            <asp:ListItem Value="Krediye Uygun">Krediye Uygun</asp:ListItem>
                            <asp:ListItem Value="Krediye Uygun Değil">Krediye Uygun Değil</asp:ListItem>
                          
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">Takas Durumu</td>
                    <td class="auto-style9">:
                     </td>
                    <td>
                        <asp:DropDownList ID="ddTakasDurum" runat="server">
                            <asp:ListItem Value="0">Takas Durumu Seçiniz</asp:ListItem>
                            <asp:ListItem Value="0">Bilgi Yok</asp:ListItem>
                            <asp:ListItem>Takas Yapılır</asp:ListItem>
                            <asp:ListItem>Takas Yapılmaz</asp:ListItem>
                           
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">Danışman</td>
                    <td class="auto-style9">:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddDanisman" ErrorMessage="Danışman Seçiniz" ForeColor="Red" InitialValue="0" ValidationGroup="grbilan">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddDanisman" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
               
            </table>
        </div>
    </div>


    <div class="block" id="divGayrimenkul" runat="server">
        <p class="block-heading">Gayrimenkul Bilgileri - Eğer zorunlu alanlarda istenen bilgiye sahip değilseniz "Bilgi Yok" olarak seçiniz.</p>
        <div class="block-body">
            &nbsp;<table class="auto-style1">
                <tr>
                    <td class="auto-style12">Yapı Tipi</td>
                    <td class="auto-style9">:</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="ddYapiTipi" runat="server">
                            <asp:ListItem Value="0">Yapı Tipi Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem>Ahşap</asp:ListItem>
                            <asp:ListItem>Betonarme</asp:ListItem>
                            <asp:ListItem>Çelik</asp:ListItem>
                            <asp:ListItem>Kargir</asp:ListItem>
                            <asp:ListItem>Ağaç</asp:ListItem>
                            <asp:ListItem>Prefabrik</asp:ListItem>
                            <asp:ListItem>Taş Bina</asp:ListItem>
                            <asp:ListItem>Yığma</asp:ListItem>
                            <asp:ListItem>Diğer Yapı</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">Yapının Durumu</td>
                    <td class="auto-style9">:</td>
                    <td>
                        <asp:DropDownList ID="ddYapiDurumu" runat="server">
                            <asp:ListItem Value="0">Yapı Durumu Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem>İkinci El</asp:ListItem>
                            <asp:ListItem>Sıfır</asp:ListItem>
                            <asp:ListItem>Yapım Aşamasında</asp:ListItem>
                            <asp:ListItem>Tarihi Eser</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Kullanım Durumu</td>
                    <td class="auto-style9">:</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="ddKullanimDurum" runat="server">
                            <asp:ListItem Value="0">Kullanım Durumu Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem>Boş</asp:ListItem>
                            <asp:ListItem>Kiracı Oturuyor</asp:ListItem>
                            <asp:ListItem>Mülk Sahibi Oturuyor</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">Yapım Yılı</td>
                    <td class="auto-style9">:</td>
                    <td>
                        <asp:DropDownList ID="ddYapimYili" runat="server">
                            <asp:ListItem Value="0">Yapı Yılı Se&#231;</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem Value="2019">2019</asp:ListItem>
                            <asp:ListItem Value="2018">2018</asp:ListItem>
                            <asp:ListItem Value="2017">2017</asp:ListItem>
                            <asp:ListItem Value="2016">2016</asp:ListItem>
                            <asp:ListItem Value="2015">2015</asp:ListItem>
                            <asp:ListItem Value="2014">2014</asp:ListItem>
                            <asp:ListItem Value="2013">2013</asp:ListItem>
                            <asp:ListItem Value="2012">2012</asp:ListItem>
                            <asp:ListItem Value="2011">2011</asp:ListItem>
                            <asp:ListItem Value="2010">2010</asp:ListItem>
                            <asp:ListItem Value="2009">2009</asp:ListItem>
                            <asp:ListItem Value="2008">2008</asp:ListItem>
                            <asp:ListItem Value="2007">2007</asp:ListItem>
                            <asp:ListItem Value="2006">2006</asp:ListItem>
                            <asp:ListItem Value="2005">2005</asp:ListItem>
                            <asp:ListItem Value="2004">2004</asp:ListItem>
                            <asp:ListItem Value="2003">2003</asp:ListItem>
                            <asp:ListItem Value="2002">2002</asp:ListItem>
                            <asp:ListItem Value="2001">2001</asp:ListItem>
                            <asp:ListItem Value="2000">2000</asp:ListItem>
                            <asp:ListItem Value="1999">1999</asp:ListItem>
                            <asp:ListItem Value="1998">1998</asp:ListItem>
                            <asp:ListItem Value="1997">1997</asp:ListItem>
                            <asp:ListItem Value="1996">1996</asp:ListItem>
                            <asp:ListItem Value="1995">1995</asp:ListItem>
                            <asp:ListItem Value="1994">1994</asp:ListItem>
                            <asp:ListItem Value="1993">1993</asp:ListItem>
                            <asp:ListItem Value="1992">1992</asp:ListItem>
                            <asp:ListItem Value="1991">1991</asp:ListItem>
                            <asp:ListItem Value="1990">1990</asp:ListItem>
                            <asp:ListItem Value="1989">1989</asp:ListItem>
                            <asp:ListItem Value="1988">1988</asp:ListItem>
                            <asp:ListItem Value="1987">1987</asp:ListItem>
                            <asp:ListItem Value="1986">1986</asp:ListItem>
                            <asp:ListItem Value="1985">1985</asp:ListItem>
                            <asp:ListItem Value="1984">1984</asp:ListItem>
                            <asp:ListItem Value="1983">1983</asp:ListItem>
                            <asp:ListItem Value="1982">1982</asp:ListItem>
                            <asp:ListItem Value="1981">1981</asp:ListItem>
                            <asp:ListItem Value="1980">1980</asp:ListItem>
                            <asp:ListItem Value="1979">1979</asp:ListItem>
                            <asp:ListItem Value="1978">1978</asp:ListItem>
                            <asp:ListItem Value="1977">1977</asp:ListItem>
                            <asp:ListItem Value="1976">1976</asp:ListItem>
                            <asp:ListItem Value="1975">1975</asp:ListItem>
                            <asp:ListItem Value="1974">1974</asp:ListItem>
                            <asp:ListItem Value="1973">1973</asp:ListItem>
                            <asp:ListItem Value="1972">1972</asp:ListItem>
                            <asp:ListItem Value="1971">1971</asp:ListItem>
                            <asp:ListItem Value="1970">1970</asp:ListItem>
                            <asp:ListItem Value="1969">1969</asp:ListItem>
                            <asp:ListItem Value="1968">1968</asp:ListItem>
                            <asp:ListItem Value="1967">1967</asp:ListItem>
                            <asp:ListItem Value="1966">1966</asp:ListItem>
                            <asp:ListItem Value="1965">1965</asp:ListItem>
                            <asp:ListItem Value="1964">1964</asp:ListItem>
                            <asp:ListItem Value="1963">1963</asp:ListItem>
                            <asp:ListItem Value="1962">1962</asp:ListItem>
                            <asp:ListItem Value="1961">1961</asp:ListItem>
                            <asp:ListItem Value="1960">1960</asp:ListItem>
                            <asp:ListItem Value="1959">1959</asp:ListItem>
                            <asp:ListItem Value="1958">1958</asp:ListItem>
                            <asp:ListItem Value="1957">1957</asp:ListItem>
                            <asp:ListItem Value="1956">1956</asp:ListItem>
                            <asp:ListItem Value="1955">1955</asp:ListItem>
                            <asp:ListItem Value="1954">1954</asp:ListItem>
                            <asp:ListItem Value="1953">1953</asp:ListItem>
                            <asp:ListItem Value="1952">1952</asp:ListItem>
                            <asp:ListItem Value="1951">1951</asp:ListItem>
                            <asp:ListItem Value="1950">1950</asp:ListItem>
                            <asp:ListItem Value="1949">1949</asp:ListItem>
                            <asp:ListItem Value="1948">1948</asp:ListItem>
                            <asp:ListItem Value="1947">1947</asp:ListItem>
                            <asp:ListItem Value="1946">1946</asp:ListItem>
                            <asp:ListItem Value="1945">1945</asp:ListItem>
                            <asp:ListItem Value="1944">1944</asp:ListItem>
                            <asp:ListItem Value="1943">1943</asp:ListItem>
                            <asp:ListItem Value="1942">1942</asp:ListItem>
                            <asp:ListItem Value="1941">1941</asp:ListItem>
                            <asp:ListItem Value="1940">1940</asp:ListItem>
                            <asp:ListItem Value="1939">1939</asp:ListItem>
                            <asp:ListItem Value="1938">1938</asp:ListItem>
                            <asp:ListItem Value="1937">1937</asp:ListItem>
                            <asp:ListItem Value="1936">1936</asp:ListItem>
                            <asp:ListItem Value="1935">1935</asp:ListItem>
                            <asp:ListItem Value="1934">1934</asp:ListItem>
                            <asp:ListItem Value="1933">1933</asp:ListItem>
                            <asp:ListItem Value="1932">1932</asp:ListItem>
                            <asp:ListItem Value="1931">1931</asp:ListItem>
                            <asp:ListItem Value="1930">1930</asp:ListItem>
                            <asp:ListItem Value="1929">1929</asp:ListItem>
                            <asp:ListItem Value="1928">1928</asp:ListItem>
                            <asp:ListItem Value="1927">1927</asp:ListItem>
                            <asp:ListItem Value="1926">1926</asp:ListItem>
                            <asp:ListItem Value="1925">1925</asp:ListItem>
                            <asp:ListItem Value="1924">1924</asp:ListItem>
                            <asp:ListItem Value="1923">1923</asp:ListItem>
                            <asp:ListItem Value="1922">1922</asp:ListItem>
                            <asp:ListItem Value="1921">1921</asp:ListItem>
                            <asp:ListItem Value="1920">1920</asp:ListItem>
                            <asp:ListItem Value="1919">1919</asp:ListItem>
                            <asp:ListItem Value="1918">1918</asp:ListItem>
                            <asp:ListItem Value="1917">1917</asp:ListItem>
                            <asp:ListItem Value="1916">1916</asp:ListItem>
                            <asp:ListItem Value="1915">1915</asp:ListItem>
                            <asp:ListItem Value="1914">1914</asp:ListItem>
                            <asp:ListItem Value="1913">1913</asp:ListItem>
                            <asp:ListItem Value="1912">1912</asp:ListItem>
                            <asp:ListItem Value="1911">1911</asp:ListItem>
                            <asp:ListItem Value="1910">1910</asp:ListItem>
                            <asp:ListItem Value="1909">1909</asp:ListItem>
                            <asp:ListItem Value="1908">1908</asp:ListItem>
                            <asp:ListItem Value="1907">1907</asp:ListItem>
                            <asp:ListItem Value="1906">1906</asp:ListItem>
                            <asp:ListItem Value="1905">1905</asp:ListItem>
                            <asp:ListItem Value="1904">1904</asp:ListItem>
                            <asp:ListItem Value="1903">1903</asp:ListItem>
                            <asp:ListItem Value="1902">1902</asp:ListItem>
                            <asp:ListItem Value="1901">1901</asp:ListItem>
                            <asp:ListItem Value="1900">1900</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Binadaki Kat Sayısı</td>
                    <td class="auto-style9">:</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="ddKatSayisi" runat="server">
                            <asp:ListItem Value="0">Kat Sayısı Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem Value="1">1 Kat</asp:ListItem>
                            <asp:ListItem Value="2">2 Kat</asp:ListItem>
                            <asp:ListItem Value="3">3 Kat</asp:ListItem>
                            <asp:ListItem Value="4">4 Kat</asp:ListItem>
                            <asp:ListItem Value="5">5 Kat</asp:ListItem>
                            <asp:ListItem Value="6">6 Kat</asp:ListItem>
                            <asp:ListItem Value="7">7 Kat</asp:ListItem>
                            <asp:ListItem Value="8">8 Kat</asp:ListItem>
                            <asp:ListItem Value="9">9 Kat</asp:ListItem>
                            <asp:ListItem Value="10">10 Kat</asp:ListItem>
                            <asp:ListItem Value="11">11 Kat</asp:ListItem>
                            <asp:ListItem Value="12">12 Kat</asp:ListItem>
                            <asp:ListItem Value="13">13 Kat</asp:ListItem>
                            <asp:ListItem Value="14">14 Kat</asp:ListItem>
                            <asp:ListItem Value="15">15 Kat</asp:ListItem>
                            <asp:ListItem Value="16">16 Kat</asp:ListItem>
                            <asp:ListItem Value="17">17 Kat</asp:ListItem>
                            <asp:ListItem Value="18">18 Kat</asp:ListItem>
                            <asp:ListItem Value="19">19 Kat</asp:ListItem>
                            <asp:ListItem Value="20">20 Kat</asp:ListItem>
                            <asp:ListItem Value="21">21 Kat</asp:ListItem>
                            <asp:ListItem Value="22">22 Kat</asp:ListItem>
                            <asp:ListItem Value="23">23 Kat</asp:ListItem>
                            <asp:ListItem Value="24">24 Kat</asp:ListItem>
                            <asp:ListItem Value="25">25 Kat</asp:ListItem>
                            <asp:ListItem Value="26">26 Kat</asp:ListItem>
                            <asp:ListItem Value="27">27 Kat</asp:ListItem>
                            <asp:ListItem Value="28">28 Kat</asp:ListItem>
                            <asp:ListItem Value="29">29 Kat</asp:ListItem>
                            <asp:ListItem Value="30">30 Kat</asp:ListItem>
                            <asp:ListItem Value="31">31 Kat</asp:ListItem>
                            <asp:ListItem Value="32">32 Kat</asp:ListItem>
                            <asp:ListItem Value="33">33 Kat</asp:ListItem>
                            <asp:ListItem Value="34">34 Kat</asp:ListItem>
                            <asp:ListItem Value="35">35 Kat</asp:ListItem>
                            <asp:ListItem Value="36">36 Kat</asp:ListItem>
                            <asp:ListItem Value="37">37 Kat</asp:ListItem>
                            <asp:ListItem Value="38">38 Kat</asp:ListItem>
                            <asp:ListItem Value="39">39 Kat</asp:ListItem>
                            <asp:ListItem Value="40">40 Kat</asp:ListItem>
                            <asp:ListItem Value="41">41 Kat</asp:ListItem>
                            <asp:ListItem Value="42">42 Kat</asp:ListItem>
                            <asp:ListItem Value="43">43 Kat</asp:ListItem>
                            <asp:ListItem Value="44">44 Kat</asp:ListItem>
                            <asp:ListItem Value="45">45 Kat</asp:ListItem>
                            <asp:ListItem Value="46">46 Kat</asp:ListItem>
                            <asp:ListItem Value="47">47 Kat</asp:ListItem>
                            <asp:ListItem Value="48">48 Kat</asp:ListItem>
                            <asp:ListItem Value="49">49 Kat</asp:ListItem>
                            <asp:ListItem Value="50">50 Kat</asp:ListItem>
                            <asp:ListItem Value="51">51 Kat</asp:ListItem>
                            <asp:ListItem Value="52">52 Kat</asp:ListItem>
                            <asp:ListItem Value="53">53 Kat</asp:ListItem>
                            <asp:ListItem Value="54">54 Kat</asp:ListItem>
                            <asp:ListItem Value="55">55 Kat</asp:ListItem>
                            <asp:ListItem Value="56">56 Kat</asp:ListItem>
                            <asp:ListItem Value="57">57 Kat</asp:ListItem>
                            <asp:ListItem Value="58">58 Kat</asp:ListItem>
                            <asp:ListItem Value="59">59 Kat</asp:ListItem>
                            <asp:ListItem Value="60">60 Kat</asp:ListItem>
                            <asp:ListItem Value="61">61 Kat</asp:ListItem>
                            <asp:ListItem Value="62">62 Kat</asp:ListItem>
                            <asp:ListItem Value="63">63 Kat</asp:ListItem>
                            <asp:ListItem Value="64">64 Kat</asp:ListItem>
                            <asp:ListItem Value="65">65 Kat</asp:ListItem>
                            <asp:ListItem Value="66">66 Kat</asp:ListItem>
                            <asp:ListItem Value="67">67 Kat</asp:ListItem>
                            <asp:ListItem Value="68">68 Kat</asp:ListItem>
                            <asp:ListItem Value="69">69 Kat</asp:ListItem>
                            <asp:ListItem Value="70">70 Kat</asp:ListItem>
                            <asp:ListItem Value="71">71 Kat</asp:ListItem>
                            <asp:ListItem Value="72">72 Kat</asp:ListItem>
                            <asp:ListItem Value="73">73 Kat</asp:ListItem>
                            <asp:ListItem Value="74">74 Kat</asp:ListItem>
                            <asp:ListItem Value="75">75 Kat</asp:ListItem>
                            <asp:ListItem Value="76">76 Kat</asp:ListItem>
                            <asp:ListItem Value="77">77 Kat</asp:ListItem>
                            <asp:ListItem Value="78">78 Kat</asp:ListItem>
                            <asp:ListItem Value="79">79 Kat</asp:ListItem>
                            <asp:ListItem Value="80">80 Kat</asp:ListItem>
                            <asp:ListItem Value="81">81 Kat</asp:ListItem>
                            <asp:ListItem Value="82">82 Kat</asp:ListItem>
                            <asp:ListItem Value="83">83 Kat</asp:ListItem>
                            <asp:ListItem Value="84">84 Kat</asp:ListItem>
                            <asp:ListItem Value="85">85 Kat</asp:ListItem>
                            <asp:ListItem Value="86">86 Kat</asp:ListItem>
                            <asp:ListItem Value="87">87 Kat</asp:ListItem>
                            <asp:ListItem Value="88">88 Kat</asp:ListItem>
                            <asp:ListItem Value="89">89 Kat</asp:ListItem>
                            <asp:ListItem Value="90">90 Kat</asp:ListItem>
                            <asp:ListItem Value="91">91 Kat</asp:ListItem>
                            <asp:ListItem Value="92">92 Kat</asp:ListItem>
                            <asp:ListItem Value="93">93 Kat</asp:ListItem>
                            <asp:ListItem Value="94">94 Kat</asp:ListItem>
                            <asp:ListItem Value="95">95 Kat</asp:ListItem>
                            <asp:ListItem Value="96">96 Kat</asp:ListItem>
                            <asp:ListItem Value="97">97 Kat</asp:ListItem>
                            <asp:ListItem Value="98">98 Kat</asp:ListItem>
                            <asp:ListItem Value="99">99 Kat</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">Bulunduğu Kat</td>
                    <td class="auto-style9">:</td>
                    <td>
                        <asp:DropDownList ID="ddBulunduguKat" runat="server">
                            <asp:ListItem Value="0">Bulunduğu Katı Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem Value="Tüm Bina">Tüm Bina</asp:ListItem>
                            <asp:ListItem Value="Zemin Kat">Zemin Kat</asp:ListItem>
                            <asp:ListItem Value="Bodrum">Bodrum</asp:ListItem>
                            <asp:ListItem Value="Yarı Bordum">Yarı Bordum</asp:ListItem>
                            <asp:ListItem Value="Giriş Katı">Giriş Katı</asp:ListItem>
                            <asp:ListItem Value="Bahçe Katı">Bahçe Katı</asp:ListItem>
                            <asp:ListItem Value="Çatı Katı">Çatı Katı</asp:ListItem>
                            <asp:ListItem Value="Yüksek Giriş">Yüksek Giriş</asp:ListItem>
                            <asp:ListItem Value="Asma Katı">Asma Katı</asp:ListItem>
                            <asp:ListItem Value="Çatı Dubleksi">Çatı Dubleksi</asp:ListItem>
                            <asp:ListItem Value="Dubleks">Dubleks</asp:ListItem>
                            <asp:ListItem Value="Tribleks">Tribleks</asp:ListItem>
                            <asp:ListItem Value="1">1. Kat</asp:ListItem>
                            <asp:ListItem Value="2">2. Kat</asp:ListItem>
                            <asp:ListItem Value="3">3. Kat</asp:ListItem>
                            <asp:ListItem Value="4">4. Kat</asp:ListItem>
                            <asp:ListItem Value="5">5. Kat</asp:ListItem>
                            <asp:ListItem Value="6">6. Kat</asp:ListItem>
                            <asp:ListItem Value="7">7. Kat</asp:ListItem>
                            <asp:ListItem Value="8">8. Kat</asp:ListItem>
                            <asp:ListItem Value="9">9. Kat</asp:ListItem>
                            <asp:ListItem Value="10">10. Kat</asp:ListItem>
                            <asp:ListItem Value="11">11. Kat</asp:ListItem>
                            <asp:ListItem Value="12">12. Kat</asp:ListItem>
                            <asp:ListItem Value="13">13. Kat</asp:ListItem>
                            <asp:ListItem Value="14">14. Kat</asp:ListItem>
                            <asp:ListItem Value="15">15. Kat</asp:ListItem>
                            <asp:ListItem Value="16">16. Kat</asp:ListItem>
                            <asp:ListItem Value="17">17. Kat</asp:ListItem>
                            <asp:ListItem Value="18">18. Kat</asp:ListItem>
                            <asp:ListItem Value="19">19. Kat</asp:ListItem>
                            <asp:ListItem Value="20">20. Kat</asp:ListItem>
                            <asp:ListItem Value="21">21. Kat</asp:ListItem>
                            <asp:ListItem Value="22">22. Kat</asp:ListItem>
                            <asp:ListItem Value="23">23. Kat</asp:ListItem>
                            <asp:ListItem Value="24">24. Kat</asp:ListItem>
                            <asp:ListItem Value="25">25. Kat</asp:ListItem>
                            <asp:ListItem Value="26">26. Kat</asp:ListItem>
                            <asp:ListItem Value="27">27. Kat</asp:ListItem>
                            <asp:ListItem Value="28">28. Kat</asp:ListItem>
                            <asp:ListItem Value="29">29. Kat</asp:ListItem>
                            <asp:ListItem Value="30">30. Kat</asp:ListItem>
                            <asp:ListItem Value="31">31. Kat</asp:ListItem>
                            <asp:ListItem Value="32">32. Kat</asp:ListItem>
                            <asp:ListItem Value="33">33. Kat</asp:ListItem>
                            <asp:ListItem Value="34">34. Kat</asp:ListItem>
                            <asp:ListItem Value="35">35. Kat</asp:ListItem>
                            <asp:ListItem Value="36">36. Kat</asp:ListItem>
                            <asp:ListItem Value="37">37. Kat</asp:ListItem>
                            <asp:ListItem Value="38">38. Kat</asp:ListItem>
                            <asp:ListItem Value="39">39. Kat</asp:ListItem>
                            <asp:ListItem Value="40">40. Kat</asp:ListItem>
                            <asp:ListItem Value="41">41. Kat</asp:ListItem>
                            <asp:ListItem Value="42">42. Kat</asp:ListItem>
                            <asp:ListItem Value="43">43. Kat</asp:ListItem>
                            <asp:ListItem Value="44">44. Kat</asp:ListItem>
                            <asp:ListItem Value="45">45. Kat</asp:ListItem>
                            <asp:ListItem Value="46">46. Kat</asp:ListItem>
                            <asp:ListItem Value="47">47. Kat</asp:ListItem>
                            <asp:ListItem Value="48">48. Kat</asp:ListItem>
                            <asp:ListItem Value="49">49. Kat</asp:ListItem>
                            <asp:ListItem Value="50">50. Kat</asp:ListItem>
                            <asp:ListItem Value="51">51. Kat</asp:ListItem>
                            <asp:ListItem Value="52">52. Kat</asp:ListItem>
                            <asp:ListItem Value="53">53. Kat</asp:ListItem>
                            <asp:ListItem Value="54">54. Kat</asp:ListItem>
                            <asp:ListItem Value="55">55. Kat</asp:ListItem>
                            <asp:ListItem Value="56">56. Kat</asp:ListItem>
                            <asp:ListItem Value="57">57. Kat</asp:ListItem>
                            <asp:ListItem Value="58">58. Kat</asp:ListItem>
                            <asp:ListItem Value="59">59. Kat</asp:ListItem>
                            <asp:ListItem Value="60">60. Kat</asp:ListItem>
                            <asp:ListItem Value="61">61. Kat</asp:ListItem>
                            <asp:ListItem Value="62">62. Kat</asp:ListItem>
                            <asp:ListItem Value="63">63. Kat</asp:ListItem>
                            <asp:ListItem Value="64">64. Kat</asp:ListItem>
                            <asp:ListItem Value="65">65. Kat</asp:ListItem>
                            <asp:ListItem Value="66">66. Kat</asp:ListItem>
                            <asp:ListItem Value="67">67. Kat</asp:ListItem>
                            <asp:ListItem Value="68">68. Kat</asp:ListItem>
                            <asp:ListItem Value="69">69. Kat</asp:ListItem>
                            <asp:ListItem Value="70">70. Kat</asp:ListItem>
                            <asp:ListItem Value="71">71. Kat</asp:ListItem>
                            <asp:ListItem Value="72">72. Kat</asp:ListItem>
                            <asp:ListItem Value="73">73. Kat</asp:ListItem>
                            <asp:ListItem Value="74">74. Kat</asp:ListItem>
                            <asp:ListItem Value="75">75. Kat</asp:ListItem>
                            <asp:ListItem Value="76">76. Kat</asp:ListItem>
                            <asp:ListItem Value="77">77. Kat</asp:ListItem>
                            <asp:ListItem Value="78">78. Kat</asp:ListItem>
                            <asp:ListItem Value="79">79. Kat</asp:ListItem>
                            <asp:ListItem Value="80">80. Kat</asp:ListItem>
                            <asp:ListItem Value="81">81. Kat</asp:ListItem>
                            <asp:ListItem Value="82">82. Kat</asp:ListItem>
                            <asp:ListItem Value="83">83. Kat</asp:ListItem>
                            <asp:ListItem Value="84">84. Kat</asp:ListItem>
                            <asp:ListItem Value="85">85. Kat</asp:ListItem>
                            <asp:ListItem Value="86">86. Kat</asp:ListItem>
                            <asp:ListItem Value="87">87. Kat</asp:ListItem>
                            <asp:ListItem Value="88">88. Kat</asp:ListItem>
                            <asp:ListItem Value="89">89. Kat</asp:ListItem>
                            <asp:ListItem Value="90">90. Kat</asp:ListItem>
                            <asp:ListItem Value="91">91. Kat</asp:ListItem>
                            <asp:ListItem Value="92">92. Kat</asp:ListItem>
                            <asp:ListItem Value="93">93. Kat</asp:ListItem>
                            <asp:ListItem Value="94">94. Kat</asp:ListItem>
                            <asp:ListItem Value="95">95. Kat</asp:ListItem>
                            <asp:ListItem Value="96">96. Kat</asp:ListItem>
                            <asp:ListItem Value="97">97. Kat</asp:ListItem>
                            <asp:ListItem Value="98">98. Kat</asp:ListItem>
                            <asp:ListItem Value="99">99. Kat</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="trEvOda">
                    <td id="Td16" class="auto-style12" runat="server">Oda Sayısı</td>
                    <td id="Td17" class="auto-style9" runat="server">:</td>
                    <td id="Td18" class="auto-style10" runat="server">
                        <asp:DropDownList ID="ddOdaSayisi" runat="server">
                            <asp:ListItem Value="0">Oda Sayısı Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem Value="Stüdyo Daire">Stüdyo Daire</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="1+1">1+1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="2+1">2+1</asp:ListItem>
                            <asp:ListItem Value="2+2">2+2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="3+1">3+1</asp:ListItem>
                            <asp:ListItem Value="3+2">3+2</asp:ListItem>
                            <asp:ListItem Value="4+1">4+1</asp:ListItem>
                            <asp:ListItem Value="4+2">4+2</asp:ListItem>
                            <asp:ListItem Value="4+3">4+3</asp:ListItem>
                            <asp:ListItem Value="4+4">4+4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="5+1">5+1</asp:ListItem>
                            <asp:ListItem Value="5+2">5+2</asp:ListItem>
                            <asp:ListItem Value="5+3">5+3</asp:ListItem>
                            <asp:ListItem Value="5+4">5+4</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="6+1">6+1</asp:ListItem>
                            <asp:ListItem Value="6+2">6+2</asp:ListItem>
                            <asp:ListItem Value="6+3">6+3</asp:ListItem>
                            <asp:ListItem Value="6+4">6+4</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="7+1">7+1</asp:ListItem>
                            <asp:ListItem Value="7+2">7+2</asp:ListItem>
                            <asp:ListItem Value="7+3">7+3</asp:ListItem>
                            <asp:ListItem Value="7+4">7+4</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="8+1">8+1</asp:ListItem>
                            <asp:ListItem Value="8+2">8+2</asp:ListItem>
                            <asp:ListItem Value="8+3">8+3</asp:ListItem>
                            <asp:ListItem Value="8+4">8+4</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="9+1">9+1</asp:ListItem>
                            <asp:ListItem Value="9+2">9+2</asp:ListItem>
                            <asp:ListItem Value="9+3">9+3</asp:ListItem>
                            <asp:ListItem Value="9+4">9+4</asp:ListItem>
                            <asp:ListItem Value="9+5">9+5</asp:ListItem>
                            <asp:ListItem Value="9+6">9+6</asp:ListItem>
                            <asp:ListItem Value="10+1">10+1</asp:ListItem>
                            <asp:ListItem Value="10+2">10+2</asp:ListItem>
                            <asp:ListItem Value="100">10 Üzeri</asp:ListItem>

                        </asp:DropDownList>
                    </td>
                    <td id="Td19" class="auto-style11" runat="server">Yatak Odası</td>
                    <td id="Td20" class="auto-style9" runat="server">:</td>
                    <td id="Td21" runat="server">
                        <asp:DropDownList ID="ddYatakOdası" runat="server">
                            <asp:ListItem Value="0">Yatak Oda Sayısı Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>910</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="trEvBalkonBahce">
                    <td id="Td22" class="auto-style12" runat="server">Balkon</td>
                    <td id="Td23" class="auto-style9" runat="server">:</td>
                    <td id="Td24" class="auto-style10" runat="server">
                        <asp:DropDownList ID="ddBalkon" runat="server">
                            <asp:ListItem Value="0">Balkon Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem>Yok</asp:ListItem>
                            <asp:ListItem>Var</asp:ListItem>
                            <asp:ListItem>Teras</asp:ListItem>
                            <asp:ListItem>Balkon ve Teras</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td id="Td25" class="auto-style11" runat="server">Bahçe</td>
                    <td id="Td26" class="auto-style9" runat="server">:</td>
                    <td id="Td27" runat="server">
                        <asp:DropDownList ID="ddBahce" runat="server">
                            <asp:ListItem Value="0">Bahçe Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem>Yok</asp:ListItem>
                            <asp:ListItem>Var</asp:ListItem>
                            <asp:ListItem>Ortak Kullanım</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">Isınma Tipi</td>
                    <td class="auto-style9">:</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="ddisinmaTip" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">Yakıt Tipi</td>
                    <td class="auto-style9">:</td>
                    <td>
                        <asp:DropDownList ID="ddYakitTipi" runat="server">
                            <asp:ListItem Value="0">Yakıt Tipi Seç</asp:ListItem>
                            <asp:ListItem>Bilgi Yok</asp:ListItem>
                            <asp:ListItem>Doğalgaz</asp:ListItem>
                            <asp:ListItem>Kömür / Odun</asp:ListItem>
                            <asp:ListItem>Akaryakıt</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="block" id="divisKullanimAmaci" runat="server" visible="False">
        <p class="block-heading">
            Kullanım Amacı - Birden fazla amaçla kullanılabilen gayrimenkuller için çoklu seçim yapabilirsiniz.
        </p>
        <div class="block-body">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbAtolye" runat="server" Text="Atölye" Width="50px" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbBanka" runat="server" Text="Banka" Width="50px" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbDershane" runat="server" Text="Dershane" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbFabrika" runat="server" Text="Fabrika" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbShowroom" runat="server" Text="Showroom" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbHastane" runat="server" Text="Hastane" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbMarket" runat="server" Text="Market" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbMuayenehane" runat="server" Text="Muayenehane" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbOfis" runat="server" Text="Ofis" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbPastane" runat="server" Text="Pastane" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbPoliklinik" runat="server" Text="Poliklinik" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbRestoran" runat="server" Text="Restoran" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbUretimTesis" runat="server" Text="Üretim Tesisi" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbMagaza" runat="server" Text="Mağaza" />
                    </td>
                    <td class="auto-style14">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </div>

    <div class="block" id="divicOzellikler" runat="server">
        <p class="block-heading">
            İç Donanım Özellikleri - Gayrimenkulde mevcut olmayan iç donanım özelliklerini işaretlemeyiniz!

        </p>
        <div class="block-body">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbAdsl" runat="server" Text="Adsl" Width="50px" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbJakuzi" runat="server" Text="Jakuzi" Width="50px" />
                    </td>
                    <td class="auto-style17">
                        <asp:CheckBox ID="cbBoyali" runat="server" Text="Boyalı" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbkuvet" runat="server" Text="Küvet" />
                    </td>
                     <td class="auto-style16">
                        <asp:CheckBox ID="cbPanjur" runat="server" Text="Panjur" />
                    </td>
                     <td class="auto-style15">
                        <asp:CheckBox ID="cbcamasir" runat="server" Text="Çamaşır Odası" />
                    </td>
                     <td>
                        <asp:CheckBox ID="cbmarley" runat="server" Text="Marley" />
                    </td>
                    
                    
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbAsansor" runat="server" Text="Asansör" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbKartonPiyer" runat="server" Text="Kartonpiyer" />
                    </td>
                    <td class="auto-style17">
                        <asp:CheckBox ID="cbSofben" runat="server" Text="Şofben" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbDiafon" runat="server" Text="Diafon" />
                    </td>
                     <td class="auto-style16">
                        <asp:CheckBox ID="cbsomine" runat="server" Text="Şömine" />
                    </td>
                     <td class="auto-style15">
                        <asp:CheckBox ID="cbebeveyn" runat="server" Text="Ebeveyn Banyolu" />
                    </td>
                     <td>
                        <asp:CheckBox ID="cbparke" runat="server" Text="Parke" />
                    </td>
                   
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbDusaKabin" runat="server" Text="Duşakabin" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbMutfakDgaz" runat="server" Text="Mutfak Doğalgazı" />
                    </td>
                    <td class="auto-style17">
                        <asp:CheckBox ID="cbAhsapDograma" runat="server" Text="Ahşap Doğrama" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbJenerator" runat="server" Text="Jeneratör" />
                    </td>
                     <td class="auto-style16">
                        <asp:CheckBox ID="cbfiberinternet" runat="server" Text="Fiber İnternet" />
                    </td>
                     <td class="auto-style15">
                        <asp:CheckBox ID="cbhidrofor" runat="server" Text="Hidrofor" />
                    </td>
                     <td>
                        <asp:CheckBox ID="cbspotisik" runat="server" Text="Spot Işık" />
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbGommeDolab" runat="server" Text="Gömme Dolab" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbSauna" runat="server" Text="Sauna" />
                    </td>
                    <td class="auto-style17">
                        <asp:CheckBox ID="cbBeyazEsya" runat="server" Text="Beyaz Eşyalı" Width="80px" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbLaminant" runat="server" Text="Laminant" />
                    </td>
                     <td class="auto-style16">
                        <asp:CheckBox ID="cbalarm" runat="server" Text="Alarm" />
                    </td>
                     <td class="auto-style15">
                        <asp:CheckBox ID="cbkablo" runat="server" Text="Kavlo TV-Uydu" />
                    </td>
                     <td class="auto-style15">
                        <asp:CheckBox ID="cbkiler" runat="server" Text="Kiler" />
                    </td>
                   
                </tr>
                  <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbYerdenisitma" runat="server" Text="Yerden Isıtma" Width="100px" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbCelikKapi" runat="server" Text="Çelik Kapı" Width="70px" />
                    </td>
                    <td class="auto-style17">
                        <asp:CheckBox ID="cbGiyinmeOda" runat="server" Text="Giyinme Odası" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbisicam" runat="server" Text="Isıcam" />
                    </td>
                     <td class="auto-style16">
                        <asp:CheckBox ID="cbkapici" runat="server" Text="Kapıcı" />
                    </td>
                     <td class="auto-style15">
                        <asp:CheckBox ID="cbmobilya" runat="server" Text="Mobilyalı" />
                    </td>
                     <td>
                        <asp:CheckBox ID="cbpvc" runat="server" Text="PVC Doğrama" />
                    </td>
                    
                </tr>
                 <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbKlima" runat="server" Text="Klima" Width="50px" />
                    </td>
                    <td class="auto-style14">
                        &nbsp;</td>
                   
                    
                </tr>
                 

            </table>

        </div>
    </div>
       <div class="block" id="divDisOzellikler" runat="server">
        <p class="block-heading">
           Dış Donanım Özellikleri - Gayrimenkulde mevcut olmayan dış donanım özelliklerini işaretlemeyiniz!

        </p>
        <div class="block-body">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbsiteicinde" runat="server" Text="Site İçinde" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbguvenlik" runat="server" Text="Güvenlik" Width="50px" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbacikotopark" runat="server" Text="Açık Otopark" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbkapaliotopark" runat="server" Text="Kapalı Otopark" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cboyunparki" runat="server" Text="Oyun Parkı" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbyuzmehavuzu" runat="server" Text="Yüzme Havuzu" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbsaglikmerkezi" runat="server" Text="Sağlık Hizmetleri" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbalisveris" runat="server" Text="Alışveriş" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbsportesisi" runat="server" Text="Spor Tesisi" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbsudeposu" runat="server" Text="Su Deposu" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbkres" runat="server" Text="Kreş" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbymerdiven" runat="server" Text="Yangın Merdiveni" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        &nbsp;</td>
                    <td class="auto-style14">
                        &nbsp;</td>
                    <td class="auto-style14">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </div>
    <div class="block" id="divAltYapi" runat="server" visible="False">
        <p class="block-heading">
            Alt Yapı Durumu - İlanını verdiğiniz gayrimenkulün alt yapı&nbsp; durumunu seçiniz. Birden fazla durum için çoklu seçim yapabilirsiniz.

        </p>
        <div class="block-body">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbimarli" runat="server" Text="İmarlı" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbimarsiz" runat="server" Text="İmarsız" Width="50px" />
                    </td>
                    <td class="auto-style31">
                        <asp:CheckBox ID="cbifrazli" runat="server" Text="İfrazlı" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbParselli" runat="server" Text="Parselli" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbHisseli" runat="server" Text="Hisseli" />
                    </td>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbTapulu" runat="server" Text="Tapulu" />
                    </td>
                    <td class="auto-style31">
                        <asp:CheckBox ID="cbruhsat" runat="server" Text="İnşaat Ruhsatı Alınmış" />
                    </td>
                    <td>
                        <asp:CheckBox ID="cbturizimimar" runat="server" Text="Turizim İmarlı" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:CheckBox ID="cbyatirimtesvik" runat="server" Text="Yatırım Teşviki" />
                    </td>
                    <td class="auto-style14">
                        &nbsp;</td>
                    <td class="auto-style31">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        &nbsp;</td>
                    <td class="auto-style14">
                        &nbsp;</td>
                    <td class="auto-style31">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </div>
        <div class="block" id="divCevreOzellik" runat="server">
        <p class="block-heading">
            Çevre Özellikleri - Gayrimenkulde mevcut olmayan çevre özelliklerini işaretlemeyiniz!

        </p>
        <div class="block-body">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style24">
                        <asp:CheckBox ID="cbbogaz" runat="server" Text="Boğaz Manzarası" />
                    </td>
                    <td class="auto-style26">
                        <asp:CheckBox ID="cbdeniz" runat="server" Text="Deniz Manzarası" />
                    </td>
                    <td class="auto-style28">
                        <asp:CheckBox ID="cbdoga" runat="server" Text="Doğa İçinde" />
                    </td>
                    <td class="auto-style23">
                        <asp:CheckBox ID="cbgol" runat="server" Text="Göl Manzarası" />
                    </td>
                   
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:CheckBox ID="cbdenizeyakin" runat="server" Text="Denize Yakın" />
                    </td>
                    <td class="auto-style27">
                        <asp:CheckBox ID="cbdenizesifir" runat="server" Text="Denize Sıfır" />
                    </td>
                    <td class="auto-style29">
                        <asp:CheckBox ID="cbcaddeye" runat="server" Text="Caddeye Yakın" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbhavaalani" runat="server" Text="Havaalanına Yakın" />
                    </td>
                    
                   
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:CheckBox ID="cbtopluulasim" runat="server" Text="Toplu Ulaşıma Yakın" />
                    </td>
                    <td class="auto-style27">
                        <asp:CheckBox ID="cbotoban" runat="server" Text="Otobana Yakın" />
                    </td>
                    <td class="auto-style29">
                        <asp:CheckBox ID="cbmetro" runat="server" Text="Metroya Yakın" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbilkogretim" runat="server" Text="İlköğretim Okulu" />
                    </td>
                    
                    
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:CheckBox ID="cblise" runat="server" Text="Lise" />
                    </td>
                    <td class="auto-style27">
                        <asp:CheckBox ID="cbuniversite" runat="server" Text="Üniversite" />
                    </td>
                    <td class="auto-style29">
                        <asp:CheckBox ID="cbeczane" runat="server" Text="Eczane" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbhastaneyakin" runat="server" Text="Hastane" />
                    </td>
                   
                   
                </tr>
                  <tr>
                    <td class="auto-style25">
                        <asp:CheckBox ID="cbsaglikocagi" runat="server" Text="Sağlık Ocağı" />
                    </td>
                    <td class="auto-style27">
                        <asp:CheckBox ID="cbmarketyakin" runat="server" Text="Market" />
                    </td>
                    <td class="auto-style29">
                        <asp:CheckBox ID="cbpark" runat="server" Text="Park" />
                    </td>
                    <td class="auto-style15">
                        <asp:CheckBox ID="cbpazar" runat="server" Text="Semt Pazarı" />
                    </td>
                   
                    
                </tr>
                 <tr>
                    <td class="auto-style25">
                        <asp:CheckBox ID="cbpolis" runat="server" Text="Polis Merkezi" />
                    </td>
                    <td class="auto-style27">
                        <asp:CheckBox ID="cbamerkezi" runat="server" Text="Alışveriş Merkezi" />
                     </td>
                   
                    
                </tr>
                 

            </table>

        </div>
    </div>
    <div class="block" id="div1" runat="server">
        <p class="block-heading">
            Açıklama

        </p>
        <div class="block-body">

            <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" Width="500px" Height="120px"></CKEditor:CKEditorControl>

            <br />
            <asp:Label ID="Label1" runat="server" Text="Video URL : "></asp:Label>
            <asp:TextBox ID="txtUrl" runat="server" Width="403px"></asp:TextBox>

        </div>
    </div>
                <table class="auto-style1">
        <tr>
            <td class="auto-style32"></td>
            <td class="auto-style32">
                <asp:Button ID="btnEkle" runat="server" CssClass="btn" Height="40px" Text="İlanı Güncelle" ValidationGroup="grbilan" Width="110px" OnClick="btnEkle_Click" />
                &nbsp;<asp:Button ID="btnGeri" runat="server" CssClass="btn" Height="40px" Text="&lt;&lt; Geri" Width="110px" OnClick="btnGeri_Click" />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grbilan" />
                <br />
            </td>
            <td class="auto-style32"></td>
        </tr>
    </table>
            </ContentTemplate>
          

        </asp:TabPanel>
        <asp:TabPanel ID="tabResim" runat="server" HeaderText="İlan Resimleri">
            <ContentTemplate>
               <div class="block">
        <p class="block-heading">İlan Resimleri - Lütfen resimlerin düzgün olmasına özen gösteriniz.</p>
        <div class="block-body">
             <table class="auto-style1">
                    <tr>
                        <td class="auto-style88"></td>
                        <td class="auto-style89">Resim:</td>
                        <td class="auto-style63">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:FileUpload ID="FuResim" runat="server" Visible="false" />
                            &nbsp;<asp:Button ID="btnResimYukle" runat="server" CssClass="btn" Text="Resim Yükle" OnClick="btnResimYukle_Click" Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8"></td>
                        <td class="auto-style87"></td>
                        <td class="auto-style66">
                            <asp:Label ID="lblResim" runat="server"></asp:Label>
                        </td>
                    </tr>

                </table>

                <table class="auto-style1">
                    <tr>
                        <td class="auto-style5">&nbsp;</td>
                        <td>

                            <br />

                            <br />
                            <asp:DataList ID="DlisResimler" runat="server" RepeatDirection="Horizontal" RepeatColumns="6">
                                <ItemTemplate>
                                    <table class="auto-style1">

                                        <tr>
                                            <td>
                                                <img src="/Resimler/ilan/150/<%#Eval("ResimYolu150")%> " width="130" alt="" /></td>
                                        </tr>
                                        <tr>
                                            <td><a href="ilanguncelle.aspx?ilan=<%#Eval("ilanId")%>&islem=AnaResim&Resim=<%#Eval("ResimId")%>"><span class="span-red"><span class="span-red">Ana Resim Yap</span><br /></a>
                                                <a onclick="return confirm('Bu resmi silmek istediğinizden emin misiniz?');" href="ilanguncelle.aspx?ilan=<%#Eval("ilanId")%>&islem=sil&Resim=<%#Eval("ResimId")%>"><span class="span-red">Resmi Sil</span></a></td>
                                        </tr>

                                    </table>
                                </ItemTemplate>
                            </asp:DataList>

                        </td>

                    </tr>
                </table>
        </div>
    </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    
</asp:Content>