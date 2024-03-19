<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userMenu.ascx.cs" Inherits="WEBEmlak.user.userMenu" %>
   <div id="navigation">
                        <div class="container">
                            <div class="navigation-wrapper">
                                <div class="navigation clearfix-normal">

                                    <ul class="nav">
                                        <li>
                                            <a href="Default.aspx">Anasayfa</a>
                                        </li>
                                        <%--<ul class="nav">--%>
                                        <li class="menuparent">
                                            <span class="menuparent nolink">İlanlar</span>
                                            <ul>
                                                <li><a href="/ilan.aspx?ilan=konut">Konut</a></li>
                                                <li><a href="/ilan.aspx?ilan=isyeri">İş Yeri</a></li>
                                                <li><a href="/ilan.aspx?ilan=arsa">Arsa</a></li>

                                            </ul>
                                        </li>



                                        <li class="menuparent">
                                            <span class="menuparent nolink">Danismanlar</span>
                                            <ul>
                                                <li><a href="Danismanlar.aspx">Danismanlarimiz</a></li>
                                                <li><a href="Basvuru.aspx">Danismanlik Basvurusu</a></li>
                                            </ul>

                                        </li>
                                        <li>
                                            <a href="Haberler.aspx">Haberler</a>
                                        </li>
                                        <li class="menuparent">
                                            <span class="menuparent nolink">Hakkımızda</span>
                                            <ul>
                                                <asp:Repeater ID="RpSayfalar" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href="/<%#Kontrol.UrlSeo(Eval("HaberAdi").ToString().ToLower())%>-<%#Eval("HaberId")%>"><%#Eval("HaberAdi")%></a></li>

                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </ul>
                                        </li>


                                        <li>
                                            <a href="iletisim.aspx">Bize Ulasin</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav -->



                                    <div class="content">
                                        <div class="site-search">
                                            <asp:TextBox ID="txtAra" runat="server"></asp:TextBox>
                                            <asp:Button ID="btnAra" runat="server" Text="Ara" Width="83px" OnClick="btnAra_Click" BorderStyle="None" Height="40px" />
                                            
                                        </div>
                                        <!-- /.site-search -->
                                    </div>
                                    <%-- <form method="get" class="site-search" action="?">
                                <div class="input-append">
                                    <input title="Enter the terms you wish to search for." class="search-query span2 form-text" placeholder="Search" type="text" name=""/>
                                    <button type="submit" class="btn"><i class="icon-search"></i></button>
                                </div><!-- /.input-append -->
                            </form><!-- /.site-search -->--%>
                                </div>
                                <!-- /.navigation -->
                            </div>
                            <!-- /.navigation-wrapper -->
                        </div>
                        <!-- /.container -->
                    </div>