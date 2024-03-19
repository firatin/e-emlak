using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace WEBEmlak.yonetim
{
    public partial class Danismanlar : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        Label lbl1;
        string islem = "", DanismanId = "";
        string resimadi = "", uzanti = "", resimtip = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl1 = (Label)Master.FindControl("lblBilgi");
            lbl1.Text = "Danışman Yönetimi";
            Page.Title = "Danışman Yönetimi";

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

            try
            {
                islem = Request.QueryString["islem"];
                DanismanId = Kontrol.SayiKontrol(Request.QueryString["DId"]);

            }
            catch (Exception)
            {
                Response.Redirect("Danismanlar.aspx");
            }


            if (islem == "duzenle" && DanismanId != null)
            {
                if (Page.IsPostBack == false)
                {

                    DataRow DrBilgi = veri.GetDataRow("Select * From Danisman Where DanismanId=" + DanismanId + "");

                    btnEkle.Visible = false;
                    btnDuzenle.Visible = true;
                    btnGeri.Visible = true;
                    FuResim.Visible = false;
                    if (DrBilgi != null)
                    {

                        txtBaslik.Text = DrBilgi["AdSoyad"].ToString().Trim();
                        txtMail.Text = DrBilgi["Mail"].ToString().Trim();
                        txtTel.Text = DrBilgi["Tel"].ToString().Trim();
                        txtGsm.Text = DrBilgi["Gsm"].ToString().Trim();
                        txtAdres.Text = DrBilgi["Adres"].ToString().Trim();

                        if (DrBilgi["ResimYolu"].ToString() == "" || DrBilgi["ResimYolu"].ToString() == "resimyok.jpg")
                        {
                            FuResim.Visible = true;
                            btnResim.Visible = true;
                            
                        }
                        else
                        {
                            imgResim.ImageUrl = "../Resimler/Danisman/" + DrBilgi["ResimYolu"].ToString();
                            imgResim.Visible = true;
                            btnResmiSil.Visible = true;
                        }


                        if (DrBilgi["Aktif"].ToString() == "1")
                        {
                            cbAktif.Checked = true;
                        }
                        else
                        {
                            cbAktif.Checked = false;
                        }
                    }
                }

            }
            else if (islem == "sil")
            {
                try
                {
                    string resimadi = veri.GetDataCell("Select ResimYolu From Danisman Where DanismanId=" + DanismanId + "");
                    if (resimadi.ToString() == "" || resimadi.ToString() == "resimyok.jpg")
                    {
                    }
                    else
                    {

                        FileInfo fi150sil = new FileInfo(Server.MapPath("/Resimler/Danisman/") + resimadi.ToString());
                        fi150sil.Delete();
                    }


                    veri.cmd("Delete From Danisman Where DanismanId=" + DanismanId + "");

                    Response.Redirect("Danismanlar.aspx");
                }
                catch (Exception)
                {

                }

            }

            try
            {
                DanismanGetir();
            }
            catch (Exception)
            {
            }
        }
        void DanismanGetir()
        {
            DataTable DtKayitlar = veri.GetDataTable("Select *, Case Aktif when 1 then 'Aktif' when 0 then 'Pasif' when 2 then 'Onay Bekliyor' end as Durumadi from Danisman Order By DanismanId Desc ");
            CollectionPager1.DataSource = DtKayitlar.DefaultView;
            CollectionPager1.BindToControl = RpKayit;
            RpKayit.DataSource = CollectionPager1.DataSourcePaged;
            RpKayit.DataBind();

        }

        protected void btnEkle_Click(object sender, EventArgs e)
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


                    FuResim.SaveAs(Server.MapPath("../Resimler/Danisman/" + resimadi));

                    DanismanEkle();


                }
                else
                {
                    Msg.Show("Resmin uzantısı sadece, JPG,PNG ve BMP olmalıdır.");
                }

            }
            else
            {
                resimadi = "resimyok.jpg";
                DanismanEkle();
            }
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("Danismanlar.aspx");
        }

        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            try
            {

                int aktif = 0;
                if (cbAktif.Checked)
                {
                    aktif = 1;
                }

                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = baglanti;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_DanismanDuzenle";
                cmd.Parameters.AddWithValue("@AdSoyad", txtBaslik.Text.Trim());
                cmd.Parameters.AddWithValue("@Mail", txtMail.Text);
                cmd.Parameters.AddWithValue("@Tel", txtTel.Text);
                cmd.Parameters.AddWithValue("@Gsm", txtGsm.Text);
                cmd.Parameters.AddWithValue("@Aktif", aktif);
                cmd.Parameters.AddWithValue("@Adres", txtAdres.Text);
                cmd.Parameters.AddWithValue("@DanismanId", DanismanId);

                cmd.ExecuteNonQuery();
                Response.Redirect("Danismanlar.aspx");
            }
            catch (Exception ex)
            {
                Msg.Show(ex.Message);

            }
        }

        void DanismanEkle()
        {
            try
            {
                int aktif = 0;
                if (cbAktif.Checked)
                {
                    aktif = 1;
                }

                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = baglanti;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_DanismanEkle";
                cmd.Parameters.AddWithValue("@AdSoyad", txtBaslik.Text.Trim());
                cmd.Parameters.AddWithValue("@Mail", txtMail.Text);
                cmd.Parameters.AddWithValue("@ResimYolu", resimadi);
                cmd.Parameters.AddWithValue("@Tel", txtTel.Text);
                cmd.Parameters.AddWithValue("@Gsm", txtGsm.Text);
                cmd.Parameters.AddWithValue("@Adres", txtAdres.Text);
                cmd.Parameters.AddWithValue("@Aktif", aktif); // 0 pasif 1 aktif 2 danışman onay beklemede onay bekleme site kısmında danışmanlık başvurusu yaparken kullandım.

                cmd.ExecuteNonQuery();
                Response.Redirect("Danismanlar.aspx");
            }
            catch (Exception ex)
            {
                Msg.Show(ex.Message);

            }
        }

        protected void btnResmiSil_Click(object sender, EventArgs e)
        {
            try
            {
                string resimadi = veri.GetDataCell("Select ResimYolu From Danisman Where DanismanId=" + DanismanId + "");
                FileInfo fi150sil = new FileInfo(Server.MapPath("../Resimler/Danisman/") + resimadi.ToString());
                fi150sil.Delete();
                veri.cmd("Update Danisman Set ResimYolu ='resimyok.jpg' Where DanismanId=" + DanismanId + "");

                Response.Redirect("Danismanlar.aspx?DId=" + DanismanId + "&islem=duzenle");
            }
            catch (Exception)
            {

            }

        }

        protected void btnResim_Click(object sender, EventArgs e)
        {
            string resimadi = "";
            string uzanti = "";
            string resimtip = "";
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


                    FuResim.SaveAs(Server.MapPath("../Resimler/Danisman/" + resimadi));

                    try
                    {
                        SqlConnection baglanti = veri.baglan();
                        SqlCommand cmd = new SqlCommand("Update Danisman Set ResimYolu=@ResimYolu Where DanismanId=" + DanismanId + "", baglanti);
                        cmd.Parameters.AddWithValue("@ResimYolu", resimadi);
                        cmd.Parameters.AddWithValue("@DanismanId", DanismanId);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("Danismanlar.aspx");
                    }
                    catch (Exception ex)
                    {
                        Msg.Show(ex.Message);

                    }

                }
                else
                {
                    Msg.Show("Resmin uzantısı sadece, JPG,PNG ve BMP olmalıdır.");
                }

            }
            else
            {
                Msg.Show("Resim Seçmediniz");
            }
        }
    }
}