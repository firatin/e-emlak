<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSite.Master" AutoEventWireup="true" CodeBehind="Ara.aspx.cs" Inherits="WEBEmlak.Ara" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register src="user/userOrtailan.ascx" tagname="userOrtailan" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
   <div class="properties-grid">
    <div class="row">
        <asp:DataList ID="RpOrtailanlar" runat="server" RepeatColumns="3">
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
 <cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri"
        LabelText="Sayfa:" NextText="İleri »" PageNumbersDisplay="Numbers" PageSize="12"
        ResultsFormat="Gösterilen Kayıtlar {0}-{1} (Toplam {2})"
        QueryStringKey="Sayfa">

    </cc1:CollectionPager>
    <div id="divVitrinilan" runat="server" visible="false"> 
        <%--eğer danışmana ait ilanlar yoksa ana sayfadaki ilanları getir--%>
        <uc1:userOrtailan ID="userOrtailan1" runat="server" />
    </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
   
</asp:Content>
