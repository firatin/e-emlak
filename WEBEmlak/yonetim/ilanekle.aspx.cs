﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CKFinder;

namespace WEBEmlak.yonetim
{
    public partial class ilanekle : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string TurId, SeciliTip, ilanId;

        //Kullanım amacı
        int atolye = 0, banka = 0, dersane = 0, fabrika = 0, showroom = 0, hastane = 0, market, muayenehane = 0, ofis = 0, pastane = 0, poliklinik = 0, restoran = 0, uretimtesisi = 0, magaza = 0;

        // İç Donanım 
        int adsl = 0, jakuzi = 0, boyali = 0, kuvet = 0, panjur = 0, camasirodasi = 0, marley = 0, asansor = 0, kartonpiyer = 0, sofpen = 0, diafon = 0, somine = 0, ebeveynbanyo = 0, parke = 0, dusakabin = 0, mutfakdogalgaz = 0, ahsapdograma = 0, jenerator = 0, fiberinternet = 0, hidrofor = 0, spotisik = 0, gommedolab = 0, sauna = 0, beyazesya = 0, laminant = 0, alarm = 0, kablotv = 0, kiler = 0, yerdenisitma = 0, celikkapi = 0, giyinmodasi = 0, isicam = 0, kapici = 0, mobilyali = 0, pvc = 0, klima = 0;

        // Dış Donanım
        int siteicinde = 0, guvenlik = 0, acikotopark = 0, kapaliotopark = 0, oyunparki = 0, yuzmehavuzu = 0, saglikmerkezi = 0, alisveris = 0, sportesisi = 0, sudeposu = 0, kres = 0, yanginmerdiveni = 0;

        //Alt Yapı Durumu
        int imarli = 0, imarsiz = 0, ifrazli = 0, parselli = 0, hisseli = 0, tapulu = 0, insaatruhsati = 0, turizimimarli = 0, yatirimtesviki = 0;

        // Çevre Özellikleri
        int bogazmanzara = 0, denizmanzara = 0, dogaicinde = 0, golmanzara = 0, denizeyakin = 0, denizesifir = 0,
            caddeyeyakin = 0, havaalaniyakin = 0, topluulasimyakin = 0, otobanyakin = 0, metroyayakin = 0,
            ilkogretimokul = 0, lise = 0, universite = 0, eczane = 0, hastaneyakin = 0, saglikocagi = 0,
            marketyakin = 0, park = 0, semtpazari = 0, polismerkezi = 0, alisverizmerkezi = 0;


        protected void Page_Load(object sender, EventArgs e)
        {

            Page.Title = "İlan Ekle";
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "İlan Ekle";

          

            if (Page.IsPostBack == false)
            {
                FileBrowser f1 = new FileBrowser();
                f1.BasePath = "../ckfinder/";
                f1.SetupCKEditor(CKEditorControl1);
            }

            try
            {
                TurId = Kontrol.SayiKontrol(Request.QueryString["Tur"]);
            }
            catch (Exception)
            {
                Response.Redirect("ilanekle.aspx");

            }

            if (!Page.IsPostBack)
            {
                if (TurId == "0") // url ile oynanmıştır
                {
                    Response.Redirect("ilanekle.aspx");
                }
                if (TurId != null)
                {
                    ddTip.SelectedValue = TurId;
                    if (TurId == "2") // 1 konut zaten o default - 2 işyeri 3 arsa
                    {
                        trisyeriTipi.Visible = true;
                        trKonutTipi.Visible = false;
                        trEvBalkonBahce.Visible = false; // iş yerinde bu seçenekler yok
                        trEvOda.Visible = false;
                        divisKullanimAmaci.Visible = true;
                    }
                    else if (TurId == "3")
                    {
                        trArsaTipi.Visible = true;
                        trArsaTapu.Visible = true;
                        divAltYapi.Visible = true;
                        trKonutTipi.Visible = false;
                        divGayrimenkul.Visible = false;
                        divicOzellikler.Visible = false;
                        divDisOzellikler.Visible = false;

                    }
                }

                KonutTipiGetir();
                isyeriTipiGetir();
                ArsaTipiGetir();
                ilGetir();
                isinmaTipiGetir();
                DanismanGetir();
            }

        }


