<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userSlider.ascx.cs" Inherits="WEBEmlak.user.userArama" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

 <div class="slider-wrapper">
    <div class="slider">
        <div class="slider-inner">
            <div class="row">
                <div class="images span9">
                    <div class='iosSlider'>
                        <div class='slider-content'>
                   
                             <asp:Repeater ID="rpSlider" runat="server"><ItemTemplate>

                            <div class="slide">
                                <img src="../Resimler/ilan/800/<%#Eval("AnaResim800")%>" width="880" alt="<%#Eval("ilanAdi")%>" title="<%#Eval("ilanAdi")%>">

                                <div class="slider-info">
                                    <div class="price">
                                        <h2><a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"><%#Eval("ilanAdi")%></a></h2>
                                   
                                    </div><!-- /.price -->
                                   
                                    <div class="bathrooms"><%#Eval("Fiyat","{0:c}")%></div><!-- /.bathrooms -->
                                    <div class="bathrooms"><%#Eval("ilAdi")%> - <%#Eval("ilceAdi")%>  -  <%#Eval("Metrekare")%>m<sup>2</sup> </div><!-- /.bedrooms -->
                                     
                                       
                                </div><!-- /.slider-info -->
                            </div><!-- /.slide -->
                                 </ItemTemplate>
                                 </asp:Repeater>
                        </div><!-- /.slider-content -->
                    </div><!-- .iosSlider -->

                    <ul class="navigation">
                        <li class="active"><a>1</a></li>
                        <li><a>2</a></li>
                        <li><a>3</a></li>
                    </ul><!-- /.navigation-->
                </div><!-- /.images -->
                <div class="span3">
                    <div class="property-filter">
                        <div class="content">
                            <form method="get" action="?">
                                <div class="location control-group">
                                    <label class="control-label" for="inputLocation">
                                        Detayli Arama
                                    </label>
                                    <div class="controls">
                                        
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->
                              <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>--%>
                                <div class="type control-group">
                                   
                                 <asp:DropDownList ID="ddTip" runat="server" Width="170px">
                                    
                                                <asp:ListItem Value="1">Konut İlanı</asp:ListItem>
                                                <asp:ListItem Value="2">İşyeri İlanı</asp:ListItem>
                                                <asp:ListItem Value="3">Arsa İlanı</asp:ListItem>

                                            </asp:DropDownList><br /><br /><br />

                                              <asp:DropDownList ID="ddil" runat="server" Width="170px" AutoPostBack="True" OnSelectedIndexChanged="ddil_SelectedIndexChanged">
                                               

                                            </asp:DropDownList><br /><br /><br />

                                           <asp:DropDownList ID="ddilce" runat="server" Width="170px" AutoPostBack="True" OnSelectedIndexChanged="ddilce_SelectedIndexChanged">
                                               <asp:ListItem Value="0">Önce İl Seçiniz</asp:ListItem>
                                               

                                            </asp:DropDownList><br /><br /><br />

                                         <asp:DropDownList ID="ddSemt" runat="server" Width="170px" OnSelectedIndexChanged="ddil_SelectedIndexChanged">
                                             <asp:ListItem Value="0">Önce İlçe Seçiniz</asp:ListItem>
                                               

                                            </asp:DropDownList><br /><br /><br />

                                           

                                <div class="rent control-group">
                                    <div class="controls">
                                        <label class="checkbox" for="inputRent">
                                            <asp:CheckBox ID="cbSatilik" runat="server" Text="Satılık" />
                                        </label>
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="sale control-group">
                                    <div class="controls">
                                        <label class="checkbox" for="inputSale">
                                          <asp:CheckBox ID="cbKiralik" runat="server" Text="Kiralık" />
                                            </label>
                                             </div>
                                    </div></div></form>
                                       <%--</ContentTemplate></asp:UpdatePanel>--%>
                                         <div class="form-actions">
                                   <!-- /.controls -->
                                        <label class="checkbox" for="inputSale">
                                             <asp:Button ID="btnAra" runat="server" Text="Filtrele" OnClick="btnAra_Click"  BorderStyle="None" Class="btn" Height="30px" Width="230px" ForeColor="White" />
                                        </label>
                                </div><!-- /.control-group -->
</div>
                                <!-- /.control-group -->

                                <!-- /.control-group -->

                                

                               <!-- /.form-actions -->
                            </form>
                        </div><!-- /.content -->
                    </div><!-- /.property-filter -->

                </div><!-- /.span3 -->
            </div><!-- /.row -->
        </div><!-- /.slider-inner -->
    </div><!-- /.slider -->
<!-- /.slider-wrapper -->