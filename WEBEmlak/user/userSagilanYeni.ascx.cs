using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using System.Data.SqlClient;
using System.Data;


namespace WEBEmlak.user
{
    public partial class userSagilanYeni : System.Web.UI.UserControl
    { baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            Rastgeleilan();
        }
        void Rastgeleilan()
        {
            try
            {
                if (Page.IsPostBack == false)
                {

                    DataTable dtKayit = veri.GetDataTable("Select Top 3 Left(ilanAdi,25)+'...'as kisaad,ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800 From ilanlar where Aktif=1 Order By NewId()");
                    RpRastgele.DataSource = dtKayit;
                    RpRastgele.DataBind();

                }
            }
            catch (Exception)
            {

            }

        }
        void SayfaGetir()
        {
            try
            {

                if (!Page.IsPostBack)
                {
                    DataTable dtKayit = veri.GetDataTable("Select Top 8 * From Haberler Where AktifMi=1 and SayfaMi=1 Order By HaberId Desc");
                    //RpSayfalar.DataSource = dtKayit;
                    //RpSayfalar.DataBind();
                }
            }
            catch (Exception)
            {

            }

        }
    }
}