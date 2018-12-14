using AutoMapper;
using FutureKart.Business;
using FutureKart.Shared.DTO.User;
using FutureKart.Shared.Exceptions;
using FutureKart.View_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    public class LoginController : Controller
    {
        UserBusinessContext UserBusinessContextObject;
        IMapper LoginMapper;
        public LoginController()
        {
            UserBusinessContextObject = new UserBusinessContext();
            var mapperConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<LoginViewModel, UserLoginDTO>();
            });
            LoginMapper = new Mapper(mapperConfig);
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login([Bind(Include = "Email, Password")] LoginViewModel loginViewModel)
        {
            if (ModelState.IsValid)
            {
                UserLoginDTO loggedInUserCredentialsDTO = LoginMapper.Map<LoginViewModel, UserLoginDTO>(loginViewModel);
                try
                {
                    UserInfoDTO loggedInUserInfoDTO = UserBusinessContextObject.LoginUser(loggedInUserCredentialsDTO);
                    Session["UserID"] = loggedInUserInfoDTO.ID;
                    return RedirectToAction("Index", "Home");
                }
                catch(InvalidLoginException ex)
                {
                    ModelState.AddModelError("", "Invalid Login Credentials");
                    return View(loginViewModel);
                }
                catch(IncorrectPasswordException ex)
                {
                    ModelState.AddModelError("", "Incorrect password");
                    return View(loginViewModel);
                }
                catch(Exception ex)
                {
                    ModelState.AddModelError("", "Something Went wrong. Please Try again later");
                    return View("Error");
                }
            }
            return View(loginViewModel);
        }

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
    }
}