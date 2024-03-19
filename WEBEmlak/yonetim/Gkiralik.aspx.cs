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
    public partial class Gkiralık : System.Web.UI.Page
    {

        baglanti veri = new baglanti();
        string islem = "", ilanId = "";
        string ilId, ilceId, semtId, aramadeger, sorgu = "";

        protected void Page_Load(object sender, EventArgs e)
        {
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

            Page.Title = "Başvurular";
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Başvurular";

            if (!Page.IsPostBack)
            {
                ilanGetir(); 
            }
           

        }
        void ilanGetir()
        {
            DataTable DtKayitlar = veri.GetDataTable("select *, case  Aktif when 0 then 'Pasif' when 1 then 'Aktif' end as Durumadi,case  Aktif when 0 then 'Aktif Yap' when 1 then 'Pasif Yap' end as islemyap,case  Aktif when 0 then 'images/onay.png' when 1 then 'images/onaykaldir.png' end as resim from basvuru order by BasID Desc");

            CollectionPager1.DataSource = DtKayitlar.DefaultView;
            CollectionPager1.BindToControl = rpGunluk;
            rpGunluk.DataSource = CollectionPager1.DataSourcePaged;
            rpGunluk.DataBind();
            lblBilgi.Text = "Tüm Başvurular listeleniyor. Toplam: " + DtKayitlar.Rows.Count + " Başvuru var.";

        }

        protected void rpGunluk_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
         
            if (e.CommandName == "Onayla" && e.CommandArgument != null)
            {
                string Aktif = veri.GetDataCell("Select Aktif From Basvuru Where BasID="+e.CommandArgument+"");

                if (Aktif == "True") // yorum aktifse pasif yap
                {

                    veri.cmd("Update Basvuru Set Aktif=0 Where BasID=" + e.CommandArgument + "");
                    Response.Redirect("Gkiralik.aspx");

                }
                else // pasif ise aktif yap
                {


                    veri.cmd("Update Basvuru Set Aktif=1 Where BasID=" + e.CommandArgument + "");
                    Response.Redirect("Gkiralik.aspx");

                }


            }
          
        }
       
       
    }
}
