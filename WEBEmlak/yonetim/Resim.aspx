<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="Resim.aspx.cs" Inherits="WEBEmlak.yonetim.Resim" %>
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divgizle" runat="server" visible="false">// şimdilk gerek yok hepsini gizle
      Resim Yükleyin: <asp:FileUpload ID="FileUpload1" runat="server" />
      <div class="block">
        <p class="block-heading">İlan Resimleri - Lütfen resimlerin düzgün olmasına özen gösteriniz.</p>
        <div class="block-body">
         
           
      
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
        </div>
</asp:Content>
