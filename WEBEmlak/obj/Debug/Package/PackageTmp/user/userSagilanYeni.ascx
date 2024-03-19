<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userSagilanYeni.ascx.cs" Inherits="WEBEmlak.user.userSagilanYeni" %>
<div class="hidden-tablet">
                                            <div class="widget properties last">

                                                <div class="title">
                                                    <h2>Yeni İlanlar </h2>
                                                </div>
                                                <!-- /.title -->
                                                <asp:Repeater ID="RpRastgele" runat="server">
                                                    <ItemTemplate>

                                                        <div class="content">
                                                            <div class="property">
                                                                <div class="image">
                                                                    <a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"></a>
                                                                    <img src="../Resimler/ilan/800/<%#Eval("AnaResim150")%>" alt="<%#Eval("ilanAdi")%>" title="<%#Eval("ilanAdi")%>" class="thumbnail-image" width="250" height="250px">
                                                                </div>
                                                                <!-- /.image -->

                                                                <div class="wrapper">
                                                                    <div class="title">
                                                                        <h3>
                                                                            <a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"><%#Eval("kisaad")%></a>
                                                                        </h3>
                                                                    </div>
                                                                    <!-- /.title -->
                                                                    <div class="price"><%#Eval("Fiyat","{0:c}")%></div>
                                                                    <!-- /.price -->
                                                                    <div class="location"><%#Eval("Metrekare")%>m<sup>2</sup></div>
                                                                    <!-- /.location -->
                                                                </div>
                                                                <!-- /.wrapper -->
                                                            </div>
                                                            <!-- /.property -->

                                                        </div>
                                                        <!-- /.content -->
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </div>
                                            <!-- /.properties -->

                                        </div>