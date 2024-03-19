<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
public class Upload : IHttpHandler
{
   
    public void ProcessRequest(HttpContext context)
    {
        baglanti veri = new baglanti();
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        
        try
        {
            HttpPostedFile postedFile = context.Request.Files["Filedata"];
            string id = context.Request["ilanId"];
            string savepath = "";
            string tempPath = "";

            tempPath = context.Request["folder"];

            //If you prefer to use web.config for folder path, uncomment below line:
            //tempPath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"]; 



            savepath = context.Server.MapPath(tempPath);
            string filename = postedFile.FileName;
            if (!Directory.Exists(savepath))
                Directory.CreateDirectory(savepath);
            string ext = System.IO.Path.GetExtension(filename);
            string resimadi = DateTime.Now.Day.ToString() + DateTime.Now.Month +
                DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Second +
                DateTime.Now.Minute + DateTime.Now.Millisecond + ext;


            postedFile.SaveAs(savepath + @"\" + resimadi);

            
            Bitmap resim150 = new Bitmap(context.Server.MapPath("~/Resimler/Temp/" + resimadi));
            resim150 = this.ResimBoyutlandir(resim150, 150);
            // oluşturulan resmi kaydet
            resim150.Save(context.Server.MapPath("~/Resimler/ilan/150/" + resimadi));

            // Orjinal resim
            Bitmap resim800 = new Bitmap(context.Server.MapPath("~/Resimler/Temp/" + resimadi));
            // 800px genişlikte yeni resim oluştur
            resim800 = this.ResimBoyutlandir(resim800, 800);
            // oluşturulan resmi kaydet
            resim800.Save(context.Server.MapPath("~/Resimler/ilan/800/" + resimadi));


            string url = context.Request.Path;
            
            FileInfo anaresimsil = new FileInfo(context.Server.MapPath("~/Resimler/Temp/" + resimadi));
            anaresimsil.Delete();

            try
            {
                SqlConnection baglanti = veri.baglan();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = baglanti;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_ResimEkle";
                cmd.Parameters.AddWithValue("@ResimYolu800", resimadi);
                cmd.Parameters.AddWithValue("@ResimYolu150", resimadi);
                cmd.Parameters.AddWithValue("@ilanId", id);
                cmd.ExecuteNonQuery();

                int resimsayisi = Convert.ToInt32(veri.GetDataCell("Select COUNT(ResimId) from Resimler Where ilanId=" + id + ""));
                veri.cmd("Update ilanlar Set AnaResim150='" + resimadi + "' Where ilanId=" + id + "");
                veri.cmd("Update ilanlar Set AnaResim800='" + resimadi + "' Where ilanId=" + id + "");
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.ToString());
            }
            finally
            {

                context.Response.Write("asd");
                context.Response.StatusCode = 200;
            }
        }
        catch (Exception ex)
        {
            context.Response.Write("Error: " + ex.Message);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public Bitmap ResimBoyutlandir(Bitmap resim, int boyut)
    {
        Bitmap sresim = resim;
      
        using (Bitmap OrjinalResim = resim)
        {
            double yukseklik = OrjinalResim.Height;
            double genislik = OrjinalResim.Width;
            double oran = 0;

            //if (genislik >= boyut) // if bloguna girmemesi resmin boyutunun ne olursa olsun 150 ve 800 e bölümmesi anlamındadır.
            //{
            oran = genislik / yukseklik;
            genislik = boyut;
            yukseklik = genislik / oran;

            Size ydeger = new Size(Convert.ToInt32(genislik), Convert.ToInt32(yukseklik));

            Bitmap yresim = new Bitmap(OrjinalResim, ydeger);

            sresim = yresim;
            //}
            //else
            //{
            //    // eğer resim oranı değiştirilecek ordandan büyük veya küçükse yine klasörlere kaydet
            //    sresim.Save(resimyolu150);
            //    sresim.Save(resimyolu800);
            //    // ve temptekini sil
            //    //FileInfo temp = new FileInfo(Server.MapPath("~/Resimler/Temp/" + resimadi));
            //    //temp.Delete();

              

            //}
        }

        return sresim;
    }
}