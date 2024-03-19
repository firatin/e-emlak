<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSite.Master" AutoEventWireup="true" CodeBehind="Haberler.aspx.cs" Inherits="WEBEmlak.Haberler" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
    <div class="properties-rows">
        <div class="row">
            <div class="property span9">
                <asp:Repeater ID="RpHaberler" runat="server">
                    <ItemTemplate>

                        <div class="body span8">
                            <div class="title-price row">
                                <div class="title span4">
                                    <h2><a href="/<%#Kontrol.UrlSeo(Eval("HaberAdi").ToString().ToLower())%>-<%#Eval("HaberId")%>">
                                        <%#Eval("HaberAdi")%>
                                    </a>
                                    </h2>
                                </div>

                            </div>
                            <!-- /.title -->

                            <div class="body">
                                <%#Kontrol.OzetCek(Eval("Detay").ToString(),350)%>
                                
                            </div>
                            <!-- /.body -->
                            <div class="area">
                   
                    <%#Eval("Tarih","{0:dd/MM/yyyy}")%>
                </div>
                            <div class="property-info clearfix">


                                <div class="more-info">
                                    <a href="/<%#Kontrol.UrlSeo(Eval("HaberAdi").ToString().ToLower())%>-<%#Eval("HaberId")%>">Devamı<i
                                        class="icon icon-normal-right-arrow-circle"></i></a>
                                </div>
                            </div>
                            <!-- /.info -->
                        </div>
                        <!-- /.body -->
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- /.row -->
            <div class="pagination pagination-centered">
   
                <cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" 
                    LabelText="Sayfa:" NextText="İleri »" PageNumbersDisplay="Numbers" PageSize="15" 
                    ResultsFormat="Gösterilen Kayıtlar {0}-{1} (Toplam {2})" 
                    QueryStringKey="Sayfa">


                </cc1:CollectionPager>
       
   
</div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
</asp:Content>
