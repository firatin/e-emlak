using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
namespace WEBEmlak.Yonet
{

    public partial class SifremiUnuttum : System.Web.UI.Page
    {
         baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {

            try
            {

                string smtpadres, gidenmail, mailsifre;
                int mailport;

                DataRow Driletisim = veri.GetDataRow("Select * From iletisim");

                smtpadres = Driletisim["Smtp"].ToString();
                gidenmail = Driletisim["Mail"].ToString();
                mailport = Convert.ToInt32(Driletisim["MailPort"]);
                mailsifre = Driletisim["MailSifre"].ToString();

                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand("Select * from Tadmin Where Mail=@Mail", baglanti);
                cmd.Parameters.AddWithValue("@Mail", txtMail.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    try
                    {
                        SmtpClient smtp = new SmtpClient();
                        smtp.Port = mailport;
                        smtp.Host = smtpadres;
                        smtp.EnableSsl = true;
                        smtp.Credentials = new NetworkCredential(gidenmail, mailsifre);
                        MailAddress mSender = new MailAddress(txtMail.Text);
                        MailAddress mTo = new MailAddress(gidenmail);
                        MailMessage mesaj = new MailMessage(mSender, mTo);

                        mesaj.IsBodyHtml = true;
                        mesaj.Subject ="Şifremi Unuttum Sayfası";

                        mesaj.IsBodyHtml = true;
                        mesaj.Subject = Request.Url.Host.ToString() + " Şifreniz";
                        string YeniSifreUret = "";
                        YeniSifreUret = Kontrol.SifreOlustur();
                        mesaj.Body ="Şifremi unuttum talebinde bulundunuz.<br>Yeni Şifreniz: " + YeniSifreUret +"<br> "+ Request.Url.GetLeftPart(UriPartial.Authority).ToString() ;

                        smtp.Send(mesaj);
                        Msg.Show("Yeni Şifreniz Mail Hesabınıza Gönderildi.");

                        veri.cmd("Update Tadmin Set Sifre='" + Kontrol.Md5Sifrele(YeniSifreUret) + "'" + " Where Mail='" + txtMail.Text + "'");

                    }
                    catch
                    {
                        Msg.Show("Şifreniz Gönderilemedi, Lütfen Tekrar Deneyiniz.");

                    }
                }
                else
                {
                  //  Msg.Show("Bu E-posta adresine bağlı bir kullanıcı bulunamadı.");

                }
            }
            catch (Exception)
            {

                Msg.Show("Bir Hata Meydana Geldi,Tekrar Deneyiniz.");
            }

        }

    }
}