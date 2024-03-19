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
    public partial class Ayarlar : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        Label lbl1;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Genel Ayarlar";
            Page.Title = "Genel Ayarlar";

           

            try
            {
                string Yetki = veri.GetDataCell("Select Adminmi From Tadmin Where AdminId=" + Session["AdminId"] + "");
                if (Yetki == "False")
                {
                    // buraya izin yok.
                    Response.Redirect("Default.aspx");
                }
               

                DataRow drAyar = veri.GetDataRow("Select * From Ayarlar");
                if (Page.IsPostBack == false)
                {

                    if (drAyar["SmsGitsinMi"].ToString() == "True")
                    {
                        ddSms.SelectedValue = "1"; // else zaten ilki seçili gelir.
                    }

                    txtSmsAd.Text = drAyar["SmsKull"].ToString();
                    txtSmsSifre.Text = drAyar["SmsSifre"].ToString();
                }
            }
            catch (Exception)
            {

            }
        }

        protected void ddSms_SelectedIndexChanged(object sender, EventArgs e)
        {
            veri.cmd("Update Ayarlar Set SmsGitsinMi=" + ddSms.SelectedValue + "");
            Msg.Show("Ayarınız kaydedildi.");
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {

            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand("Update Ayarlar Set SmsKull=@SmsKull,SmsSifre=@SmsSifre", baglanti);
            cmd.Parameters.AddWithValue("@SmsKull", txtSmsAd.Text);
            cmd.Parameters.AddWithValue("@SmsSifre", txtSmsSifre.Text);

            try
            {
                cmd.ExecuteNonQuery();
                Msg.Show("Ayarınız kaydedildi.");
            }
            catch (Exception)
            {
                Msg.Show("Bir hata oluştu, tekrar deneyiniz.");
            }
        }
    }
}