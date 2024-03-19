<%@ Page Title="" Language="C#" MasterPageFile="~/AnaSite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WEBEmlak.Default" %>

<%@ Register Src="~/user/userSlider.ascx" TagPrefix="uc1" TagName="userSlider" %>
<%@ Register Src="~/user/userAltilan.ascx" TagPrefix="uc1" TagName="userAltilan" %>


<%@ Register src="user/userOrtailan.ascx" tagname="userOrtailan" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CntSlider" runat="server">
    
    <uc1:userSlider runat="server" ID="userSlider" />
  

    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CntUserOrtailan" runat="server">
    <div class="title"><h2><br /></h2></div>
                                                
    <uc2:userOrtailan ID="userOrtailan1" runat="server" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CntUserSagAlt" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CntUserAltilan" runat="server">
</asp:Content>

