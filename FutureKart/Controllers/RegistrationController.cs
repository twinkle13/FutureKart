using AutoMapper;
using FutureKart.Business;
using FutureKart.Shared.DTO.Role;
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
    public class RegistrationController : Controller
    {
        UserBusinessContext userBusinessContext;
        IMapper RegistrationViewModelMapper;
        IMapper RegisterationRoleMapper;
        public RolesDTO roleList;
        public RegistrationController()
        {
            userBusinessContext = new UserBusinessContext();
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<RegistrationViewModel, UserRegisterDTO>();
            });
            var configRoles = new MapperConfiguration(cfg => {
                cfg.CreateMap<RolesDTO, RegistrationViewModel>();

            });
            RegistrationViewModelMapper = new Mapper(config);
            RegisterationRoleMapper = new Mapper(configRoles);
            roleList = userBusinessContext.GetRoles();

        }

        public ActionResult Register()
        {
            try
            {
                RegistrationViewModel registrationViewModel;
                registrationViewModel = RegisterationRoleMapper.Map<RolesDTO, RegistrationViewModel>(roleList);
                return View(registrationViewModel);
            }catch(EmailAlreadyExistsException ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
            catch(NoRolesFoundException ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
            catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }
        [HttpPost]
        public ActionResult Register([Bind(Include = "Name,Password,ConfirmedPassword,Email,PhoneNumber,RoleName,Roles")] RegistrationViewModel registrationViewModel)
        {
            registrationViewModel.Roles = roleList.Roles;
            try
            {
                //registrationViewModel = RegisterationRoleMapper.Map<RolesDTO, RegistrationViewModel>(roleList);
                ModelState.Remove("Roles");
                if (ModelState.IsValid)
                {
                    UserRegisterDTO userRegisterDTO = RegistrationViewModelMapper.Map<RegistrationViewModel, UserRegisterDTO>(registrationViewModel);
                    
                    UserInfoDTO newUserInfoDTO = userBusinessContext.RegisterUser(userRegisterDTO);
                    return View("Success");
                }
                else
                {
                    return View(registrationViewModel);
                }
            }
            catch(EmailAlreadyExistsException ex)
            {
                ModelState.AddModelError("Email", "Email id already Registered");
                return View(registrationViewModel);
            }
            catch(Exception exception)
            {
                ModelState.AddModelError("", "Something went wrong.Please try after some time");
            }
            return View("Error");
        }


        // GET: Registration
        public ActionResult Index()
        {
            return View();
        }
    }
}