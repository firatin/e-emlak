<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/AnaPage.Master" AutoEventWireup="true" CodeBehind="Danismanlar.aspx.cs" Inherits="WEBEmlak.yonetim.Danismanlar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 59px;
        }

        .auto-style4 {
            width: 16px;
        }

        .auto-style5 {
            width: 144px;
        }

        .auto-style6 {
            width: 144px;
            height: 43px;
        }

        .auto-style7 {
            width: 16px;
            height: 43px;
        }

        .auto-style8 {
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;<table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <div class="well">

                    <br />
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">Aktif</td>
                            <td class="auto-style4">:</td>
                            <td>
                                <asp:CheckBox ID="cbAktif" runat="server" Checked="True" />
                            </td>
                        </tr>
                       
                        <tr>
                            <td class="auto-style5">Adı Soyadı</td>
                            <td class="auto-style4">:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBaslik" ErrorMessage="Başlık alanını boş geçemezsiniz" ForeColor="Red" ValidationGroup="grbekle">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBaslik" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Mail</td>
                            <td class="auto-style4">:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMail" ValidationGroup="grbekle"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMail" ErrorMessage="*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grbekle"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMail" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style5">Tel</td>
                            <td class="auto-style4">:</td>
                            <td>
                                <asp:TextBox ID="txtTel" runat="server" Width="300px"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="txtTel_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Numbers,Custom" InvalidChars=" " TargetControlID="txtTel" ValidChars=" ">
                                </asp:FilteredTextBoxExtender>
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style5">Gsm</td>
                            <td class="auto-style4">:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtGsm" ErrorMessage="*" ForeColor="Red" ValidationGroup="grbekle"></asp:RequiredFieldValidator>
                             </td>
                            <td>
                                <asp:TextBox ID="txtGsm" runat="server" Width="300px"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="txtGsm_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Numbers,Custom" TargetControlID="txtGsm" ValidChars=" ">
                                </asp:FilteredTextBoxExtender>
                            </td>
                        </tr>
                                <tr>
                            <td class="auto-style5">Adres</td>
                            <td class="auto-style4">:</td>
                            <td>
                                <asp:TextBox ID="txtAdres" runat="server" Width="300px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>                
                        <tr>
                            <td class="auto-style6">Danışman Resimi</td>
                            <td class="auto-style7">:</td>
                            <td class="auto-style8">
                                <asp:Panel ID="Panel" runat="server">
                                    <asp:FileUpload ID="FuResim" runat="server" />
                                    <br />
                                    <asp:Image ID="imgResim" runat="server" Visible="False" Width="100px" />
                                    <asp:Button ID="btnResim" runat="server" CssClass="btn" OnClick="btnResim_Click" Text="Resim Yükle" Visible="False" />
                                    <asp:Button ID="btnResmiSil" runat="server" CssClass="btn" Text="Resmi Sil" Visible="False" OnClick="btnResmiSil_Click" />
                                
                                    <asp:ConfirmButtonExtender ID="btnResmiSil_ConfirmButtonExtender" runat="server" ConfirmText="Dikkat: Bu resmi silmek istediğinizden emin misiniz?" Enabled="True" TargetControlID="btnResmiSil">
                                    </asp:ConfirmButtonExtender>
                                
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnEkle" runat="server" CssClass="btn" OnClick="btnEkle_Click" Text="Ekle" ValidationGroup="grbekle" />
                                &nbsp;<asp:Button ID="btnDuzenle" runat="server" CssClass="btn" Text="Düzenle" ValidationGroup="grbekle" Visible="False" OnClick="btnDuzenle_Click" />
                            &nbsp;<asp:Button ID="btnGeri" runat="server" CssClass="btn" OnClick="btnGeri_Click" Text="Geri" Visible="False" />
                            </td>
                        </tr>
                    </table>


                </div>

            </td>
        </tr>
        <tr>
            <td>

                <div class="well">
                    &nbsp;
            <table class="table">
                <thead>
                    <tr>

                        <th>Danışman</th>
                        <th>Resim</th>
                        <th>Mail</th>
                        <th>Durum</th>
                        <th style="width: 26px;">İşlem</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RpKayit" runat="server">
                        <ItemTemplate>
                            <tr>

                                <td><%#Eval("AdSoyad")%></td>

                                <td>
                                    <img src="/Resimler/Danisman/<%#Eval("ResimYolu")%> " width="60" height="40" title="<%#Eval("AdSoyad")%>" /></td>
                                 <td><%#Eval("Mail")%></td>
                                 <td><%#Eval("Durumadi")%></td>

                                <td>
                                    
                                    <a href="Danismanlar.aspx?DId=<%#Eval("DanismanId")%>&islem=duzenle" title="Düzenle"><i class="icon-pencil"></i></a>

                                    <a onclick="return confirm('Dikkat: (<%#Eval("AdSoyad") %>) Adlı Danışmanı Silmek İstediğinizden Emin Misiniz?');" href="Danismanlar.aspx?DId=<%#Eval("DanismanId")%>&islem=sil" title="Sil"><i class="icon-remove"></i></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

                </div>
                <div class="pagination">
                    <cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" LabelText="Sayfa:" NextText="İleri »" QueryStringKey="Sayfa" ResultsFormat="">
                    </cc1:CollectionPager>
                </div>

                </div>
        </div>
                 
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grbAra" />

            </td>
        </tr>
    </table>
</asp:Content>

