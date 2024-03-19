<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userAltilan.ascx.cs" Inherits="WEBEmlak.user.userAltilan" %>
<div class="carousel">
    <h2 class="page-header">İlanlar</h2>
    
           
        
    <div class="content">
         
        <a class="carousel-prev" href="detail.html">Geri</a>
        <a class="carousel-next" href="detail.html">İleri</a>
         
        <ul>
           <%--  <asp:Repeater ID="RpHitilanlar" runat="server">--%>
            <asp:DataList ID="RpHitilanlar" runat="server" RepeatColumns="4">
        <ItemTemplate>
         
            <li>
                
                <div class="image">

                    <a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"></a>
                    <img src="../Resimler/ilan/800/<%#Eval("AnaResim150")%>" alt="<%#Eval("ilanAdi")%>" title="<%#Eval("ilanAdi")%>"width="265px">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="/<%#Eval("ilanId")%>-<%#Kontrol.UrlSeo(Eval("ilanAdi").ToString().ToLower())%>.html" title="<%#Eval("ilanAdi")%>"><%#Eval("ilanAdi")%></a></h3>
                </div><!-- /.title -->
                <div class="location"><!-- /.location-->
              
                <%--<div class="price"> <%#Eval("Fiyat","{0:c}")%></div><!-- .price -->--%>
                    <div class=""> <span class="key"><%#Eval("Metrekare")%>m<sup>2</sup></span>
                </div>
                <div class="area">
                    <span class="key"><%#Eval("ilAdi")%> - <%#Eval("ilceAdi")%></span></div>
                   <!-- /.area --></div>
                <%--<div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->--%>
            </li>
            </ItemTemplate></asp:DataList>
    <%--</asp:Repeater>--%>
                      

      
         </ul>
              
            
      
        
        
          
    </div><!-- /.content -->
    
  
</div>