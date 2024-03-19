<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSite.Master" AutoEventWireup="true" CodeBehind="DanismanDetay.aspx.cs" Inherits="WEBEmlak.DanismanDetay" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
     <div class="agency">
        <div class="row">
            <div class="image myspan">
                <asp:Image ID="imgResim" runat="server" Width="230" Height="230" AlternateText="Gayrimenkul Danışmanı" ToolTip="Gayrimenkul Danışmanı" />
            </div>
            <!-- /.image -->

            <div class="info span6">
                <div class="box">

                    <table>
    <tr>
        <td><strong>Tel</strong></td>
        <td class="auto-style1">:</td>
        <td>  <asp:Label ID="lblTel" runat="server"></asp:Label></td>
        
    </tr>
    
     <tr>
        <td><strong> Gsm</strong></td>
        <td class="auto-style1">:</td>
        <td><asp:Label ID="lblGsm" runat="server"></asp:Label></td>
    </tr>
                         <tr>
        <td><strong>Email</strong></td>
        <td class="auto-style1">:</td>
        <td> <a href="mailto:<%=Mail%>"><%=Mail%></a></td>
    </tr>
                         <tr>
        <td><strong>Adres</strong></td>
        <td class="auto-style1">:</td>
        <td>  <asp:Label ID="lblAdres" runat="server"></asp:Label></td>
    </tr>
</table>
                  
                </div>
                <!-- /.box -->
            </div>
            <!-- /.info -->
        </div>
        <!-- /.row -->
         <div class="properties-grid">
    <div class="row">
         <h2 class="page-header">
             &nbsp;&nbsp; <asp:Label ID="lblBaslik" runat="server" ></asp:Label></h2>
        <asp:DataList ID="RpDanismanilan" runat="server" RepeatColumns="3">
            <ItemTemplate>
      
                    <div class="property myspan">
                        <div class="image">

                            <div class="content rsmbyt">
                                <a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"></a>
                                <img src="../Resimler/ilan/800/<%#Eval("AnaResim150")%>" alt="<%#Eval("ilanAdi")%>" title="<%#Eval("ilanAdi")%>">
                            </div>
                            <!-- /.content -->

                            <div class="price"><%#Eval("Fiyat","{0:c}")%></div>
                            <!-- /.price -->
                            <div class="reduced"><%#Eval("Tur")%> </div>
                            <!-- /.reduced -->
                        </div>
                        <!-- /.image -->

                        <div class="title">
                            <h2><a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"><%#Kontrol.OzetCek((Eval("ilanAdi").ToString()),35)%>...</a></h2>
                        </div>
                        <!-- /.title -->

                        <div class="content">
                            <div class="location"><%#Eval("ilAdi")%> - <%#Eval("ilceAdi")%></div>

                            <div class="area">
                                <span class="key">Metrekare:</span><!-- /.key -->
                                <span class="value"><%#Eval("Metrekare")%>m<sup>2</sup></span><!-- /.value -->

                            </div>
                        </div>
                    </div>


      </ItemTemplate>
        </asp:DataList>
    </div><!-- /.row -->
       
</div>
       
         
        <div id="divDanismanilan" runat="server">
        </div>
    </div>
    
    <div id="divVitrinilan" runat="server" visible="false"> 
        <%--eğer danışmana ait ilanlar yoksa ana sayfadaki ilanları getir--%>
<%--        <uc1:cntuserortailan ID="UserOrtailan1" runat="server" />--%>
    </div>

    <cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" 
                    LabelText="Sayfa:" NextText="İleri »" PageNumbersDisplay="Numbers" PageSize="9" 
                    ResultsFormat="Gösterilen Kayıtlar {0}-{1} (Toplam {2})" 
                    QueryStringKey="Sayfa">
    </cc1:CollectionPager>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
</asp:Content>
