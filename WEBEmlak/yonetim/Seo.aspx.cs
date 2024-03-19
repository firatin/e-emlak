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
    public partial class Seo : System.Web.UI.Page
    {
        baglanti veri = new baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Seo Ayarları";
            Label lbl = (Label)Master.FindControl("lblBilgi");
            lbl.Text = "Seo Ayarları";

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
                    DataRow drbilgi = veri.GetDataRow("Select * From MetaTag");
                    txtTitle.Text = drbilgi["Title"].ToString();
                    txtDesc.Text = drbilgi["Descript"].ToString();
                    txtKeyword.Text = drbilgi["Keywords"].ToString();
                    txtFace.Text = drbilgi["Facebook"].ToString();
                    txtTwit.Text = drbilgi["Twitter"].ToString();
                    txtFooter.Text = drbilgi["Footer"].ToString();

                    if (drbilgi["SiteLogo"].ToString() != "")
                    {
                        imgResim.ImageUrl = "../Resimler/" + drbilgi["SiteLogo"].ToString();
                    }
                    else
                    {
                        btnSil.Visible = false;
                        imgResim.Visible = false;
                    }
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
            cmd.CommandText = "sp_MetaTag";
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@Descript", txtDesc.Text);
            cmd.Parameters.AddWithValue("@Keywords", txtKeyword.Text);
            cmd.Parameters.AddWithValue("@Facebook", txtFace.Text);
            cmd.Parameters.AddWithValue("@Twitter", txtTwit.Text);
            cmd.Parameters.AddWithValue("@Footer", txtFooter.Text);

            try
            {
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Msg.Show(ex.Message);
            }
        }

        protected void btnYukle_Click(object sender, EventArgs e)
        {
            string resimadi = "";
            string uzanti = "";
            string resimtip = "";
            if (FuResim.HasFile)
            {
                resimtip = FuResim.PostedFile.ContentType;

                if (resimtip == "image/jpeg" || resimtip == "image/jpg" || resimtip == "image/png" || resimtip == "image/bmp")
                {

                    uzanti = Path.GetExtension(FuResim.PostedFile.FileName);

                    resimadi = "sitelogo" + uzanti;

                    FuResim.SaveAs(Server.MapPath("../Resimler/" + resimadi));

                    try
                    {
                        SqlConnection baglanti = veri.baglan();
                        SqlCommand cmd = new SqlCommand("Update MetaTag Set SiteLogo=@SiteLogo", baglanti);
                        cmd.Parameters.AddWithValue("SiteLogo", resimadi.ToString());
                        cmd.ExecuteNonQuery();
                        Response.Redirect("Seo.aspx");
                    }
                    catch (Exception)
                    {


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

        protected void btnSil_Click(object sender, EventArgs e)
        {
            try
            {
                veri.cmd("Update MetaTag Set SiteLogo=''");
                Response.Redirect("Seo.aspx");
            }
            catch (Exception)
            {
             
            }
            
        }
    }
}