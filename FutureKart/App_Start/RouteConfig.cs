using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FutureKart
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "Registeration",
                url: "Register",
                defaults: new { controller = "Registration", action = "Register" }
                );
            routes.MapRoute(
                name: "ProductDetail",
                url: "Product/ProductDetail/{ProductID}",
                defaults: new { controller = "Product", action = "ProductDetail" }
                );
            routes.MapRoute(
                name: "Login",
                url: "Login",
                defaults: new { controller = "Login", action = "Login" }
                );

            routes.MapRoute(
              name: "Admin",
              url: "admin",
              defaults: new { controller = "User", action = "CheckAdmin" }
          );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "CatchAll",
                url: "{*any}",
                defaults: new { controller = "Login", action = "PageNotFound" });
        }
    }
}
