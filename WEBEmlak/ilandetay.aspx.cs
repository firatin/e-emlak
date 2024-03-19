using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.IO;

namespace WEBEmlak
{
    public partial class ilandetay2 : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        Label lbl1;
        string ilanId, TipId;
        public string ilanAdi, Title, ilanResim, DanismanId, DanismanAdi;
        DataRow drBasvuru;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            lbl1 = (Label)Master.FindControl("lblBilgim");
            lbl1.Text = "İlan Detayı";
            Page.Title = "İlan Detayı";

            try
            {

                ilanId = Kontrol.SayiKontrol(Kontrol.UrlSeo(RouteData.Values["ilanId"].ToString()));
            }
            catch (Exception)
            {

                Response.Redirect("Default.aspx");

            }

            if (ilanId != "" || ilanId != null)
            {

                DataRow drilan = veri.GetDataRow("select ilanlar.*,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi,SemtMah.MahalleAdi,ArsaTipi.ArsaTipAdi,KonutTipi.KonutTipAdi,isyeriTipi.isYeriTipAdi,isinmaTipi.isinmaTipAdi from ilanlar Full join iller  ON ilanlar.ilId = iller.ilId Full join ilceler on ilanlar.ilceId = ilceler.ilceId Full join SemtMah on ilanlar.SemtId = SemtMah.SemtId Full join ArsaTipi on ilanlar.ArsaTipId = ArsaTipi.ArsaTipId Full join KonutTipi on ilanlar.KonutTipId = KonutTipi.KonutTipId Full join isyeriTipi on ilanlar.isYeriTipId = isyeriTipi.isYeriTipId Full join isinmaTipi on ilanlar.isinmaTipId = isinmaTipi.isinmaTipId where Aktif=1 and ilanId=" + ilanId + "");

                if (drilan != null)
                {
                    try
                    {

                        // eğer konuttip günlük kiralıksa günlük kiralık tablosuna bak bu ilan varsa ve şuan kiradaysa uyarı ver.
                        if (drilan["KonutTipId"].ToString() == "15")
                        {
                             drBasvuru = veri.GetDataRow("Select * From Basvuru Where ilanId=" + ilanId + " and Aktif=1");
                            if (drBasvuru==null)
                            {
                                divKirala.Visible = true;
                            }
                            else
                            {
                                lblKirala.Text = "Bu ilan " + drBasvuru["GTarih"].ToString().Substring(0, 10) + " ile " + drBasvuru["CTarih"].ToString().Substring(0, 10) + " tarihlerinde kiralıktır.";
                               // btnKirala.Enabled = true;
                                divKirala.Visible = true;
                            }

                        }



                        // ilan tipi konutmu arsa mı

                        TipId = drilan["TipId"].ToString();
                        if (TipId != null && TipId != "")
                        {
                            if (drilan["KonutTipId"].ToString() == "15")
                            {
                                // günlük kiralık
                                //gunlukdiv.visible=true;
                                divKirala.Visible = true;

                            }

                            if (TipId == "2") // 1 konut zaten o default - 2 işyeri 3 arsa
                            {
                                trisyeriTipi.Visible = true;
                                trKonutTipi.Visible = false;
                                trEvBalkonBahce.Visible = false; // iş yerinde bu seçenekler yok
                                trEvOda.Visible = false;
                                divisKullanimAmaci.Visible = true;

                            }
                            else if (TipId == "3")
                            {
                                trArsaTipi.Visible = true;
                                trArsaTapu.Visible = true;
                                divAltYapi.Visible = true;
                                divCevreOzellik.Visible = true;
                                trKonutTipi.Visible = false;
                                divGayrimenkul.Visible = false;
                                divicOzellikler.Visible = false;
                                divDisOzellikler.Visible = false;
                                divArsaDuzelt.Visible = true;


                            }
                        }


                        ilanAdi = drilan["ilanAdi"].ToString();
                        Title = ilanAdi + " - " + drilan["ilAdi"] + " - " + drilan["ilceAdi"] + " - " + drilan["MahalleAdi"] + " - Konut , Arsa, İşyeri ilanları";
                        Page.Title = ilanAdi; // il ilçe title de olmasına gerek yok büyük ihtimal başlıkta olacaktır
                        Page.MetaDescription = Title;
                        Page.MetaKeywords = Title;

                        ilanResim = drilan["AnaResim800"].ToString();

                        lbl1.Text = drilan["ilanAdi"].ToString();
                        lblilanNo.Text = drilan["ilanId"].ToString();
                        lblFiyat.Text = Convert.ToDouble(drilan["Fiyat"]).ToString("#,##0") + " TL";
                        lblTur.Text = drilan["Tur"].ToString();
                        lblisyeriTip.Text = drilan["isyeriTipAdi"].ToString();
                        lblArsaTip.Text = drilan["ArsaTipAdi"].ToString();
                        lblKonutTip.Text = drilan["KonutTipAdi"].ToString();
                        // bazı ilanlarda veritabanındaki il ilçeden  kaynaklı il adi ve ilçe adı aynı, bu tür yerleri ilçe adı yerine Merkez yaz

                        if (drilan["ilAdi"].ToString() == drilan["ilceAdi"].ToString())
                        {

                            lblKonum.Text = drilan["ilAdi"] + " - MERKEZ" + " - " + drilan["MahalleAdi"];
                        }
                        else
                        {
                            lblKonum.Text = drilan["ilAdi"] + " - " + drilan["ilceAdi"] + " - " + drilan["MahalleAdi"];
                        }

                        lblMetrekare.Text = drilan["Metrekare"].ToString() + " <sub>m</sub>2 ";
                        lblTapuDurumu.Text = drilan["TapuDurumu"].ToString();

                        if (drilan["Aciklama"].ToString() == "")
                        {
                            divAciklama.Visible = false;
                        }
                        else
                        {
                            ltrlAciklama.Text = drilan["Aciklama"].ToString();
                        }
                        if (drilan["video"].ToString() == "")
                        {
                            divVideo.Visible = false;
                        }
                        else
                        {
                            ltrlVideo.Text = drilan["video"].ToString();
                        }



                        // hit sayısı

                        try
                        {
                            int Hit;
                            Hit = Convert.ToInt32(drilan["Hit"]);
                            Hit = Hit + 1;

                            veri.cmd("Update ilanlar Set Hit=" + Hit + " Where ilanId=" + ilanId + "");

                        }
                        catch (Exception)
                        {

                        }

                        // ilan resimleri

                        DataTable DtResimler = veri.GetDataTable("Select * from Resimler where ilanId=" + ilanId + "");
                        if (DtResimler.Rows.Count >= 1)
                        {
                            dlResimler.DataSource = DtResimler;
                            dlResimler.DataBind();
                        }

                        //Gayrimenkul Bilgileri
                        #region

                        if (drilan["KrediyeUygun"].ToString() != "" && drilan["KrediyeUygun"].ToString() != "0")
                        {
                            trKredi.Visible = true;
                            lblKrediDurum.Text = drilan["KrediyeUygun"].ToString();
                        }
                        if (drilan["Takas"].ToString() != "" && drilan["Takas"].ToString() != "0")
                        {
                            trTakas.Visible = true;
                            lblTakasDurum.Text = drilan["Takas"].ToString();
                        }
                        if (drilan["YapiTipi"].ToString() == "" || drilan["YapiTipi"].ToString() == "0")
                        {
                            lblYapiTipi.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblYapiTipi.Text = drilan["YapiTipi"].ToString();
                        }
                        if (drilan["YapininDurumu"].ToString() == "" || drilan["YapininDurumu"].ToString() == "0")
                        {
                            lblYapidurum.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblYapidurum.Text = drilan["YapininDurumu"].ToString();
                        }

                        if (drilan["KullanimDurum"].ToString() == "" || drilan["KullanimDurum"].ToString() == "0")
                        {
                            lblKullanimdurum.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblKullanimdurum.Text = drilan["KullanimDurum"].ToString();
                        }

                        if (drilan["YapimYili"].ToString() == "" || drilan["YapimYili"].ToString() == "0")
                        {
                            lblYapimyili.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblYapimyili.Text = drilan["YapimYili"].ToString();
                        }

                        if (drilan["KatSayisi"].ToString() == "" || drilan["KatSayisi"].ToString() == "0")
                        {
                            lblKatSayi.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblKatSayi.Text = drilan["KatSayisi"].ToString();
                        }

                        if (drilan["BulunduguKat"].ToString() == "" || drilan["BulunduguKat"].ToString() == "0")
                        {
                            lblBulundugukat.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblBulundugukat.Text = drilan["BulunduguKat"].ToString();
                        }

                        if (drilan["OdaSayisi"].ToString() == "" || drilan["OdaSayisi"].ToString() == "0")
                        {
                            lblOdaSayi.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblOdaSayi.Text = drilan["OdaSayisi"].ToString();
                        }

                        if (drilan["YatakOdasi"].ToString() == "" || drilan["YatakOdasi"].ToString() == "0")
                        {
                            lblYatakOdasi.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblYatakOdasi.Text = drilan["YatakOdasi"].ToString();
                        }

                        if (drilan["Balkon"].ToString() == "" || drilan["Balkon"].ToString() == "0")
                        {
                            lblBalkon.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblBalkon.Text = drilan["Balkon"].ToString();
                        }

                        if (drilan["Bahce"].ToString() == "" || drilan["Bahce"].ToString() == "0")
                        {
                            lblBahce.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblBahce.Text = drilan["Bahce"].ToString();
                        }


                        if (drilan["isinmaTipAdi"].ToString() == "" || drilan["isinmaTipAdi"].ToString() == "0")
                        {
                            lblisinmatip.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblisinmatip.Text = drilan["isinmaTipAdi"].ToString();
                        }
                        if (drilan["YakitTipi"].ToString() == "" || drilan["YakitTipi"].ToString() == "0")
                        {
                            lblYakitTip.Text = "Bilgi Yok";
                        }
                        else
                        {
                            lblYakitTip.Text = drilan["YakitTipi"].ToString();

                        }
                        #endregion

                        // Kullanım Amacı
                        #region
                        DataRow DrKullanim = veri.GetDataRow("Select * From KullanimAmaci where ilanId=" + ilanId + "");
                        if (DrKullanim != null)
                        {
                            if (DrKullanim["Atolye"].ToString() == "True") cbAtolye.Checked = true;
                            if (DrKullanim["Banka"].ToString() == "True") cbBanka.Checked = true;
                            if (DrKullanim["Dershane"].ToString() == "True") cbDershane.Checked = true;
                            if (DrKullanim["Fabrika"].ToString() == "True") cbFabrika.Checked = true;
                            if (DrKullanim["Showroom"].ToString() == "True") cbShowroom.Checked = true;
                            if (DrKullanim["Hastane"].ToString() == "True") cbHastane.Checked = true;
                            if (DrKullanim["Market"].ToString() == "True") cbMarket.Checked = true;
                            if (DrKullanim["Muayenehane"].ToString() == "True") cbMuayenehane.Checked = true;
                            if (DrKullanim["Ofis"].ToString() == "True") cbOfis.Checked = true;
                            if (DrKullanim["Pastane"].ToString() == "True") cbPastane.Checked = true;
                            if (DrKullanim["Poliklinik"].ToString() == "True") cbPoliklinik.Checked = true;
                            if (DrKullanim["Restoran"].ToString() == "True") cbRestoran.Checked = true;
                            if (DrKullanim["Uretimtesisi"].ToString() == "True") cbUretimTesis.Checked = true;
                            if (DrKullanim["Magaza"].ToString() == "True") cbMagaza.Checked = true;
                        }
                        else
                        {
                            divisKullanimAmaci.Visible = false;
                        }
                        #endregion

                        // İç Özellikler

                        #region
                        DataRow icDonanim = veri.GetDataRow("Select * From icOzellik where ilanId=" + ilanId + "");
                        if (icDonanim != null)
                        {

                            if (icDonanim["Adsl"].ToString() == "True") cbAdsl.Checked = true;
                            if (icDonanim["Asansor"].ToString() == "True") cbAsansor.Checked = true;
                            if (icDonanim["Dusakabin"].ToString() == "True") cbDusaKabin.Checked = true;
                            if (icDonanim["GommeDolap"].ToString() == "True") cbGommeDolab.Checked = true;
                            if (icDonanim["Jakuzi"].ToString() == "True") cbJakuzi.Checked = true;
                            if (icDonanim["Kartonpiyer"].ToString() == "True") cbKartonPiyer.Checked = true;
                            if (icDonanim["Mutfakdogalgaz"].ToString() == "True") cbMutfakDgaz.Checked = true;
                            if (icDonanim["Sauna"].ToString() == "True") cbSauna.Checked = true;
                            if (icDonanim["Boyali"].ToString() == "True") cbBoyali.Checked = true;
                            if (icDonanim["Sofben"].ToString() == "True") cbSofben.Checked = true;
                            if (icDonanim["Ahsapdograma"].ToString() == "True") cbAhsapDograma.Checked = true;
                            if (icDonanim["Beyazesyali"].ToString() == "True") cbBeyazEsya.Checked = true;
                            if (icDonanim["Kuvet"].ToString() == "True") cbkuvet.Checked = true;
                            if (icDonanim["Panjur"].ToString() == "True") cbPanjur.Checked = true;
                            if (icDonanim["Diafon"].ToString() == "True") cbDiafon.Checked = true;
                            if (icDonanim["Jenerator"].ToString() == "True") cbJenerator.Checked = true;
                            if (icDonanim["Laminant"].ToString() == "True") cbLaminant.Checked = true;
                            if (icDonanim["Somine"].ToString() == "True") cbsomine.Checked = true;
                            if (icDonanim["Fiberinternet"].ToString() == "True") cbfiberinternet.Checked = true;
                            if (icDonanim["Alarm"].ToString() == "True") cbalarm.Checked = true;
                            if (icDonanim["Camasirodasi"].ToString() == "True") cbcamasir.Checked = true;
                            if (icDonanim["Ebeveynbanyolu"].ToString() == "True") cbebeveyn.Checked = true;
                            if (icDonanim["Hidrofor"].ToString() == "True") cbhidrofor.Checked = true;
                            if (icDonanim["Kablotvuydu"].ToString() == "True") cbkablo.Checked = true;
                            if (icDonanim["Marley"].ToString() == "True") cbmarley.Checked = true;
                            if (icDonanim["Parke"].ToString() == "True") cbparke.Checked = true;
                            if (icDonanim["Spotisik"].ToString() == "True") cbspotisik.Checked = true;
                            if (icDonanim["Kiler"].ToString() == "True") cbkiler.Checked = true;
                            if (icDonanim["Celikkapi"].ToString() == "True") cbCelikKapi.Checked = true;
                            if (icDonanim["Giyinmeodasi"].ToString() == "True") cbGiyinmeOda.Checked = true;
                            if (icDonanim["Isicam"].ToString() == "True") cbisicam.Checked = true;
                            if (icDonanim["Kapici"].ToString() == "True") cbkapici.Checked = true;
                            if (icDonanim["Mobilyali"].ToString() == "True") cbmobilya.Checked = true;
                            if (icDonanim["Pvcdograma"].ToString() == "True") cbpvc.Checked = true;
                            if (icDonanim["Yerdenisitma"].ToString() == "True") cbYerdenisitma.Checked = true;
                            if (icDonanim["Klima"].ToString() == "True") cbKlima.Checked = true;

                        }
                        else
                        {
                            divicOzellikler.Visible = false;
                        }
                        #endregion

                        // Dış Özellikler
                        #region
                        DataRow DisDonanim = veri.GetDataRow("Select * From DisOzellik where ilanId=" + ilanId + "");
                        if (DisDonanim != null)
                        {
                            if (DisDonanim["Siteicinde"].ToString() == "True") cbsiteicinde.Checked = true;
                            if (DisDonanim["Oyunparki"].ToString() == "True") cboyunparki.Checked = true;
                            if (DisDonanim["Sportesisi"].ToString() == "True") cbsportesisi.Checked = true;
                            if (DisDonanim["Guvenlik"].ToString() == "True") cbguvenlik.Checked = true;
                            if (DisDonanim["Yuzmehavuzu"].ToString() == "True") cbyuzmehavuzu.Checked = true;
                            if (DisDonanim["Sudeposu"].ToString() == "True") cbsudeposu.Checked = true;
                            if (DisDonanim["Acikotopark"].ToString() == "True") cbacikotopark.Checked = true;
                            if (DisDonanim["Kapaliotopark"].ToString() == "True") cbkapaliotopark.Checked = true;
                            if (DisDonanim["Saglikhizmeti"].ToString() == "True") cbsaglikmerkezi.Checked = true;
                            if (DisDonanim["Kres"].ToString() == "True") cbkres.Checked = true;
                            if (DisDonanim["Alisveris"].ToString() == "True") cbalisveris.Checked = true;
                            if (DisDonanim["Yanginmerdiveni"].ToString() == "True") cbymerdiven.Checked = true;

                        }
                        else
                        {
                            divDisOzellikler.Visible = false;
                        }
                        #endregion

                        // Alt Yapı Özellikleri
                        #region
                        DataRow AltYapiDurum = veri.GetDataRow("Select * From AltYapiDurumu where ilanId=" + ilanId + "");
                        if (AltYapiDurum != null)
                        {
                            if (AltYapiDurum["Imarli"].ToString() == "True") cbimarli.Checked = true;
                            if (AltYapiDurum["Imarsiz"].ToString() == "True") cbimarsiz.Checked = true;
                            if (AltYapiDurum["Ifrazli"].ToString() == "True") cbifrazli.Checked = true;
                            if (AltYapiDurum["Parselli"].ToString() == "True") cbParselli.Checked = true;
                            if (AltYapiDurum["Hisseli"].ToString() == "True") cbHisseli.Checked = true;
                            if (AltYapiDurum["Tapulu"].ToString() == "True") cbTapulu.Checked = true;
                            if (AltYapiDurum["Ruhsat"].ToString() == "True") cbruhsat.Checked = true;
                            if (AltYapiDurum["Turizimimarli"].ToString() == "True") cbturizimimar.Checked = true;
                            if (AltYapiDurum["Yatirimtesviki"].ToString() == "True") cbyatirimtesvik.Checked = true;
                        }
                        else
                        {
                            divAltYapi.Visible = false;
                        }
                        #endregion

                        // Çevre Özellikleri
                        #region

                        DataRow CevreOzellik = veri.GetDataRow("Select * From CevreOzellik where ilanId=" + ilanId + "");
                        if (CevreOzellik != null)
                        {

                            if (CevreOzellik["Bogazmanzarasi"].ToString() == "True") cbbogaz.Checked = true;
                            if (CevreOzellik["Denizmanzarasi"].ToString() == "True") cbdeniz.Checked = true;
                            if (CevreOzellik["Dogaicinde"].ToString() == "True") cbdoga.Checked = true;
                            if (CevreOzellik["Golmanzarasi"].ToString() == "True") cbgol.Checked = true;
                            if (CevreOzellik["Denizeyakin"].ToString() == "True") cbdenizeyakin.Checked = true;
                            if (CevreOzellik["Denizesifir"].ToString() == "True") cbdenizesifir.Checked = true;
                            if (CevreOzellik["Caddeyeyakin"].ToString() == "True") cbcaddeye.Checked = true;
                            if (CevreOzellik["Havaalaninayakin"].ToString() == "True") cbhavaalani.Checked = true;
                            if (CevreOzellik["TopluUlasimayakin"].ToString() == "True") cbtopluulasim.Checked = true;
                            if (CevreOzellik["Otobanayakin"].ToString() == "True") cbotoban.Checked = true;
                            if (CevreOzellik["Metroyayakin"].ToString() == "True") cbmetro.Checked = true;
                            if (CevreOzellik["Ilkogretimokulu"].ToString() == "True") cbilkogretim.Checked = true;
                            if (CevreOzellik["Lise"].ToString() == "True") cblise.Checked = true;
                            if (CevreOzellik["Universite"].ToString() == "True") cbuniversite.Checked = true;
                            if (CevreOzellik["Eczane"].ToString() == "True") cbeczane.Checked = true;
                            if (CevreOzellik["Hastane"].ToString() == "True") cbhastaneyakin.Checked = true;
                            if (CevreOzellik["Saglikocagi"].ToString() == "True") cbsaglikocagi.Checked = true;
                            if (CevreOzellik["Market"].ToString() == "True") cbmarketyakin.Checked = true;
                            if (CevreOzellik["Park"].ToString() == "True") cbpark.Checked = true;
                            if (CevreOzellik["Semtpazari"].ToString() == "True") cbpazar.Checked = true;
                            if (CevreOzellik["Polismerkezi"].ToString() == "True") cbpolis.Checked = true;
                            if (CevreOzellik["Alisverismerkezi"].ToString() == "True") cbamerkezi.Checked = true;

                        }
                        else
                        {
                            divCevreOzellik.Visible = false;
                        }
                        #endregion

                        // emlak danışmanı getir

                        DanismanId = drilan["DanismanId"].ToString();
                        DataRow drDanisman = veri.GetDataRow("Select * from Danisman Where Aktif=1 and DanismanId=" + DanismanId + "");

                        if (drDanisman == null)
                        {
                            divDanisman.Visible = false;
                        }
                        else
                        {

                            lblTel.Text = drDanisman["Tel"].ToString();
                            lblGsm.Text = drDanisman["Gsm"].ToString();
                            lblMail.Text = drDanisman["Mail"].ToString();
                            imgResim.ImageUrl = "../Resimler/Danisman/" + drDanisman["ResimYolu"].ToString();

                            lblAdSoyad.Text = drDanisman["AdSoyad"].ToString();
                            DanismanAdi = drDanisman["AdSoyad"].ToString();

                            imgResim.ToolTip = DanismanAdi;
                            imgResim.AlternateText = DanismanAdi;
                        }


                    }
                    catch (Exception)
                    {

                    }
                }
                else // ilan datarow boşsa
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        void SmsGonder()
        {
            // önce kontrol panelden sms gönderme izni varmı

            DataRow drSms = veri.GetDataRow("Select * From Ayarlar");

            if (drSms["SmsGitsinMi"].ToString() == "True") // izin var
            {
                try
                {
                    // iletişim tablosundaki telede gitsin sms
                    string Tel = veri.GetDataCell("Select Tel2 From iletisim");
                    Tel = Kontrol.Temizle(Tel.Replace(" ", ""));
                    string apino = "1";
                    string user = drSms["SmsKull"].ToString(); // veritabanından getir
                    string pass = drSms["SmsSifre"].ToString();
                    string numaralar = Kontrol.Temizle(lblGsm.Text.Replace(" ", "")) + "," + Tel; // numarayı labelden alsın direk
                    string baslik = Request.Url.Host.ToString();
                    string mesaj = Kontrol.MesajFiltrele("Siteden mesaj var. Ilan No: " + ilanId + " Ad Soyad: " + txtAdSoyad.Text + " Mail: " + txtMail.Text + " Tel: " + txtTel.Text + " Mesaj: " + txtMesaj.Text);


                    string strNewValue;
                    string strResponse;
                    // Create the request obj
                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create("http://kurecell.com.tr/kurecellapiV2/api-center/index.php");
                    // Set values for the request back
                    req.Method = "POST";
                    req.ContentType = "application/x-www-form-urlencoded";
                    strNewValue = req + "&apiNo=" + apino + "&user=" + user + "&pass=" + pass + "&numaralar=" + numaralar + "&mesaj=" + mesaj + "&baslik=" + baslik;
                    req.ContentLength = strNewValue.Length;
                    // Write the request
                    StreamWriter stOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
                    stOut.Write(strNewValue);
                    stOut.Close();
                    // Do the request to get the response
                    StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
                    strResponse = stIn.ReadToEnd();

                    stIn.Close();
                }
                catch (Exception)
                {


                }
            }

        }

        protected void btnMesajGonder_Click1(object sender, EventArgs e)
        {
            // sms gönder
            SmsGonder();

            // mail gönder
            try
            {

                string smtpadres, gidenmail, mailsifre;
                int mailport;

                DataRow Driletisim = veri.GetDataRow("Select * From iletisim");

                smtpadres = Driletisim["Smtp"].ToString();
                gidenmail = Driletisim["Mail"].ToString();
                mailport = Convert.ToInt32(Driletisim["MailPort"]);
                mailsifre = Driletisim["MailSifre"].ToString();



                try
                {
                    SmtpClient smtp = new SmtpClient();
                    smtp.Port = mailport;
                    smtp.Host = smtpadres;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new NetworkCredential(gidenmail, mailsifre);
                    MailAddress mSender = new MailAddress(txtMail.Text);
                    MailAddress mTo = new MailAddress(gidenmail);
                    MailMessage mesaj = new MailMessage(mSender, mTo);

                    mesaj.IsBodyHtml = true;
                    mesaj.Subject = "İlan Detay Sayfası";

                    mesaj.IsBodyHtml = true;
                    mesaj.Subject = Request.Url.Host.ToString() + " İlan Detay";


                    mesaj.Body = "İlan detay sayfasından bir mesaj aldınız.<br> Adı Soyadı: " + txtAdSoyad.Text + "<br> Telefon: " + txtTel.Text + "<br> Email: " + txtMail.Text + " <br> İlan No: " + ilanId + " <br> İlan Adı: " + ilanAdi + " <br> Sayfa: " + Request.Url.ToString() + "<br> Mesaj: " + txtMesaj.Text;


                    if (lblMail.Text != "" || lblMail.Text != null)
                    {
                        // danışmanın mailini boşa db den çekmeye gerek yok labelde vardır.  
                        mesaj.Bcc.Add(lblMail.Text);

                    }

                    smtp.Send(mesaj);

                    Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Mesajınız Gönderildi'); window.location.href ='" + Request.Url.ToString() + "';</script>");
                }
                catch
                {
                    Msg.Show("Mesajınız Gönderilemedi, Lütfen Tekrar Deneyiniz.");

                }


            }
            catch (Exception)
            {

                Msg.Show("Bir Hata Meydana Geldi,Tekrar Deneyiniz.");
            }
        }



        protected void btnKirala_Click1(object sender, EventArgs e)
        {
            //Msg.Show(drBasvuru["GTarih"].ToString());

            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_BasEkle";
            cmd.Parameters.AddWithValue("@ilanID", lblilanNo.Text);
            cmd.Parameters.AddWithValue("@TCNo", txtTcno.Text);
            cmd.Parameters.AddWithValue("@Ad", txtAd.Text);
            cmd.Parameters.AddWithValue("@Soyad", txtSoyad.Text);
            cmd.Parameters.AddWithValue("@Tel", txtTelno.Text);
            cmd.Parameters.AddWithValue("@eposta", txtEposta.Text);
            cmd.Parameters.AddWithValue("@Gtarih", Convert.ToDateTime(txtGtarih.Text));
            cmd.Parameters.AddWithValue("@Ctarih", Convert.ToDateTime(txtCtarih.Text));
            
            try
            {
                cmd.ExecuteNonQuery();
                Msg.Show("Başvurunuz Alınmıştır. En kısa zamanda sizinle irtibata geçilecektir.");
                temizle();
            }
            catch (Exception ex)
            {
                Msg.Show("Bir hata meydana geldi, Lütfen daha sonra tekrar başvurunuz.");
                temizle();
            }
        }

        void temizle()
        {
            txtTcno.Text = "";
            txtAd.Text = "";
            txtSoyad.Text = "";
            txtTelno.Text = "";
            txtEposta.Text = "";
            txtGtarih.Text = "";
            txtCtarih.Text = "";
            


        }
    }
}