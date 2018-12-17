using FutureKart.View_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    public class StaticController : Controller
    {
        ExceptionViewModel exceptionViewModel = new ExceptionViewModel();
        /// <summary>
        /// catches all the exceptions
        /// </summary>
        /// <param name="exception"></param>
        /// <returns></returns>
        public ActionResult ExceptionCatch(string exception)
        {
            exceptionViewModel.exceptionDetails = exception;
            return View(exceptionViewModel);
        }
        /// <summary>
        /// bad url request handling
        /// catches all the invalid requsted url (404 NOT FOUND)
        /// </summary>
        /// <returns></returns>
        public ActionResult PageNotFound()
        {
            return View();
        }
    }
}