using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace WEBEmlak
{
    public partial class Basvuru : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string resimadi = "", uzanti = "", resimtip = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
        }

        protected void btnTamam_Click(object sender, EventArgs e)
        {
            if (FuResim.HasFile)
            {
                resimtip = FuResim.PostedFile.ContentType;

                if (resimtip == "image/jpeg" || resimtip == "image/jpg" || resimtip == "image/png" || resimtip == "image/bmp")
                {

                    //rasgale sayı
                    Random numara = new Random();
                    Random numara2 = new Random();

                    int resimadisayi = numara.Next(1, 10000);
                    int resimSayi = numara2.Next(1, 7);
                    uzanti = Path.GetExtension(FuResim.PostedFile.FileName);
                    string[] resimDizi = { "r", "re", "res", "resi", "resim", "dns", "dnsmn" };
                    resimadi = resimDizi[resimSayi] + resimadisayi + uzanti;


                    FuResim.SaveAs(Server.MapPath("/Resimler/Danisman/" + resimadi));

                    DanismanEkle();


                }
                else
                {
                    Msg.Show("Resmin uzantısı sadece, JPG,PNG ve BMP olmalıdır.");
                }

            }
            else
            {
                Msg.Show("Bir resim seçmek zorundasınız.");
            }
               
        }
        void DanismanEkle()
        {
            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_DanismanEkle";
            cmd.Parameters.AddWithValue("@AdSoyad", txtAdSoyad.Text.Trim());
            cmd.Parameters.AddWithValue("@Mail", txtMail.Text);
            cmd.Parameters.AddWithValue("@ResimYolu", resimadi);
            cmd.Parameters.AddWithValue("@Tel", txtTel.Text);
            cmd.Parameters.AddWithValue("@Gsm", txtGsm.Text);
            cmd.Parameters.AddWithValue("@Adres", txtAdres.Text);
            cmd.Parameters.AddWithValue("@Aktif", "2");
            // 0 pasif 1 aktif 2 danışman onay beklemede onay bekleme site kısmında danışmanlık başvurusu yaparken kullandım.

            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Başvuru tamamlandı.Kısa sürede geri dönüş yapılacaktır.'); window.location.href ='/Basvuru.aspx';</script>");
            }
            catch (Exception)
            {
                Msg.Show("Bir hata oluştu, lütfen tekrar deneyin.");

            }
        }
       
        
    }
}