using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
namespace WEBEmlak
{
    public partial class msDetay : System.Web.UI.MasterPage
    {
        baglanti veri = new baglanti();
        public string face, twit, Logo, Title;
        protected void Page_Load(object sender, EventArgs e)
        {
            string secilitem = veri.GetDataCell("Select SecTema from tema");


            HtmlLink myHtmlLink = new HtmlLink();
            myHtmlLink.Href = secilitem;
            myHtmlLink.Attributes.Add("rel", "stylesheet");
            myHtmlLink.Attributes.Add("type", "text/css");

            Page.Header.Controls.Add(myHtmlLink);
            if (!Page.IsPostBack)
            {
                
            }
            TitleGetir();
            DanismanGetir();
            Rastgeleilan();
            SayfaGetir();
            Sonucilan();
            BilgiGet();
        }
        void BilgiGet()
        {
            DataRow drBilgi = veri.GetDataRow("Select * From iletisim");
            lblTel.Text = drBilgi["Tel1"].ToString();
            lblGsm.Text = drBilgi["Tel2"].ToString();
            lblFax.Text = drBilgi["Fax"].ToString();
            lblMail.Text = drBilgi["Mail"].ToString();
            lblAdres.Text = drBilgi["Adres"].ToString();
        }
        void DanismanGetir()
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtKayit = veri.GetDataTable("Select Top 3 * From Danisman Where Aktif=1 Order By NewId()");
                    rpDanisman.DataSource = dtKayit;
                    rpDanisman.DataBind();

                }
            }
            catch (Exception)
            {

            }

        }
        void Rastgeleilan()
        {
            try
            {
                if (Page.IsPostBack == false)
                {

                    DataTable dtKayit = veri.GetDataTable("Select Top 3 Left(ilanAdi,25)+'...'as kisaad,ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800 From ilanlar where Aktif=1 Order By NewId()");
                    //RpRastgele.DataSource = dtKayit;
                    //RpRastgele.DataBind();

                }
            }
            catch (Exception)
            {

            }

        }
        void SayfaGetir()
        {
            try
            {

                if (!Page.IsPostBack)
                {
                    DataTable dtKayit = veri.GetDataTable("Select Top 8 * From Haberler Where AktifMi=1 and SayfaMi=1 Order By HaberId Desc");
                    RpSayfalar.DataSource = dtKayit;
                    RpSayfalar.DataBind();
                }
            }
            catch (Exception)
            {

            }

        }
        void TitleGetir()
        {
            try
            {

                DataRow dtKayit = veri.GetDataRow("Select * From MetaTag");
                Title = dtKayit["Title"].ToString();

                face = dtKayit["Facebook"].ToString();
                twit = dtKayit["Twitter"].ToString();
                //divFooter.InnerText = dtKayit["Footer"].ToString();

                if (dtKayit["SiteLogo"].ToString() != "")
                {
                    divLogo.Visible = true;
                    Logo = dtKayit["SiteLogo"].ToString();
                }



            }
            catch (Exception)
            {

            }

        }
        void Sonucilan()
        {
            try
            {
                if (Page.IsPostBack == false)
                {

                    DataTable dtKayit = veri.GetDataTable("Select Top 3 Left(ilanAdi,25)+'...'as kisaad,ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800 From ilanlar where Aktif=1 Order By NewId()");
                    RpRastgele.DataSource = dtKayit;
                    RpRastgele.DataBind();

                }
            }
            catch (Exception)
            {

            }

        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ara.aspx?s=k&bul=" + Kontrol.AramaKontrol(txtAra.Text));
        }
    }
}