<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSite.Master" AutoEventWireup="true" CodeBehind="Danismanlar.aspx.cs" Inherits="WEBEmlak.Danismanlar" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
    <div class="our-agents-large">

            <asp:DataList ID="RpDanismanilan" runat="server" RepeatColumns="4">
                <ItemTemplate>
    <div class="agent">
        <div class="image">
            <a href="/danisman-<%#Eval("DanismanId")%>-<%#Kontrol.UrlSeo(Eval("AdSoyad").ToString().ToLower())%>">
            
                <asp:Image ID="Image1" runat="server"  width="190" height="200" ImageUrl='<%# String.Format("/Resimler/Danisman/{0}", Eval("ResimYolu")) %>' ToolTip='<%#Eval("AdSoyad")%>' AlternateText='<%#Eval("AdSoyad")%>' />
               
            </a>
        </div><!-- /.image -->

        <div class="body">
            <h3>
                <a href="/danisman-<%#Eval("DanismanId")%>-<%#Kontrol.UrlSeo(Eval("AdSoyad").ToString().ToLower())%>"><%#Eval("AdSoyad")%></a>
            </h3>

        </div><!-- /.body -->

        <div class="info">
            <div class="box">
                <div class="phone">
                    <i class="icon icon-normal-mobile-phone"></i>
                   <%#Eval("Gsm")%>
                </div><!-- /.phone -->
                <div class="office">
                    <i class="icon icon-normal-phone"></i>
                   <%#Eval("Tel")%>
                </div><!-- /.office -->

                <div class="email">
                    <i class="icon icon-normal-mail"></i>
                    <a href="mailto:<%#Eval("Mail")%>">
                        <%#Eval("Mail")%>
                    </a>
                </div><!-- /.email -->
            </div><!-- /.box -->
        </div><!-- /.info -->
    </div><!-- /.agent -->

  </ItemTemplate>
            </asp:DataList>

      
        <cc1:CollectionPager ID="CollectionPager1" runat="server"
         BackText="« Geri" 
                    LabelText="Sayfa:" NextText="İleri »" PageNumbersDisplay="Numbers" PageSize="10" 
                    ResultsFormat="Gösterilen Kayıtlar {0}-{1} (Toplam {2})" 
                    QueryStringKey="Sayfa">
    </cc1:CollectionPager>
        
</div>
   
  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
   
</asp:Content>
