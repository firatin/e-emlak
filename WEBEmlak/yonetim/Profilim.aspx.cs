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
    public partial class Profilim : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string AdminId, UyeId;
        DataRow drAdmin;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Profilim";

            try
            {
                AdminId = Session["AdminId"].ToString();
                UyeId = Kontrol.SayiKontrol(Request.QueryString["Uye"]);
            }
            catch (Exception)
            {
                Response.Redirect("Login.aspx");
            }

            if (AdminId != null)
            {
                if (UyeId == null || UyeId == "0" || UyeId == "")
                {
                    // eğer boşsa kendi profilidir veya 0 sa url ile oynanmıştır
                }
                else
                {
                    // uye boş değilse seçili üye düzenlenmek isteniyordur onun bilglierini getir.
                    AdminId = UyeId; // bu adminıd li bilgileri getir düzenle ama eğer boşsa sessiondaki admini getirir zaten
                    // yetki seçilebilmesi için bunu açıyorum
                    divUyeler.Visible = true;

                    divDropuyeler.Visible = false;// düzenleme sırsında diğer üyeler görünmesin

                    btnSil.Visible = true; 
                    btnGeri.Visible = true;

                }


                drAdmin = veri.GetDataRow("Select * From Tadmin Where AdminId=" + AdminId);

                if (drAdmin != null)
                {
                    if (Page.IsPostBack == false)
                    {
                        txtKullanici.Text = drAdmin["KullaniciAdi"].ToString();
                        txtMail.Text = drAdmin["Mail"].ToString();

                        if (drAdmin["Adminmi"].ToString() == "True")
                        {
                            ddYetkiust.SelectedValue = "1";
                            // adminse yeni üye ekleyebilsin.
                            divYeniUye.Visible = true;

                            // ve diğer üyeleri düzenleyebilsin.
                            KayitliUyeler();


                        }
                        else
                        {
                            ddYetkiust.SelectedValue = "0";
                        }

                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            string eskisifre;
            if (txtSifre.Text != txtSifreTekrar.Text)
            {
                lblBilgi.Text = "Girdiğiniz Şifreler Uyuşmamaktadır.";
            }
            else if (cboxSifre.Checked == true && txtSifre.Text == "")
            {
                lblBilgi.Text = "Lütfen Değiştirmek İstediğiniz Şifreyi Yazın.";
            }
            else
            {
                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand("Update Tadmin Set Sifre=@Sifre,KullaniciAdi=@KullaniciAdi,Mail=@Mail,Adminmi=@Adminmi where AdminId=" + AdminId, baglanti);

                cmd.Parameters.AddWithValue("KullaniciAdi", txtKullanici.Text);
                cmd.Parameters.AddWithValue("Mail", txtMail.Text);
                cmd.Parameters.AddWithValue("Adminmi", ddYetkiust.SelectedValue);
                if (cboxSifre.Checked == true)
                {

                    cmd.Parameters.AddWithValue("Sifre", Kontrol.Md5Sifrele(txtSifreTekrar.Text));
                }
                else
                {

                    AdminId = Session["AdminId"].ToString();

                    DataRow drsifre = veri.GetDataRow("Select Sifre From Tadmin Where AdminId=" + AdminId);
                    eskisifre = drsifre["Sifre"].ToString();
                    cmd.Parameters.AddWithValue("Sifre", eskisifre);
                }
                cmd.ExecuteNonQuery();
                Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Güncelleme Başarılı'); window.location.href ='Profilim.aspx';</script>");

            }
        }

        protected void cboxSifre_CheckedChanged(object sender, EventArgs e)
        {
            lnkSifreTavsiye.Visible = true;


            txtSifre.Enabled = true;
            txtSifreTekrar.Enabled = true;

            if (cboxSifre.Checked == false)
            {
                txtSifre.Enabled = false;
                txtSifreTekrar.Enabled = false;

                lnkSifreTavsiye.Visible = false;
                lblSifre.Visible = false;
                txtTavsiye.Visible = false;
            }
        }

        protected void lnkSifreTavsiye_Click(object sender, EventArgs e)
        {
            lblSifre.Text = "Şifre:";
            lblSifre.Visible = true;
            txtTavsiye.Text = Kontrol.SifreOlustur();
            txtTavsiye.Visible = true;
            txtTavsiye.Focus();
            lblSifreBilgi.Visible = true;

        }

        protected void lnkYeniSifreTavsiye_Click(object sender, EventArgs e)
        {
            txtYeniTavsiye.Visible = true;
            lblYeniSifreBilgi.Visible = true;
            lblYeniSifre.Visible = true;
            lblYeniSifre.Text = "Şifre:";
            txtYeniTavsiye.Text = Kontrol.SifreOlustur();
            txtYeniTavsiye.Focus();
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand("Select * from Tadmin Where KullaniciAdi=@KullaniciAdi", baglanti);
            cmd.Parameters.AddWithValue("@KullaniciAdi", txtYeniKullanici.Text);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Msg.Show("Bu kullanıcı adında bir kullanıcı var, başka bir kullanıcı adı deneyin.");
            }

            else
            {

                try
                {

                    SqlConnection baglan = veri.baglan();
                    SqlCommand cmdiki = new SqlCommand("Insert Into Tadmin (KullaniciAdi,Sifre,Mail,Adminmi) Values (@KullaniciAdi,@Sifre,@Mail,@Adminmi)", baglan);
                    cmdiki.Parameters.AddWithValue("@KullaniciAdi", txtYeniKullanici.Text.Trim());
                    cmdiki.Parameters.AddWithValue("@Sifre", Kontrol.Md5Sifrele(txtYeniTekrar.Text.Trim()));
                    cmdiki.Parameters.AddWithValue("@Mail", txtYeniMail.Text.Trim());
                    cmdiki.Parameters.AddWithValue("@Adminmi", ddYetki.SelectedValue);

                    cmdiki.ExecuteNonQuery();

                    Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('İşlem Tamamlandı'); window.location.href ='Profilim.aspx';</script>");

                }
                catch (Exception ex)
                {

                    Msg.Show("Bir hata meydana geldi,lütfen tekrar deneyin " + ex.Message);
                }

            }
        }

        void KayitliUyeler()
        {

            try
            {
                if (!Page.IsPostBack)
                {


                    DataTable dtKayit = veri.GetDataTable("Select *, case when Adminmi=1 then 'Admin' when Adminmi=0 then 'Editor' end as Durum From Tadmin where AdminId <>" + AdminId + " "); // kendini silmesin diye AdminId <>adminId
                    if (dtKayit.Rows.Count > 0)
                    {
                        ddUyeler.Items.Add("Kayıtlı Yöneticiler");
                        ddUyeler.Items[0].Value = "0";
                        divUyeler.Visible = true;
                        int sira = 1;
                        for (int i = 0; i < dtKayit.Rows.Count; i++)
                        {
                            DataRow DrKayitlar = dtKayit.Rows[i];
                            ddUyeler.Items.Add(DrKayitlar["KullaniciAdi"].ToString() + " Yetki: " + DrKayitlar["Durum"].ToString());
                            ddUyeler.Items[sira].Value = DrKayitlar["AdminId"].ToString();
                            sira++;
                        }

                    }
                }
            }
            catch (Exception)
            {

            }
        }

        protected void ddUyeler_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Profilim.aspx?Uye=" + ddUyeler.SelectedValue + "");
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profilim.aspx");
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
               
                veri.cmd("Delete From Tadmin where AdminId=" + AdminId + "");
                Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('İşlem Tamamlandı'); window.location.href ='Profilim.aspx';</script>");
            }
            catch (Exception)
            {
               
            }
        }
    }
}