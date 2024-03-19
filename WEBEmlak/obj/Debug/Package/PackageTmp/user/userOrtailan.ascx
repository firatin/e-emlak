<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userOrtailan.ascx.cs" Inherits="WEBEmlak.user.userOrtailan" %>
<div class="properties-grid">
    <div class="row">
        <asp:DataList ID="rpOrtailan" runat="server" RepeatColumns="3">
            <ItemTemplate>
        <div class="property myspan">
            <div class="image">
              
                <div class="content rsmbyt">
                    <a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"></a>
                    <img src="../Resimler/ilan/800/<%#Eval("AnaResim150")%>" alt="<%#Eval("ilanAdi")%>" title="<%#Eval("ilanAdi")%>"  >
                </div><!-- /.content -->

                <div class="price"> <%#Eval("Fiyat","{0:c}")%></div><!-- /.price -->
                <div class="reduced"> <%#Eval("Tur")%> </div><!-- /.reduced -->
            </div><!-- /.image -->

            <div class="title" >
                <h2><a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"><%#Kontrol.OzetCek((Eval("ilanAdi").ToString()),35)%>...</a></h2>
            </div><!-- /.title -->

                       <div class="content"><div class="location"><%#Eval("ilAdi")%> - <%#Eval("ilceAdi")%></div>

                            <div class="area" >
                <span class="key">Metrekare:</span><!-- /.key -->
                <span class="value"> <%#Eval("Metrekare")%>m<sup>2</sup></span><!-- /.value -->
                    
           </div>
                       </div></div><!-- /.bedrooms -->
          
           
            
                </ItemTemplate>
        </asp:DataList> 
        </div><!-- /.property -->
      
    <!-- /.row -->
      
</div>