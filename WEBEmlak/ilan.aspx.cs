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
    public partial class İlan : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string islem; Label lbl1;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl1 = (Label)Master.FindControl("lblBilgi");

            islem = Request.QueryString["ilan"];

            if (islem == "konut")
            {
                konutilangetir();
            }
            else if (islem == "isyeri")
            {
                isyerigetir();
            }
            else if (islem == "arsa")
            {
                arsagetir();
            }
            else if (islem == "gunluk")
            {
                gunlukgetir();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }



        }

        private void gunlukgetir()
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtilanlar = veri.GetDataTable("Select KonutTipId,ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 and TipId=1 and KonutTipId=15 Order By ilanId Desc ");

                    if (dtilanlar.Rows.Count >= 1)
                    {
                        CollectionPager1.DataSource = dtilanlar.DefaultView;
                        CollectionPager1.BindToControl = RpOrtailanlar;
                        RpOrtailanlar.DataSource = CollectionPager1.DataSourcePaged;
                        RpOrtailanlar.DataBind();

                        Page.Title = "Konut İlanları";
                        Page.MetaDescription = "Konut İlanları";
                        Page.MetaKeywords = "Konut İlanları";
                        lbl1.Text = "Konut İlanları";
                    }
                    else
                    {
                        lbl1.Text = "Henüz konut ilanı eklenmedi";

                    }
                }
            }
            catch (Exception)
            {


            }
        }
        void konutilangetir()
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtilanlar = veri.GetDataTable("Select ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 and TipId=1 Order By ilanId Desc ");

                    if (dtilanlar.Rows.Count >= 1)
                    {
                        CollectionPager1.DataSource = dtilanlar.DefaultView;
                        CollectionPager1.BindToControl = RpOrtailanlar;
                        RpOrtailanlar.DataSource = CollectionPager1.DataSourcePaged;
                        RpOrtailanlar.DataBind();

                        Page.Title = "Konut İlanları";
                        Page.MetaDescription = "Konut İlanları";
                        Page.MetaKeywords = "Konut İlanları";
                        lbl1.Text = "Konut İlanları";
                    }
                    else
                    {
                        lbl1.Text = "Henüz konut ilanı eklenmedi";

                    }
                }
            }
            catch (Exception)
            {


            }
        }
        void isyerigetir()
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtilanlar = veri.GetDataTable("Select ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 and TipId=2 Order By ilanId Desc ");

                    if (dtilanlar.Rows.Count >= 1)
                    {
                        CollectionPager1.DataSource = dtilanlar.DefaultView;
                        CollectionPager1.BindToControl = RpOrtailanlar;
                        RpOrtailanlar.DataSource = CollectionPager1.DataSourcePaged;
                        RpOrtailanlar.DataBind();

                        Page.Title = "İşyeri İlanları";
                        Page.MetaDescription = "İşyeri İlanları";
                        Page.MetaKeywords = "İşyeri İlanları";
                        lbl1.Text = "İşyeri İlanları";
                    }
                    else
                    {
                        lbl1.Text = "Henüz işyeri ilanı eklenmedi";

                    }
                }
            }
            catch (Exception)
            {


            }
        }

        void arsagetir()
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtilanlar = veri.GetDataTable("Select ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 and TipId=3 Order By ilanId Desc ");

                    if (dtilanlar.Rows.Count >= 1)
                    {
                        CollectionPager1.DataSource = dtilanlar.DefaultView;
                        CollectionPager1.BindToControl = RpOrtailanlar;
                        RpOrtailanlar.DataSource = CollectionPager1.DataSourcePaged;
                        RpOrtailanlar.DataBind();

                        Page.Title = "Arsa İlanları";
                        Page.MetaDescription = "Arsa İlanları";
                        Page.MetaKeywords = "Arsa İlanları";
                        lbl1.Text = "Arsa İlanları";
                    }
                    else
                    {
                        lbl1.Text = "Henüz arsa ilanı eklenmedi";

                    }
                }
            }
            catch (Exception)
            {


            }
        }
    }
}