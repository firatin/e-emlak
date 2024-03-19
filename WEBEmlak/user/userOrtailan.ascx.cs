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
    public partial class userOrtailan : System.Web.UI.UserControl
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            ilangetir();

        }
        void ilangetir()
        {
            try
            {

                DataTable dtilanlar = veri.GetDataTable("Select Top 9 ilanAdi,ilanId,Metrekare,Fiyat,AnaResim150,AnaResim800,TurId,case TurId when 0 then 'Satılık' when 1 then 'Kiralık' end as  Tur,iller.ilAdi,ilceler.ilceAdi From ilanlar INNER JOIN iller ON ilanlar.ilId = dbo.iller.ilId INNER JOIN ilceler ON ilanlar.ilceId = dbo.ilceler.ilceId Where Aktif=1 Order By ilanId Desc ");

                if (dtilanlar.Rows.Count >= 1)
                {
                    rpOrtailan.DataSource = dtilanlar;
                    rpOrtailan.DataBind();
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
    }
}