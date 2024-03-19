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
    public partial class Danismanlar : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Gayrımenkul Danışmanları";
            Page.Title = "Gayrımenkul Danışmanları";
            Page.MetaDescription = "Gayrımenkul Danışmanları";
            Page.MetaKeywords = "Gayrımenkul Danışmanları";
            if (!Page.IsPostBack)
            {
                DanismanGetir();
                
            }

        }

        void DanismanGetir()
        {
            DataTable dtDanisman = veri.GetDataTable("Select * From Danisman Where Aktif=1 Order By DanismanId Desc");

            if (dtDanisman != null)
            {
                CollectionPager1.DataSource = dtDanisman.DefaultView;
                CollectionPager1.BindToControl = RpDanismanilan;
                RpDanismanilan.DataSource = CollectionPager1.DataSourcePaged;
                RpDanismanilan.DataBind();

            }
            else
            {

            }
        }
    }
}