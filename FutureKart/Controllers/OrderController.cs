using AutoMapper;
using FutureKart.Business;
using FutureKart.Shared.DTO.Order;
using FutureKart.Shared.DTO.Variant;
using FutureKart.Shared.Exceptions;
using FutureKart.View_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    
    public class OrderController : Controller
    {
        IMapper OrdersMapper;
        OrderBusinessContext orderBusinessContext;
        public OrderController()
        {
            orderBusinessContext = new OrderBusinessContext();
            var config = new MapperConfiguration(cfg => {
                cfg.CreateMap<OrderDTO, OrderViewModel>(); 
                cfg.CreateMap<OrderProductDTO, OrderProductViewModel>();
                cfg.CreateMap<OrderPlacedVariantDTO, OrderPlacedVariantViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();

            });
            OrdersMapper = new Mapper(config);
        }
        public ActionResult CheckOut(Guid AddressID)
        {
            Guid UserID = new Guid(Session["UserID"].ToString());
            orderBusinessContext.PlaceOrder(UserID, AddressID);
            return View("Success");
        }
        public ActionResult MyOrders()
        {

            OrdersViewModel ordersViewModel = new OrdersViewModel();
            try
            {
                OrdersDTO ordersDTO = orderBusinessContext.GetOrders(new Guid(Session["UserID"].ToString()));
                ordersViewModel.Orders = OrdersMapper.Map<IEnumerable<OrderDTO>, IEnumerable<OrderViewModel>>(ordersDTO.Orders);
            }
            catch (NoOrderException ex)
            {
                return View("NoOrders Placed");
            }
            catch (Exception ex)
            {
                return View("InternalError");
            }
            return View(ordersViewModel);
        }


        // GET: Order
        public ActionResult Index()
        {
            return View();
        }
    }
}