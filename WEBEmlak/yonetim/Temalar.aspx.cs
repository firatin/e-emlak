using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WEBEmlak.yonetim
{
    public partial class Temalar : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
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

            if (!IsPostBack)
            {
                string secilitem = veri.GetDataCell("Select SecTema from tema");
                ddlTema.SelectedValue = secilitem;
            }
        }

        protected void ddlTema_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = veri.baglan();
                SqlCommand comm = new SqlCommand("Update Tema set SecTema=@SecTema", con);
                comm.Parameters.AddWithValue("@SecTema", ddlTema.SelectedValue);
                comm.ExecuteNonQuery();

                Msg.Show("Tema değiştirildi");
          
            }
            catch (Exception)
            {
                SqlConnection con = veri.baglan();
                SqlCommand comm = new SqlCommand("Update Tema set SecTema='/css/realia-blue.css'", con);
                comm.Parameters.AddWithValue("@SecTema", ddlTema.SelectedValue);
                comm.ExecuteNonQuery();
                Msg.Show("Hata oluştu.Ana Tema Aktif");
               
            }
           
        }
    }
}