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
    public partial class Ara : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string AramaDegeri, Sorgu, islem, TipId, ilId, ilceId, SemtId, ki, st;
        Label lbl1;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl1 = (Label)Master.FindControl("lblBilgi");
            try
            {
                //k kolay arama g gelismis aramadır. / s de (search türü) gelen querystring dir.
                //ki kiralık st satılıktır.

                islem = Request.QueryString["s"];

                if (islem == "k")
                {
                    AramaDegeri = Request.QueryString["bul"];

                    if (AramaDegeri != null && AramaDegeri != "")
                    {

                        AramaDegeri = Kontrol.AramaKontrol(AramaDegeri);
                        Sorgu = " and ilanAdi Like '%" + AramaDegeri + "%' Or ilanId Like '%" + AramaDegeri + "%'";
                        KolayArama();
                    }
                    else
                    {
                        lbl1.Text = "Arama kriterinize uygun sonuç bulunamadı. Şu ilanlar ilgilinizi çekebilir";
                        divVitrinilan.Visible = true;

                    }
                }
                else if (islem == "g") // g gelişmiş arama demek
                {

                    try
                    {
                        TipId = Kontrol.SayiKontrol(Request.QueryString["tip"]);
                        ilId = Kontrol.SayiKontrol(Request.QueryString["il"]);
                        ilceId = Kontrol.SayiKontrol(Request.QueryString["ilce"]);
                        SemtId = Kontrol.SayiKontrol(Request.QueryString["semt"]);
                        ki = Kontrol.SayiKontrol(Request.QueryString["ki"]);
                        st = Kontrol.SayiKontrol(Request.QueryString["st"]);
                    }
                    catch (Exception)
                    {

                    }

                    if (TipId != "0" && ilId != null)
                    {
                        Sorgu = " and ilanlar.TipId='" + TipId + "'";


                        if (ilId != "0" && ilId != null)
                        {
                            Sorgu = Sorgu + " and ilanlar.ilId='" + ilId + "'";
                        }

                        if (ilceId != "0" && ilceId != null)
                        {
                            Sorgu = Sorgu + " and ilanlar.ilceId='" + ilceId + "'";
                        }

                        if (SemtId != "0" && SemtId != null)
                        {
                            Sorgu = Sorgu + " and ilanlar.SemtId='" + SemtId + "'";
                        }

                        if ((ki == "1" && st == "1"))
                        {
                           // Sorgu = Sorgu;
                        }
                        else if (ki == "1")
                        {
                            Sorgu = Sorgu + " and ilanlar.TurId=1";
                        }
                        else if (st == "1")
                        {
                            Sorgu = Sorgu + "  and ilanlar.TurId=0";
                        }


                        //metodu çek
                        GelismisArama();

                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }



                }
                else
                {
                    Response.Redirect("Default.aspx");
                }


            }
            catch (Exception)
            {

            }

        }

        void KolayArama()
        {

            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtilanlar = veri.GetDataTable("Select  Left(ilanAdi,35)+'...' as ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 " + Sorgu + " Order By ilanId Desc");

                    if (dtilanlar.Rows.Count >= 1)
                    {
                        CollectionPager1.DataSource = dtilanlar.DefaultView;
                        CollectionPager1.BindToControl = RpOrtailanlar;
                        RpOrtailanlar.DataSource = CollectionPager1.DataSourcePaged;
                        RpOrtailanlar.DataBind();

                        Page.Title = "Arama Sonuçları - " + AramaDegeri;
                        Page.MetaDescription = "Arama Sonuçları - " + AramaDegeri;
                        Page.MetaKeywords = "Arama Sonuçları - " + AramaDegeri;
                        lbl1.Text = dtilanlar.Rows.Count + " Sonuç Bulundu Sonuçlar Listeleniyor";
                    }
                    else
                    {
                        lbl1.Text = "Arama kriterinize uygun sonuç bulunamadı. Şu ilanlar ilgilinizi çekebilir";
                        divVitrinilan.Visible = true;
                        Page.Title = "Sonuç bulunamadı.";

                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        void GelismisArama()
        {

            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtilanlar = veri.GetDataTable("Select Left(ilanAdi,35)+'...' as ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 " + Sorgu + " Order By ilanId Desc");

                    if (dtilanlar.Rows.Count >= 1)
                    {
                        CollectionPager1.DataSource = dtilanlar.DefaultView;
                        CollectionPager1.BindToControl = RpOrtailanlar;
                        RpOrtailanlar.DataSource = CollectionPager1.DataSourcePaged;
                        RpOrtailanlar.DataBind();

                        Page.Title = "Arama Sonuçları";
                        Page.MetaDescription = "Arama Sonuçları";
                        Page.MetaKeywords = "Arama Sonuçları";
                        lbl1.Text = dtilanlar.Rows.Count + " Sonuç Bulundu Sonuçlar Listeleniyor";
                    }
                    else
                    {
                        lbl1.Text = "Arama kriterinize uygun sonuç bulunamadı. Şu ilanlar ilgilinizi çekebilir";
                        divVitrinilan.Visible = true;
                        Page.Title = "Sonuç bulunamadı.";

                    }
                }
            }
            catch (Exception ex)
            {


            }
        }
    }
}