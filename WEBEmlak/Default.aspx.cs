using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WEBEmlak
{
    public partial class Default : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            TitleGetir();
        }
        void TitleGetir()
        {
            try
            {

                DataRow dtKayit = veri.GetDataRow("Select Title,Descript,Keywords From MetaTag");
                Title = dtKayit["Title"].ToString();
                Page.Title = dtKayit["Title"].ToString();
                Page.MetaDescription = dtKayit["Descript"].ToString();
                Page.MetaKeywords = dtKayit["Keywords"].ToString();

            }
            catch (Exception)
            {

            }
        }
    }
}