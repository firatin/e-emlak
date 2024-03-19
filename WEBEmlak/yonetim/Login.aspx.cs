using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
namespace Emlak.Yonet
{
    public partial class Login : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string Sifre = "";
            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand("Select Top 1 * From Tadmin Where KullaniciAdi=@KullaniciAdi and Sifre=@Sifre", baglanti);
            cmd.Parameters.AddWithValue("KullaniciAdi", Kontrol.EmailGirisTemizle(txtKullaniciAdi.Text));
            Sifre = Kontrol.Md5Sifrele(txtSifre.Text);

            cmd.Parameters.AddWithValue("Sifre", Sifre);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["AdminId"] = dr["AdminId"];
                Session["KullaniciAdi"] = dr["KullaniciAdi"];
                Session["Adminmi"] = dr["Adminmi"];
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblBilgi.Text = "Kullanıcı Adı veya Şifre Yanlış";
                txtKullaniciAdi.Text = "";
                txtSifre.Text = "";
            }
        }

    }
}