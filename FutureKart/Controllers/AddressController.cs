using AutoMapper;
using FutureKart.Business;
using FutureKart.Filter;
using FutureKart.Shared.DTO.Address;
using FutureKart.Shared.Exceptions;
using FutureKart.View_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    /// <summary>
    /// ONLY FOR LOGGED IN USERS
    /// </summary>
    [UserAuthFilter]
    public class AddressController : Controller
    {
        AddressBusinessContext addressBusinessContext;
        IMapper AddressMapper;
        IMapper AddressViewMapper;

        public AddressController()
        {
            addressBusinessContext = new AddressBusinessContext();
            var config =  new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<AddressDTO, AddressViewModel>();
            });
            var configView = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<AddressViewModel, AddressDTO>();
            });
            AddressMapper = new Mapper(config);
            AddressViewMapper = new Mapper(configView);
        }
        /// <summary>
        /// list of previous addresses of the user. If empty redirect to new address form page
        /// </summary>
        /// <returns>ActionResult-->  list of addresses</returns>
        public ActionResult SelectAddress()
        {
            try
            {
                Guid UserID = new Guid(Session["UserID"].ToString());
                IEnumerable<AddressDTO> addressDTOs = addressBusinessContext.getUserAddresses(UserID);
                SelectAddressViewModel selectAddressViewModel = new SelectAddressViewModel();

                selectAddressViewModel.Addresses = AddressMapper.Map<IEnumerable<AddressDTO>, IEnumerable<AddressViewModel>>(addressDTOs);
                if (selectAddressViewModel.Addresses.ToList().Count == 0)
                {
                    return View(selectAddressViewModel); ;
                }
                else
                {
                    return View(selectAddressViewModel);
                }
            }
            catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex.Message });
            }
            
        }
        /// <summary>
        /// selects address from addresses
        /// </summary>
        /// <param name="selectAddressViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SelectAddress([Bind(Include = ("AddressID"))] SelectAddressViewModel selectAddressViewModel)
        {
            try
            {
                Guid UserID = new Guid(Session["UserID"].ToString());
                Guid AddressID = new Guid(selectAddressViewModel.AddressID);
                return RedirectToAction("CheckOut", "Order", new { AddressID = AddressID });
            }catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex.Message });
            }

        }

        public ActionResult AddAddress()
        {
            return View();

        }
        /// <summary>
        /// form for new address input
        /// </summary>
        /// <param name="addressViewModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AddAddress([Bind(Include = ("AddressLine1, AddressLine2, PIN, City,State, Country"))] AddressViewModel addressViewModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Guid UserID = new Guid(Session["UserID"].ToString());
                    AddressDTO address = AddressViewMapper.Map<AddressViewModel, AddressDTO>(addressViewModel);
                    try
                    {
                        Guid AddressId = addressBusinessContext.AddAddress(UserID, address);
                        return RedirectToAction("CheckOut", "Order", new { AddressID = AddressId });
                    }
                    catch (AddAddressException addressException)
                    {
                        return RedirectToAction("ExceptionCatch", "Static", new { exception = addressException.Message });
                    }

                }
                else
                {
                    return View(addressViewModel);
                }
            }
            catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex.Message });
            }
        }


    }
}