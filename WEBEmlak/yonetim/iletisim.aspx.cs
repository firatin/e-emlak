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
    public partial class iletisim : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string MailSifre;
        DataRow drbilgi;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "İletişim Bilgileri";
            Label lbl = (Label)Master.FindControl("lblBilgi");
            lbl.Text = "İletişim Bilgiler";

            drbilgi = veri.GetDataRow("Select * From iletisim");
            MailSifre = drbilgi["MailSifre"].ToString();

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

            if (!Page.IsPostBack)
            {
                try
                {
                   

                    txtAdres.Text = drbilgi["Adres"].ToString();
                    txtTel1.Text = drbilgi["Tel1"].ToString();
                    txtTel2.Text = drbilgi["Tel2"].ToString();
                    txtFax.Text = drbilgi["Fax"].ToString();
                    txtMail.Text = drbilgi["Mail"].ToString();
                   
                    txtMailSmtp.Text = drbilgi["Smtp"].ToString();
                    txtPort.Text = drbilgi["MailPort"].ToString();
                    txtHarita.Text = drbilgi["Harita"].ToString();
                }
                catch (Exception ex)
                {
                    Msg.Show(ex.Message);
                }

            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_iletisim";
            cmd.Parameters.AddWithValue("@Adres",txtAdres.Text);
            cmd.Parameters.AddWithValue("@Tel1", txtTel1.Text);
            cmd.Parameters.AddWithValue("@Tel2", txtTel2.Text);
            cmd.Parameters.AddWithValue("@Fax", txtFax.Text);
            cmd.Parameters.AddWithValue("@Mail", txtMail.Text);
            if (txtSifre.Text!="")
            {
                cmd.Parameters.AddWithValue("@MailSifre", txtSifre.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MailSifre", MailSifre);
            }

            cmd.Parameters.AddWithValue("@Smtp", txtMailSmtp.Text);
            cmd.Parameters.AddWithValue("@MailPort", txtPort.Text);
            cmd.Parameters.AddWithValue("@Harita", txtHarita.Text);

            try
            {
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Msg.Show(ex.Message);
            }
        
        }
    }
}