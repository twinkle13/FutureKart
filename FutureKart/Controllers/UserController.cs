using FutureKart.Business;
using FutureKart.Shared.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    public class UserController : Controller
    {
        UserBusinessContext userBusinessContext;
        public UserController()
        {
            userBusinessContext = new UserBusinessContext();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult CheckAdmin()
        {
            try
            {
                if(Session["UserID"].ToString() == null){
                    throw new NotLoggedInException();
                }
                
                if (userBusinessContext.CheckAdmin(new Guid(Session["UserID"].ToString())))
                {
                    return View("Admin");
                }
                else
                {
                    return View("NotAdmin");
                }
            }
            catch(NotLoggedInException ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
            catch (Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }

        // GET: User
        public ActionResult Index()
        {
            return View();
        }
    }
}