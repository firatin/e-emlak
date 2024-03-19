<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Gkiralik.aspx.cs" Inherits="WEBEmlak.yonetim.Gkiralık" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 59px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
               

            </td>
        </tr>
        <tr>
            <td>
              
                        <div class="well">
                            
                            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
                            &nbsp;
            <table class="table">
                <thead>
                    <tr>

                        <th></th>
                        <th>İlan ID</th>
                        <th>Tc No</th>
                        <th>Ad</th>
                        <th>Soyad</th>
                        <th>Tel</th>
                        <th>E-Mail</th>
                        <th>Giriş Tarih</th>
                        <th>Çıkış Tarih</th>
                        <th>Durumu</th>
                    </tr>
                     
                </thead>
                <tbody>
                    <asp:Repeater ID="rpGunluk" runat="server" OnItemCommand="rpGunluk_ItemCommand"  >
                        <ItemTemplate>
                            
                            <tr>
                                <td>
                             <a href="<%#Eval("ilanID")%>">
                                 <td><%#Eval("ilanID")%></td>
                                 <td><%#Eval("TcNo")%></td>
                                 <td><%#Eval("AD")%></td>
                                 <td><%#Eval("Soyad")%></td>
                                 <td><%#Eval("Tel")%></td>
                                <td><%#Eval("eposta")%></td>
                            <td><%#Eval("GTarih", "{0:d/MM/yyyy}")%></td>

                                <td><%#Eval("CTarih", "{0:d/MM/yyyy}")%></td>
                               <td>
                                <%#Eval("Durumadi")%>
                               </td>
                                 
                                   <td> <asp:ImageButton ID="btnOnay" runat="server"  CommandName="Onayla" CommandArgument='<%#Eval("BasID")%>' ToolTip='<%#Eval("islemyap")%>' ImageUrl='<%#Eval("resim")%>' Width="18px" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>                                   


                        </div>
                       <div class="pagination">
                           <cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" LabelText="Sayfa:" NextText="İleri »" QueryStringKey="Sayfa" ResultsFormat="" PageSize="40">></cc1:CollectionPager>
                        </div>

                        </div>
        </div>
                 
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grbAra" />

            </td>
        </tr>
    </table>
</asp:Content>
