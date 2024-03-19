using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WEBEmlak.user
{
    public partial class userArama : System.Web.UI.UserControl
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            ilangetir();
            ilGetir();
        }
        void ilangetir()
        {
            try
            {

                DataTable dtilanlar = veri.GetDataTable("Select Top 3 Left(ilanAdi,35)+'...' as ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 Order By ilanId Desc ");

                if (dtilanlar.Rows.Count >= 1)
                {
                    rpSlider.DataSource = dtilanlar;
                    rpSlider.DataBind();
                }
                else
                {
                    Msg.Show("Henüz ilan eklenmedi");


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
                ddSemt.Items.Add("Önce İlçe Seçiniz");
                ddSemt.Items[0].Value = "0";


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
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            int kiralik = 0, satilik = 0;
            if (cbKiralik.Checked == true)
            {
                kiralik = 1;
            }
            if (cbSatilik.Checked == true)
            {
                satilik = 1;
            }

            Response.Redirect("Ara.aspx?s=g&tip=" + ddTip.SelectedValue + "&il=" + ddil.SelectedValue + "&ilce=" + ddilce.SelectedValue + "&semt=" + ddSemt.SelectedValue + "&ki=" + kiralik + "&st=" + satilik + "");


        }

    }
}