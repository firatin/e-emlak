using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CKFinder;
using System.Data.SqlClient;
using System.Data;

namespace WEBEmlak.yonetim
{
    public partial class HaberEkle : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        string HaberId = "", islem = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            Label lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Haber Ekle";

            if (Page.IsPostBack == false)
            {
                FileBrowser f1 = new FileBrowser();
                f1.BasePath = "../ckfinder/";
                f1.SetupCKEditor(CKEditorControl1);
            }
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

            HaberId = Request.QueryString["HaberId"];
            islem = Request.QueryString["islem"];

            if (islem == "duzenle" && HaberId != "")
            {
                btnHaberEkle.Visible = false;
                btnHaberGuncelle.Visible = true;
                DataRow drHaber = veri.GetDataRow("Select * from Haberler Where HaberId=" + HaberId + "");
                if (drHaber != null)
                {
                    if (Page.IsPostBack == false)
                    {
                        txtHaberAdi.Text = drHaber["HaberAdi"].ToString();
                        CKEditorControl1.Text = drHaber["Detay"].ToString();
                    }

                }
            }
        }

        protected void btnHaberEkle_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_HaberEkle";
            cmd.Parameters.AddWithValue("@HaberAdi", Kontrol.Yonlendirme(txtHaberAdi.Text));
            cmd.Parameters.AddWithValue("@Detay", CKEditorControl1.Text);
            cmd.Parameters.AddWithValue("@SayfaMi", "0");

            try
            {
                cmd.ExecuteNonQuery();
                Response.Redirect("Haberler.aspx");
            }
            catch (Exception)
            {

            }
        }

        protected void btnHaberGuncelle_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = veri.baglan();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sp_HaberDuzenle";
            cmd.Parameters.AddWithValue("@HaberAdi", Kontrol.Yonlendirme(txtHaberAdi.Text.Trim()));
            cmd.Parameters.AddWithValue("@Detay", CKEditorControl1.Text);
            cmd.Parameters.AddWithValue("@HaberId", HaberId);

            try
            {
                cmd.ExecuteNonQuery();
                Response.Redirect("Haberler.aspx");
            }
            catch (Exception ex)
            {
                Msg.Show(ex.Message);
            }
        }
    }
}