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
    public partial class AnaPage : System.Web.UI.MasterPage
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblAdmin.Text = Session["KullaniciAdi"].ToString();

                string Yetki = veri.GetDataCell("Select Adminmi From Tadmin Where AdminId=" + Session["AdminId"] + "");
                if (Yetki == "True")
                {
                    // admin
                }
                else
                {
                    divAdmin.Visible = false; // editör
                }

            }
           


        }

        protected void lnkCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }


    }
}