        protected void ddTip_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ilanekle.aspx?Tur=" + ddTip.SelectedItem.Value + "");
        }

        void KonutTipiGetir()
        {

            try
            {
                ddKonutTipi.Items.Add("Seçiniz");
                ddKonutTipi.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From KonutTipi");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddKonutTipi.Items.Add(DrKayitlar["KonutTipAdi"].ToString());
                    ddKonutTipi.Items[sira].Value = DrKayitlar["KonutTipId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }
        }
        void isyeriTipiGetir()
        {

            try
            {
                ddisyeriTipi.Items.Add("Seçiniz");
                ddisyeriTipi.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From isyeriTipi");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddisyeriTipi.Items.Add(DrKayitlar["isYeriTipAdi"].ToString());
                    ddisyeriTipi.Items[sira].Value = DrKayitlar["isYeriTipId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }
        }
        void ArsaTipiGetir()
        {

            try
            {
                ddArsaTipi.Items.Add("Seçiniz");
                ddArsaTipi.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From ArsaTipi");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddArsaTipi.Items.Add(DrKayitlar["ArsaTipAdi"].ToString());
                    ddArsaTipi.Items[sira].Value = DrKayitlar["ArsaTipId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }
        }
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

        protected void ddil_SelectedIndexChanged(object sender, EventArgs e)
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

            SeciliTip = ddKonutTipi.SelectedItem.Text; // null veya 1 gelse zaten konut olacak 2 iş 3 arsa tipi

            if (TurId == "2")
            {
                SeciliTip = ddisyeriTipi.SelectedItem.Text;

            }
            else if (TurId == "3")
            {
                SeciliTip = ddArsaTipi.SelectedItem.Text;
            }
            txtilanAdi.Text = ddTur.SelectedItem.Text + " " + SeciliTip.Replace("Seçiniz", "") + " " + ddil.SelectedItem.Text.Replace("İl Seçiniz", "") + " " + ddilce.SelectedItem.Text.Replace("İlçe Seçiniz", "");
        }

        protected void ddSemt_SelectedIndexChanged(object sender, EventArgs e)
        {
            SeciliTip = ddKonutTipi.SelectedItem.Text; // null veya 1 gelse zaten konut olacak 2 iş 3 arsa tipi

            if (TurId == "2")
            {
                SeciliTip = ddisyeriTipi.SelectedItem.Text;

            }
            else if (TurId == "3")
            {
                SeciliTip = ddArsaTipi.SelectedItem.Text;
            }
            txtilanAdi.Text = ddTur.SelectedItem.Text + " " + SeciliTip.Replace("Seçiniz", "") + " " + ddil.SelectedItem.Text.Replace("İl Seçiniz", "") + " " + ddilce.SelectedItem.Text.Replace("İlçe Seçiniz", "") + " " + ddSemt.SelectedItem.Text.Replace("Semt - Mahalle Seçiniz", "");
        }

        protected void ddKonutTipi_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddilce.Items.Count >= 1 && ddSemt.Items.Count >= 1)
            {
                txtilanAdi.Text = ddTur.SelectedItem.Text + " " + ddKonutTipi.SelectedItem.Text.Replace("Seçiniz", "") + " " + ddil.SelectedItem.Text.Replace("İl Seçiniz", "") + " " + ddilce.SelectedItem.Text.Replace("İlçe Seçiniz", "") + " " + ddSemt.SelectedItem.Text.Replace("Semt - Mahalle Seçiniz", "");
            }


        }

        protected void ddisyeriTipi_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddilce.Items.Count >= 1 && ddSemt.Items.Count >= 1)
            {
                txtilanAdi.Text = ddTur.SelectedItem.Text + " " + ddisyeriTipi.SelectedItem.Text.Replace("Seçiniz", "") + " " + ddil.SelectedItem.Text.Replace("İl Seçiniz", "") + " " + ddilce.SelectedItem.Text.Replace("İlçe Seçiniz", "") + " " + ddSemt.SelectedItem.Text.Replace("Semt - Mahalle Seçiniz", "");
            }
        }

        protected void ddArsaTipi_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddilce.Items.Count >= 1 && ddSemt.Items.Count >= 1)
            {
                txtilanAdi.Text = ddTur.SelectedItem.Text + " " + ddArsaTipi.SelectedItem.Text.Replace("Seçiniz", "") + " " + ddil.SelectedItem.Text.Replace("İl Seçiniz", "") + " " + ddilce.SelectedItem.Text.Replace("İlçe Seçiniz", "") + " " + ddSemt.SelectedItem.Text.Replace("Semt - Mahalle Seçiniz", "");
            }
        }

        void isinmaTipiGetir()
        {
            try
            {

                ddisinmaTip.Items.Add("Isınma Tipi Seç");
                ddisinmaTip.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From isinmaTipi ");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddisinmaTip.Items.Add(DrKayitlar["isinmaTipAdi"].ToString());
                    ddisinmaTip.Items[sira].Value = DrKayitlar["isinmaTipId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }
        }
        void DanismanGetir()
        {
            try
            {

                ddDanisman.Items.Add("Danışman Seçiniz");
                ddDanisman.Items[0].Value = "0";
                DataTable dtKayit = veri.GetDataTable("Select * From Danisman where Aktif=1 ");

                int sira = 1;
                for (int i = 0; i < dtKayit.Rows.Count; i++)
                {
                    DataRow DrKayitlar = dtKayit.Rows[i];
                    ddDanisman.Items.Add(DrKayitlar["AdSoyad"].ToString());
                    ddDanisman.Items[sira].Value = DrKayitlar["DanismanId"].ToString();
                    sira++;
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {

            if (TurId == null || TurId == "1")
            {
                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = baglanti;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_EvEkle";
                cmd.Parameters.AddWithValue("@ilanAdi", txtilanAdi.Text);
                cmd.Parameters.AddWithValue("@TipId", ddTip.SelectedValue);
                cmd.Parameters.AddWithValue("@TurId", ddTur.SelectedValue);
                cmd.Parameters.AddWithValue("@KonutTipId", ddKonutTipi.SelectedValue);
                cmd.Parameters.AddWithValue("@isinmaTipId", ddisinmaTip.SelectedValue);
                cmd.Parameters.AddWithValue("@Fiyat", txtFiyat.Text);
                cmd.Parameters.AddWithValue("@Metrekare", txtMetrekare.Text);
                cmd.Parameters.AddWithValue("@KrediyeUygun", ddKrediUygun.SelectedValue);
                cmd.Parameters.AddWithValue("@Takas", ddTakasDurum.SelectedValue);
                cmd.Parameters.AddWithValue("@YapiTipi", ddYapiTipi.SelectedValue);
                cmd.Parameters.AddWithValue("@YakitTipi", ddYakitTipi.SelectedValue);
                cmd.Parameters.AddWithValue("@KullanimDurum", ddKullanimDurum.SelectedValue);
                cmd.Parameters.AddWithValue("@YapimYili", ddYapimYili.SelectedValue);
                cmd.Parameters.AddWithValue("@YapininDurumu", ddYapiDurumu.SelectedValue);
                cmd.Parameters.AddWithValue("@BulunduguKat", ddBulunduguKat.SelectedValue);
                cmd.Parameters.AddWithValue("@KatSayisi", ddKatSayisi.SelectedValue);
                cmd.Parameters.AddWithValue("@OdaSayisi", ddOdaSayisi.SelectedValue);
                cmd.Parameters.AddWithValue("@YatakOdasi", ddYatakOdası.SelectedValue);
                cmd.Parameters.AddWithValue("@Balkon", ddBalkon.SelectedValue);
                cmd.Parameters.AddWithValue("@Bahce", ddBahce.SelectedValue);
                cmd.Parameters.AddWithValue("@Aciklama", CKEditorControl1.Text);
                cmd.Parameters.AddWithValue("@Video", txtUrl.Text);
                cmd.Parameters.AddWithValue("@DanismanId", ddDanisman.SelectedValue);
                cmd.Parameters.AddWithValue("@ilId", ddil.SelectedValue);
                cmd.Parameters.AddWithValue("@ilceId", ddilce.SelectedValue);
                cmd.Parameters.AddWithValue("@SemtId", ddSemt.SelectedValue);

                try
                {
                    cmd.ExecuteNonQuery();
                    ilanId = veri.GetDataCell("Select Top 1 ilanId From ilanlar Order By ilanId Desc");

                    icDonanim();
                    DisDonanim();
                    CevreDurum();

                    Response.Redirect("ilanguncelle.aspx?ilan="+ilanId+"&islem=resim");
                }
                catch (Exception ex)
                {
                    Msg.Show("Bir hata meydana geldi: " + ex.Message);
                }


            }
            else if (TurId == "2") // null veya 1 konut  - 2 işyeri 3 arsa
            {
                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = baglanti;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_isEkle";
                cmd.Parameters.AddWithValue("@ilanAdi", txtilanAdi.Text);
                cmd.Parameters.AddWithValue("@TipId", ddTip.SelectedValue);
                cmd.Parameters.AddWithValue("@TurId", ddTur.SelectedValue);
                cmd.Parameters.AddWithValue("@isyeriTipId", ddisyeriTipi.SelectedValue);
                cmd.Parameters.AddWithValue("@isinmaTipId", ddisinmaTip.SelectedValue);
                cmd.Parameters.AddWithValue("@Fiyat", txtFiyat.Text);
                cmd.Parameters.AddWithValue("@Metrekare", txtMetrekare.Text);
                cmd.Parameters.AddWithValue("@KrediyeUygun", ddKrediUygun.SelectedValue);
                cmd.Parameters.AddWithValue("@Takas", ddTakasDurum.SelectedValue);
                cmd.Parameters.AddWithValue("@YapiTipi", ddYapiTipi.SelectedValue);
                cmd.Parameters.AddWithValue("@YakitTipi", ddYakitTipi.SelectedValue);
                cmd.Parameters.AddWithValue("@KullanimDurum", ddKullanimDurum.SelectedValue);
                cmd.Parameters.AddWithValue("@YapimYili", ddYapimYili.SelectedValue);
                cmd.Parameters.AddWithValue("@YapininDurumu", ddYapiDurumu.SelectedValue);
                cmd.Parameters.AddWithValue("@BulunduguKat", ddBulunduguKat.SelectedValue);
                cmd.Parameters.AddWithValue("@KatSayisi", ddKatSayisi.SelectedValue);
                cmd.Parameters.AddWithValue("@Aciklama", CKEditorControl1.Text);
                cmd.Parameters.AddWithValue("@Video", txtUrl.Text);
                cmd.Parameters.AddWithValue("@DanismanId", ddDanisman.SelectedValue);
                cmd.Parameters.AddWithValue("@ilId", ddil.SelectedValue);
                cmd.Parameters.AddWithValue("@ilceId", ddilce.SelectedValue);
                cmd.Parameters.AddWithValue("@SemtId", ddSemt.SelectedValue);

                try
                {
                    cmd.ExecuteNonQuery();
                    ilanId = veri.GetDataCell("Select Top 1 ilanId From ilanlar Order By ilanId Desc");

                    KullanimAmaci();
                    icDonanim();
                    DisDonanim();
                    CevreDurum();
                    Response.Redirect("ilanguncelle.aspx?ilan=" + ilanId + "&islem=resim");
                }
                catch (Exception ex)
                {
                    Msg.Show("Bir hata meydana geldi: " + ex.Message);
                }
            }
            else if (TurId == "3")
            {

                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = baglanti;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_arsaEkle";
                cmd.Parameters.AddWithValue("@ilanAdi", txtilanAdi.Text);
                cmd.Parameters.AddWithValue("@TipId", ddTip.SelectedValue);
                cmd.Parameters.AddWithValue("@TurId", ddTur.SelectedValue);
                cmd.Parameters.AddWithValue("@ArsaTipId", ddArsaTipi.SelectedValue);
                cmd.Parameters.AddWithValue("@Fiyat", txtFiyat.Text);
                cmd.Parameters.AddWithValue("@Metrekare", txtMetrekare.Text);
                cmd.Parameters.AddWithValue("@KrediyeUygun", ddKrediUygun.SelectedValue);
                cmd.Parameters.AddWithValue("@Takas", ddTakasDurum.SelectedValue);
                cmd.Parameters.AddWithValue("@TapuDurumu", ddTapu.SelectedValue);
                cmd.Parameters.AddWithValue("@Aciklama", CKEditorControl1.Text);
                cmd.Parameters.AddWithValue("@Video", txtUrl.Text);
                cmd.Parameters.AddWithValue("@DanismanId", ddDanisman.SelectedValue);
                cmd.Parameters.AddWithValue("@ilId", ddil.SelectedValue);
                cmd.Parameters.AddWithValue("@ilceId", ddilce.SelectedValue);
                cmd.Parameters.AddWithValue("@SemtId", ddSemt.SelectedValue);

                try
                {
                    cmd.ExecuteNonQuery();
                    ilanId = veri.GetDataCell("Select Top 1 ilanId From ilanlar Order By ilanId Desc");

                    AltYapiDurum();
                    CevreDurum();
                    Response.Redirect("ilanguncelle.aspx?ilan=" + ilanId + "&islem=resim");
                }
                catch (Exception ex)
                {
                    Msg.Show("Bir hata meydana geldi: " + ex.Message);
                }
            }


        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("ilanlar.aspx");
        }

        void KullanimAmaci() // iş ilanı için
        {

            if (cbAtolye.Checked) atolye = 1; if (cbBanka.Checked) banka = 1;
            if (cbDershane.Checked) dersane = 1; if (cbFabrika.Checked) fabrika = 1;
            if (cbShowroom.Checked) showroom = 1; if (cbHastane.Checked) hastane = 1;
            if (cbMarket.Checked) market = 1; if (cbMuayenehane.Checked) muayenehane = 1;
            if (cbOfis.Checked) ofis = 1; if (cbPastane.Checked) pastane = 1;
            if (cbPoliklinik.Checked) poliklinik = 1; if (cbRestoran.Checked) restoran = 1;
            if (cbUretimTesis.Checked) uretimtesisi = 1; if (cbMagaza.Checked) magaza = 1;

            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_KullanimAmaciEkle";
            cmd.Parameters.AddWithValue("@ilanId", ilanId);
            cmd.Parameters.AddWithValue("@Atolye", atolye);
            cmd.Parameters.AddWithValue("@Banka", banka);
            cmd.Parameters.AddWithValue("@Dershane", dersane);
            cmd.Parameters.AddWithValue("@Fabrika", fabrika);
            cmd.Parameters.AddWithValue("@Showroom", showroom);
            cmd.Parameters.AddWithValue("@Hastane", hastane);
            cmd.Parameters.AddWithValue("@Market", market);
            cmd.Parameters.AddWithValue("@Muayenehane", muayenehane);
            cmd.Parameters.AddWithValue("@Ofis", ofis);
            cmd.Parameters.AddWithValue("@Pastane", pastane);
            cmd.Parameters.AddWithValue("@Poliklinik", poliklinik);
            cmd.Parameters.AddWithValue("@Restoran", restoran);
            cmd.Parameters.AddWithValue("@Uretimtesisi", uretimtesisi);
            cmd.Parameters.AddWithValue("@Magaza", magaza);


            try
            {
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Msg.Show("Bir hata meydana geldi (Kullanım Amacı): " + ex.Message);
            }



        }
        void icDonanim() // ev ve iş ilanı için
        {

            if (cbAdsl.Checked) adsl = 1; if (cbJakuzi.Checked) jakuzi = 1;
            if (cbkuvet.Checked) kuvet = 1; if (cbPanjur.Checked) panjur = 1;
            if (cbcamasir.Checked) camasirodasi = 1; if (cbmarley.Checked) marley = 1;
            if (cbAsansor.Checked) asansor = 1; if (cbKartonPiyer.Checked) kartonpiyer = 1;
            if (cbSofben.Checked) sofpen = 1; if (cbDiafon.Checked) diafon = 1;
            if (cbsomine.Checked) somine = 1; if (cbebeveyn.Checked) ebeveynbanyo = 1;
            if (cbparke.Checked) parke = 1; if (cbDusaKabin.Checked) dusakabin = 1;
            if (cbMutfakDgaz.Checked) mutfakdogalgaz = 1; if (cbAhsapDograma.Checked) ahsapdograma = 1;
            if (cbJenerator.Checked) jenerator = 1; if (cbfiberinternet.Checked) fiberinternet = 1;
            if (cbhidrofor.Checked) hidrofor = 1; if (cbspotisik.Checked) spotisik = 1;
            if (cbGommeDolab.Checked) gommedolab = 1; if (cbSauna.Checked) sauna = 1;
            if (cbBeyazEsya.Checked) beyazesya = 1; if (cbLaminant.Checked) laminant = 1;
            if (cbalarm.Checked) alarm = 1; if (cbkablo.Checked) kablotv = 1;
            if (cbkiler.Checked) kiler = 1; if (cbYerdenisitma.Checked) yerdenisitma = 1;
            if (cbCelikKapi.Checked) celikkapi = 1; if (cbGiyinmeOda.Checked) giyinmodasi = 1;
            if (cbisicam.Checked) isicam = 1; if (cbkapici.Checked) kapici = 1;
            if (cbmobilya.Checked) mobilyali = 1; if (cbpvc.Checked) pvc = 1;
            if (cbKlima.Checked) klima = 1; if (cbBoyali.Checked) boyali = 1;

            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_icOzellikEkle";
            cmd.Parameters.AddWithValue("@ilanId", ilanId);
            cmd.Parameters.AddWithValue("@Adsl", adsl);
            cmd.Parameters.AddWithValue("@Asansor", asansor);
            cmd.Parameters.AddWithValue("@Dusakabin", dusakabin);
            cmd.Parameters.AddWithValue("@GommeDolap", gommedolab);
            cmd.Parameters.AddWithValue("@Jakuzi", jakuzi);
            cmd.Parameters.AddWithValue("@Kartonpiyer", kartonpiyer);
            cmd.Parameters.AddWithValue("@Mutfakdogalgaz", mutfakdogalgaz);
            cmd.Parameters.AddWithValue("@Sauna", sauna);
            cmd.Parameters.AddWithValue("@Boyali", boyali);
            cmd.Parameters.AddWithValue("@Sofben", sofpen);
            cmd.Parameters.AddWithValue("@Ahsapdograma", ahsapdograma);
            cmd.Parameters.AddWithValue("@Beyazesyali", beyazesya);
            cmd.Parameters.AddWithValue("@Kuvet", kuvet);
            cmd.Parameters.AddWithValue("@Panjur", panjur);
            cmd.Parameters.AddWithValue("@Diafon", diafon);
            cmd.Parameters.AddWithValue("@Jenerator", jenerator);
            cmd.Parameters.AddWithValue("@Laminant", laminant);
            cmd.Parameters.AddWithValue("@Somine", somine);
            cmd.Parameters.AddWithValue("@Fiberinternet", fiberinternet);
            cmd.Parameters.AddWithValue("@Alarm", alarm);
            cmd.Parameters.AddWithValue("@Camasirodasi", camasirodasi);
            cmd.Parameters.AddWithValue("@Ebeveynbanyolu", ebeveynbanyo);
            cmd.Parameters.AddWithValue("@Hidrofor", hidrofor);
            cmd.Parameters.AddWithValue("@Kablotvuydu", kablotv);
            cmd.Parameters.AddWithValue("@Marley", marley);
            cmd.Parameters.AddWithValue("@Parke", parke);
            cmd.Parameters.AddWithValue("@Spotisik", spotisik);
            cmd.Parameters.AddWithValue("@Kiler", kiler);
            cmd.Parameters.AddWithValue("@Celikkapi", celikkapi);
            cmd.Parameters.AddWithValue("@Giyinmeodasi", giyinmodasi);
            cmd.Parameters.AddWithValue("@Isicam", isicam);
            cmd.Parameters.AddWithValue("@Kapici", kapici);
            cmd.Parameters.AddWithValue("@Mobilyali", mobilyali);
            cmd.Parameters.AddWithValue("@Pvcdograma", pvc);
            cmd.Parameters.AddWithValue("@Yerdenisitma", yerdenisitma);
            cmd.Parameters.AddWithValue("@Klima", klima);


            try
            {
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Msg.Show("Bir hata meydana geldi (İç Özellik): " + ex.Message);
            }

        }
        void DisDonanim() // ev ve iş ilanı için
        {

            if (cbsiteicinde.Checked) siteicinde = 1; if (cbguvenlik.Checked) guvenlik = 1;
            if (cbacikotopark.Checked) acikotopark = 1; if (cbkapaliotopark.Checked) kapaliotopark = 1;
            if (cboyunparki.Checked) oyunparki = 1; if (cbyuzmehavuzu.Checked) yuzmehavuzu = 1;
            if (cbsaglikmerkezi.Checked) saglikmerkezi = 1; if (cbalisveris.Checked) alisveris = 1;
            if (cbsportesisi.Checked) sportesisi = 1; if (cbsudeposu.Checked) sudeposu = 1;
            if (cbkres.Checked) kres = 1; if (cbymerdiven.Checked) yanginmerdiveni = 1;

            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_DisOzellikEkle";
            cmd.Parameters.AddWithValue("@ilanId", ilanId);
            cmd.Parameters.AddWithValue("@Siteicinde", siteicinde);
            cmd.Parameters.AddWithValue("@Oyunparki", oyunparki);
            cmd.Parameters.AddWithValue("@Sportesisi", sportesisi);
            cmd.Parameters.AddWithValue("@Guvenlik", guvenlik);
            cmd.Parameters.AddWithValue("@Yuzmehavuzu", yuzmehavuzu);
            cmd.Parameters.AddWithValue("@Sudeposu", sudeposu);
            cmd.Parameters.AddWithValue("@Acikotopark", acikotopark);
            cmd.Parameters.AddWithValue("@Kapaliotopark", kapaliotopark);
            cmd.Parameters.AddWithValue("@Saglikhizmeti", saglikmerkezi);
            cmd.Parameters.AddWithValue("@Kres", kres);
            cmd.Parameters.AddWithValue("@Alisveris", alisveris);
            cmd.Parameters.AddWithValue("@Yanginmerdiveni", yanginmerdiveni);

            try
            {
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Msg.Show("Bir hata meydana geldi (Dış Özellik): " + ex.Message);
            }

        }
        void AltYapiDurum() // arsa ilanı için
        {
            if (cbimarli.Checked) imarli = 1; if (cbimarsiz.Checked) imarsiz = 1;
            if (cbifrazli.Checked) ifrazli = 1; if (cbParselli.Checked) parselli = 1;
            if (cboyunparki.Checked) oyunparki = 1; if (cbyuzmehavuzu.Checked) yuzmehavuzu = 1;
            if (cbHisseli.Checked) hisseli = 1; if (cbruhsat.Checked) insaatruhsati = 1;
            if (cbturizimimar.Checked) turizimimarli = 1; if (cbyatirimtesvik.Checked) yatirimtesviki = 1;
            if (cbTapulu.Checked) tapulu = 1;

            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_AltYapiEkle";
            cmd.Parameters.AddWithValue("@ilanId", ilanId);
            cmd.Parameters.AddWithValue("@Imarli", imarli);
            cmd.Parameters.AddWithValue("@Imarsiz", imarsiz);
            cmd.Parameters.AddWithValue("@Ifrazli", ifrazli);
            cmd.Parameters.AddWithValue("@Parselli", parselli);
            cmd.Parameters.AddWithValue("@Hisseli", hisseli);
            cmd.Parameters.AddWithValue("@Tapulu", tapulu);
            cmd.Parameters.AddWithValue("@Ruhsat", insaatruhsati);
            cmd.Parameters.AddWithValue("@Turizimimarli", turizimimarli);
            cmd.Parameters.AddWithValue("@Yatirimtesviki", yatirimtesviki);


            try
            {
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Msg.Show("Bir hata meydana geldi (Alt Yapı Durumu): " + ex.Message);
            }

        }
        void CevreDurum() // ev ve iş ilanı için
        {
            // Çevre Özellikleri


            if (cbbogaz.Checked) bogazmanzara = 1; if (cbdeniz.Checked) denizmanzara = 1;
            if (cbdoga.Checked) dogaicinde = 1; if (cbgol.Checked) golmanzara = 1;
            if (cbdenizeyakin.Checked) denizeyakin = 1; if (cbdenizesifir.Checked) denizesifir = 1;
            if (cbcaddeye.Checked) caddeyeyakin = 1; if (cbhavaalani.Checked) havaalaniyakin = 1;
            if (cbtopluulasim.Checked) topluulasimyakin = 1; if (cbotoban.Checked) otobanyakin = 1;

            if (cbmetro.Checked) metroyayakin = 1; if (cbilkogretim.Checked) ilkogretimokul = 1;
            if (cblise.Checked) lise = 1; if (cbotoban.Checked) otobanyakin = 1;
            if (cbtopluulasim.Checked) topluulasimyakin = 1; if (cbuniversite.Checked) universite = 1;
            if (cbeczane.Checked) eczane = 1; if (cbhastaneyakin.Checked) hastaneyakin = 1;

            if (cbsaglikocagi.Checked) saglikocagi = 1; if (cbmarketyakin.Checked) marketyakin = 1;
            if (cbpark.Checked) park = 1; if (cbpazar.Checked) semtpazari = 1;
            if (cbpolis.Checked) polismerkezi = 1; if (cbamerkezi.Checked) alisverizmerkezi = 1;


            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_CevreOzellikEkle";
            cmd.Parameters.AddWithValue("@ilanId", ilanId);
            cmd.Parameters.AddWithValue("@Bogazmanzarasi", bogazmanzara);
            cmd.Parameters.AddWithValue("@Denizmanzarasi", denizmanzara);
            cmd.Parameters.AddWithValue("@Dogaicinde", dogaicinde);
            cmd.Parameters.AddWithValue("@Golmanzarasi", golmanzara);
            cmd.Parameters.AddWithValue("@Denizeyakin", denizeyakin);
            cmd.Parameters.AddWithValue("@Denizesifir", denizesifir);
            cmd.Parameters.AddWithValue("@Caddeyeyakin", caddeyeyakin);
            cmd.Parameters.AddWithValue("@Havaalaninayakin", havaalaniyakin);
            cmd.Parameters.AddWithValue("@TopluUlasimayakin", topluulasimyakin);
            cmd.Parameters.AddWithValue("@Otobanayakin", otobanyakin);
            cmd.Parameters.AddWithValue("@Metroyayakin", metroyayakin);
            cmd.Parameters.AddWithValue("@Ilkogretimokulu", ilkogretimokul);
            cmd.Parameters.AddWithValue("@Lise", lise);
            cmd.Parameters.AddWithValue("@Universite", universite);
            cmd.Parameters.AddWithValue("@Eczane", eczane);
            cmd.Parameters.AddWithValue("@Hastane", hastaneyakin);
            cmd.Parameters.AddWithValue("@Saglikocagi", saglikocagi);
            cmd.Parameters.AddWithValue("@Market", marketyakin);
            cmd.Parameters.AddWithValue("@Park", park);
            cmd.Parameters.AddWithValue("@Semtpazari", semtpazari);
            cmd.Parameters.AddWithValue("@Polismerkezi", polismerkezi);
            cmd.Parameters.AddWithValue("@Alisverismerkezi", alisverizmerkezi);


            try
            {
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Msg.Show("Bir hata meydana geldi (Çevre Durumu): " + ex.Message);
            }
        }
    }
}