using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.IO;

namespace WEBEmlak.yonetim
{
    public partial class ilanlar : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string islem = "", ilanId = "";
        string ilId, ilceId, semtId, aramadeger, sorgu = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            Page.Form.DefaultButton = btnAra.UniqueID;
            Page.Title = "İlanlar";
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "İlanlar";

            try
            {
                if (Page.IsPostBack == false)
                {
                    ilanGetir();

                    // arama işlemleri

                    ilGetir();

                    // arama son
                }

            }
            catch (Exception)
            {
            }

            try
            {
                islem = Request.QueryString["islem"];
                ilanId = Kontrol.SayiKontrol(Request.QueryString["ilan"]);

                // arama

                ilId = Kontrol.Temizle(Kontrol.SayiKontrol(Request.QueryString["il"]));
                ilceId = Kontrol.Temizle(Kontrol.SayiKontrol(Request.QueryString["ilce"]));
                semtId = Kontrol.Temizle(Kontrol.SayiKontrol(Request.QueryString["semt"]));
                aramadeger = Kontrol.AramaKontrol(Request.QueryString["Ara"]);


            }
            catch (Exception)
            {
            }

            if (islem == "sil" && ilanId != null)
            {
                SqlConnection bgln = veri.baglan();
                SqlCommand cmd = new SqlCommand("Select ResimYolu150 From Resimler Where ilanId=" + ilanId, bgln);
                SqlDataReader droku = cmd.ExecuteReader();

                ArrayList alistresimler = new ArrayList();
                int i = 0;
                while (droku.Read())
                {
                    i = i + 1;
                    alistresimler.Add(droku[0].ToString());
                }
                if (alistresimler != null)
                {
                    foreach (object ilanResimleri in alistresimler)
                    {
                        FileInfo fi150sil = new FileInfo(Server.MapPath("../Resimler/ilan/150/") + ilanResimleri.ToString());
                        fi150sil.Delete();

                        FileInfo fiorjinalresim = new FileInfo(Server.MapPath("../Resimler/ilan/800/") + ilanResimleri.ToString());
                        fiorjinalresim.Delete();

                        veri.cmd("Delete From Resimler Where ilanId=" + ilanId);

                       
                    }
                }

                try
                {
                    // özellikler tablosundaki ilana ait özellikleride sil
                    veri.cmd("Delete From ilanlar Where ilanId=" + ilanId);
                    veri.cmd("Delete From AltYapiDurumu Where ilanId=" + ilanId);
                    veri.cmd("Delete From CevreOzellik Where ilanId=" + ilanId);
                    veri.cmd("Delete From DisOzellik Where ilanId=" + ilanId);
                    veri.cmd("Delete From icOzellik Where ilanId=" + ilanId);
                    veri.cmd("Delete From KullanimAmaci Where ilanId=" + ilanId);
                }
                catch (Exception)
                {

                }

                Response.Redirect("ilanlar.aspx");
            }
            else if (islem == "bul")
            {
                // ilan aramasına bak ve ilanı sil ilanı silerken özellik tablolarındanda sil
                btnUrunler.Visible = true;
                if (ilId != "0" && ilId != null)
                {
                    sorgu = " ilanlar.ilId='" + ilId + "'";
                }
                if (ilceId != "0" && ilceId != null)
                {
                    sorgu = sorgu + " and ilanlar.ilceId=" + ilceId + "";
                }
                if (semtId != "0" && semtId != null)
                {
                    sorgu = sorgu + " and ilanlar.semtId=" + semtId + "";
                }

                if (aramadeger != "")
                {
                    if (sorgu == null || sorgu == "")
                    {
                        sorgu = sorgu + "  ilanlar.ilanId Like '%" + aramadeger + "%' ";
                    }
                    else
                    {
                        sorgu = sorgu + " and ilanlar.ilanId Like '%" + aramadeger + "%' ";
                    }

                }


                ilanAra();
            }
        }
        void ilanGetir()
        {
            DataTable DtKayitlar = veri.GetDataTable("SELECT dbo.ilanlar.ilanId, dbo.ilanlar.ilanAdi, LEFT(dbo.ilanlar.ilanAdi, 20) + '...' AS 'kisaad', CASE WHEN TipId = 1 THEN 'Konut İlanı' WHEN TipId = 2 THEN 'İşyeri İlanı' WHEN TipId = 3 THEN 'Arsa İlanı' END AS ilanTipi, dbo.ilanlar.Fiyat, dbo.ilanlar.Metrekare, dbo.ilanlar.Hit, dbo.ilanlar.EklenmeTarihi,case when dbo.ilanlar.Aktif=1 then 'Aktif' when dbo.ilanlar.Aktif=0 then 'Pasif' end as Durumadi, dbo.SemtMah.SemtAdi, dbo.ilceler.ilceAdi, dbo.iller.ilAdi, dbo.Danisman.AdSoyad FROM dbo.ilanlar FULL JOIN dbo.SemtMah ON dbo.ilanlar.SemtId = dbo.SemtMah.SemtId FULL JOIN dbo.ilceler ON dbo.ilanlar.ilceId = dbo.ilceler.ilceId FULL JOIN dbo.iller ON dbo.ilanlar.ilId = dbo.iller.ilId INNER JOIN dbo.Danisman ON dbo.ilanlar.DanismanId = dbo.Danisman.DanismanId Order By ilanId Desc");

            CollectionPager1.DataSource = DtKayitlar.DefaultView;
            CollectionPager1.BindToControl = RpKayit;
            RpKayit.DataSource = CollectionPager1.DataSourcePaged;
            RpKayit.DataBind();
            lblBilgi.Text = "Tüm ilanlar listeleniyor. Toplam: "+ DtKayitlar.Rows.Count+ " ilan var.";

        }

        protected void btnAra_Click(object sender, EventArgs e)
        {

            Response.Redirect("ilanlar.aspx?islem=bul&il=" + ddil.SelectedValue + "&ilce=" + ddilce.SelectedValue + "&semt=" + ddSemt.SelectedValue + "&Ara=" + txtAra.Text + "");

        }
        // ilan arama işlemleri 

        void ilanAra()
        {
            btnUrunler.Visible = true;
            try
            {
                DataTable DtKayitlar = veri.GetDataTable("SELECT dbo.ilanlar.ilanId, dbo.ilanlar.ilanAdi, LEFT(dbo.ilanlar.ilanAdi, 20) + '...' AS 'kisaad', CASE WHEN TipId = 1 THEN 'Konut İlanı' WHEN TipId = 2 THEN 'İşyeri İlanı' WHEN TipId = 3 THEN 'Arsa İlanı' END AS ilanTipi,dbo.ilanlar.Fiyat, dbo.ilanlar.Metrekare, dbo.ilanlar.Hit, dbo.ilanlar.EklenmeTarihi,case when dbo.ilanlar.Aktif=1 then 'Aktif' when dbo.ilanlar.Aktif=0 then 'Pasif' end as Durumadi,dbo.SemtMah.SemtAdi, dbo.ilceler.ilceAdi, il.ilAdi, dbo.Danisman.AdSoyad FROM dbo.ilanlar FULL JOIN dbo.SemtMah ON dbo.ilanlar.SemtId = dbo.SemtMah.SemtId FULL JOIN dbo.ilceler ON dbo.ilanlar.ilceId = dbo.ilceler.ilceId FULL JOIN dbo.iller as il ON dbo.ilanlar.ilId = il.ilId INNER JOIN dbo.Danisman ON dbo.ilanlar.DanismanId = dbo.Danisman.DanismanId where " + sorgu + " Order By ilanId Desc");

                CollectionPager1.DataSource = DtKayitlar.DefaultView;
                CollectionPager1.BindToControl = RpKayit;

                RpKayit.DataSource = CollectionPager1.DataSourcePaged;
                RpKayit.DataBind();

                if (DtKayitlar.Rows.Count > 0)
                {
                    lblBilgi.Text = "Arama Sonuçlandı, Kayıtlar Listeleniyor";
                }
                else
                {
                    lblBilgi.Text = "Arama Kriterine Uygun Kayıt Bulunamadı";
                }

            }
            catch (Exception ex)
            {
                // Msg.Show("Arama sırasında bir hata oluştu: " + ex.Message);
                ilanGetir();
            }
        }
        #region
        void ilGetir()
        {
            try
            {
                ddil.Items.Add("İl Seçiniz");
                ddil.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From iller Order By Sira Asc");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddil.Items.Add(DrKayitlar["ilAdi"].ToString());
                    ddil.Items[sira].Value = DrKayitlar["ilId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }

        }

        #endregion

        // ürün arama alt kategori getir
        protected void ddKategori_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddSemt.Items.Clear();
                ddilce.Items.Clear();
                ddilce.Items.Add("İlçe Seçiniz");
                ddilce.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From ilceler where ilId=" + ddil.SelectedValue + "");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddilce.Items.Add(DrKayitlar["ilceAdi"].ToString());
                    ddilce.Items[sira].Value = DrKayitlar["ilceId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnUrunler_Click(object sender, EventArgs e)
        {
            // ilanGetir();
            Response.Redirect("ilanlar.aspx");
        }

        protected void ddilce_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddSemt.Items.Clear();
                ddSemt.Items.Add("Semt - Mahalle Seçiniz");
                ddSemt.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From SemtMah where ilceId=" + ddilce.SelectedValue + "");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddSemt.Items.Add(DrKayitlar["MahalleAdi"].ToString());
                    ddSemt.Items[sira].Value = DrKayitlar["SemtId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }
        }

        protected void ddSemt_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}