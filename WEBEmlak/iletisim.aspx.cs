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

namespace WEBEmlak
{
    public partial class İletisim : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "İletişim Bilgilerimiz";
            Page.MetaDescription = "İletişim Bilgilerimiz";

            try
            {
                DataRow drBilgi = veri.GetDataRow("Select * From iletisim");
                lblTel.Text = drBilgi["Tel1"].ToString();
                lblGsm.Text = drBilgi["Tel2"].ToString();
                lblFax.Text = drBilgi["Fax"].ToString();
                lblMail.Text = drBilgi["Mail"].ToString();
                lblAdres.Text = drBilgi["Adres"].ToString();
                lblHarita.Text = drBilgi["Harita"].ToString();

            }
            catch (Exception)
            {

            }
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            // mail gönder
            try
            {

                string smtpadres, gidenmail, mailsifre;
                int mailport;

                DataRow Driletisim = veri.GetDataRow("Select * From iletisim");

                smtpadres = Driletisim["Smtp"].ToString();
                gidenmail = Driletisim["Mail"].ToString();
                mailport = Convert.ToInt32(Driletisim["MailPort"]);
                mailsifre = Driletisim["MailSifre"].ToString();



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
                    mesaj.Subject = "İletişim Sayfası";

                    mesaj.IsBodyHtml = true;
                    mesaj.Subject = Request.Url.Host.ToString() + " İletişim Sayfası";


                    mesaj.Body = "İletişim sayfasından bir mesaj aldınız.<br> Adı Soyadı: " + txtAdSoyad.Text + "<br> Telefon: " + txtTel.Text + "<br> Email: " + txtMail.Text + "<br> Mesaj: " + txtMesaj.Text;


                    if (lblMail.Text != "" || lblMail.Text != null)
                    {
                        // danışmanın mailini boşa db den çekmeye gerek yok labelde vardır.  
                        mesaj.Bcc.Add(lblMail.Text);

                    }

                    smtp.Send(mesaj);

                    Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Mesajınız Gönderildi'); window.location.href ='/iletisim.aspx';</script>");
                }
                catch
                {
                    Msg.Show("Mesajınız Gönderilemedi, Lütfen Tekrar Deneyiniz.");

                }


            }
            catch (Exception)
            {

                Msg.Show("Bir Hata Meydana Geldi,Tekrar Deneyiniz.");
            }

        }
    }
}