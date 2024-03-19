using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace WEBEmlak.user
{
    public partial class userAltilan : System.Web.UI.UserControl
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            hitilangetir();
        }
        void hitilangetir()
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    DataTable dtilanlar = veri.GetDataTable("Select Left(ilanAdi,20)+'...' as ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,Hit,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 Order By Hit Desc ");

                    if (dtilanlar.Rows.Count >= 1)
                    {

                        RpHitilanlar.DataSource = dtilanlar;
                        RpHitilanlar.DataBind();



                    }
                    else
                    {
                        //carousel.Visible = false; // css'teki div

                    }
                }
            }
            catch (Exception)
            {


            }
        }

    }
}