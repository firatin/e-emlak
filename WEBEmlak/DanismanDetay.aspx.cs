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
    public partial class DanismanDetay : System.Web.UI.Page
    {

        baglanti veri = new baglanti();
        string DanismanId; public string Resmi, Mail;
        Label lbl1;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl1 = (Label)Master.FindControl("lblBilgi");
            try
            {
                DanismanId = Kontrol.SayiKontrol(Kontrol.UrlSeo(RouteData.Values["DanismanId"].ToString()));
            }
            catch (Exception)
            {

                Response.Redirect("Default.aspx");

            }

            DanismanId = Kontrol.SayiKontrol(Kontrol.Temizle(RouteData.Values["DanismanId"].ToString()));
            if (DanismanId != null)
            {
                DanismanGetir();
                Danismanilanlari();
            }
        }
        void DanismanGetir()
        {
            DataRow DrSayfa = veri.GetDataRow("Select * From Danisman Where Aktif=1 and DanismanId=" + DanismanId);

            if (DrSayfa != null)
            {

                Page.Title = DrSayfa["AdSoyad"].ToString();
                Page.MetaDescription = "Gayrimenkul Danışmanı " + DrSayfa["AdSoyad"].ToString();
                Page.MetaKeywords = "Gayrimenkul Danışmanı " + DrSayfa["AdSoyad"].ToString();

                lbl1.Text = "Gayrimenkul Danışmanı - " + DrSayfa["AdSoyad"].ToString();

                imgResim.ImageUrl = "../Resimler/Danisman/" + DrSayfa["ResimYolu"];
                Mail = DrSayfa["Mail"].ToString();

                lblTel.Text = DrSayfa["Tel"].ToString();
                lblGsm.Text = DrSayfa["Gsm"].ToString();
                lblAdres.Text = DrSayfa["Adres"].ToString();

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        void Danismanilanlari()
        {
            try
            {


                DataTable dtilanlar = veri.GetDataTable("Select ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 and DanismanId=" + DanismanId + "");

                if (dtilanlar.Rows.Count >= 1)
                {
                    lblBaslik.Text = "Danismani Olduğu ilanlar";
                    CollectionPager1.DataSource = dtilanlar.DefaultView;
                    CollectionPager1.BindToControl = RpDanismanilan;
                    RpDanismanilan.DataSource = CollectionPager1.DataSourcePaged;
                    RpDanismanilan.DataBind();
                    
                }
                else
                {
                    lblBaslik.Text = "Danışmana Ait İlan Bulunamadı.";
                    divDanismanilan.Visible = false;
                    divVitrinilan.Visible = true;

                }
            }
            catch (Exception)
            {


            }
        }
    }
}