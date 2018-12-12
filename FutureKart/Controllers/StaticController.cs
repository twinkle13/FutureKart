using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    public class StaticController : Controller
    {
        public ActionResult ExceptionCatch()
        {
            return View();
        }
        public ActionResult PageNotFound()
        {
            return View();
        }
    }
}