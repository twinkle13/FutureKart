using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    
    public class OrderController : Controller
    {
        OrderBusinessContext orderBusinessContext;
        // GET: Order
        public ActionResult Index()
        {
            return View();
        }
    }
}