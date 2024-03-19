using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace WEBEmlak.yonetim
{
    public partial class Sayfalar : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string islem = "";
        string HaberId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Sayfa Yönetimi";

            try
            {
                string Yetki = veri.GetDataCell("Select Adminmi From Tadmin Where AdminId=" + Session["AdminId"] + "");
                if (Yetki == "False")
                {
                    // buraya izin yok.
                    Response.Redirect("Default.aspx");
                }
            }
            catch (Exception)
            {

                Response.Redirect("Default.aspx");
            }

            try
            {
                if (Page.IsPostBack == false)
                {
                    SayfaGetir();
                }

            }
            catch (Exception)
            {
            }

            islem = Request.QueryString["islem"];
            HaberId = Request.QueryString["HaberId"];
            if (islem == "sil")
            {
                veri.cmd("Delete From Haberler Where HaberId=" + HaberId);
                Response.Redirect("Sayfalar.aspx");
            }
        }
        void SayfaGetir()
        {
            DataTable DtKayitlar = veri.GetDataTable("Select * From Haberler Where SayfaMi=1 Order By HaberId Desc");
            CollectionPager1.DataSource = DtKayitlar.DefaultView;
            CollectionPager1.BindToControl = RpKayit;
            RpKayit.DataSource = CollectionPager1.DataSourcePaged;
            RpKayit.DataBind();
            lblBilgi.Text = "Tüm sayfalar listeleniyor.";


        }
        protected void btnAra_Click(object sender, EventArgs e)
        {
            if (txtAra.Text != "")
            {

                string deger = txtAra.Text.Trim();

                DataTable dtverigetir = veri.GetDataTable("Select * From Haberler Where SayfaMi=1 and HaberAdi like '%" + deger + "%' Order By HaberId Desc");

                RpKayit.DataSource = dtverigetir;

                RpKayit.DataBind();

            }

            else
            {

                lblBilgi.Text = "Kayıt Yok";

            }
        }

        protected void btnHaberler_Click(object sender, EventArgs e)
        {
            SayfaGetir();
        }
    }
}