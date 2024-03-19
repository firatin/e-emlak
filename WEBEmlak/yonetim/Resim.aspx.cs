using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AjaxControlToolkit;
using System.Drawing;
using System.IO;

namespace WEBEmlak.yonetim
{
    public partial class Resim : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        public string ilanId;
        string  resimadi, ResimId, islem;
        protected void Page_Load(object sender, EventArgs e)
        {

            //try
            //{
            islem = Request.QueryString["islem"];
            ilanId = Kontrol.SayiKontrol(Request.QueryString["ilan"]);
            ResimId = Request.QueryString["Resim"];

          
            
           

            //}
            //catch (Exception)
            //{
            //    Response.Redirect("ilanekle.aspx");

            //}


        }

        void ResimGetir()
        {
            try
            {
                DataTable DtKayitlar = veri.GetDataTable("Select * From Resimler Where ilanId=" + ilanId + "");
                DlisResimler.DataSource = DtKayitlar;
                DlisResimler.DataBind();
            }
            catch (Exception)
            {

            }

        }
    }
}