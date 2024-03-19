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
    public partial class Haberler : System.Web.UI.Page
    { 
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Haberler";
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Haberler";
            HaberGetir();
        }
        void HaberGetir()
        {
            try
            {

                if (!Page.IsPostBack)
                {
                    DataTable dtKayit = veri.GetDataTable("Select * From Haberler Where AktifMi=1 and SayfaMi= 0 Order By HaberId Desc");

                    CollectionPager1.DataSource = dtKayit.DefaultView;
                    CollectionPager1.BindToControl = RpHaberler;
                    RpHaberler.DataSource = CollectionPager1.DataSourcePaged;
                    RpHaberler.DataBind();
                }
            }
            catch (Exception)
            {

            }
        }
    }
}