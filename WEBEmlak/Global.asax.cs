using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WEBEmlak
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteSet(RouteTable.Routes);
        }
        void RouteSet(RouteCollection routes)
        {
            //routes.MapPageRoute("arama", "{aranacakdeger}-{ara}.aspx", "~/Arama.aspx");
            routes.MapPageRoute("ilandetay", "{ilanId}-{ilanAdi}.html", "~/ilandetay.aspx");
            routes.MapPageRoute("danisman", "danisman-{DanismanId}-{AdSoyad}", "~/DanismanDetay.aspx");
            routes.MapPageRoute("sayfadetay", "{SayfaAdi}-{SayfaId}", "~/SayfaDetay.aspx");

            //routes.MapPageRoute("xml", "xml", "~/Sitemap.aspx");

        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}