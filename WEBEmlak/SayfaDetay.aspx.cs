using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WEBEmlak
{
    public partial class SayfaDetay : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string SayfaId;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            try
            {
                SayfaId = Kontrol.SayiKontrol(Kontrol.UrlSeo(RouteData.Values["SayfaId"].ToString()));
            }
            catch (Exception)
            {

                Response.Redirect("Default.aspx");

            }

            SayfaId = Kontrol.SayiKontrol(Kontrol.Temizle(RouteData.Values["SayfaId"].ToString()));
            if (SayfaId != null)
            {
                DataRow DrSayfa = veri.GetDataRow("Select * From Haberler Where AktifMi=1 and HaberId=" + SayfaId);

                if (DrSayfa != null)
                {

                    Page.Title = DrSayfa["HaberAdi"].ToString();
                    Page.MetaDescription = DrSayfa["HaberAdi"].ToString();
                    Page.MetaKeywords = DrSayfa["HaberAdi"].ToString();

                    lbl1.Text = DrSayfa["HaberAdi"].ToString();

                    ltrlDetay.Text = DrSayfa["Detay"].ToString();
                    divTarih.InnerText = DrSayfa["Tarih"].ToString();


                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}