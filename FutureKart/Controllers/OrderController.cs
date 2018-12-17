using AutoMapper;
using FutureKart.Business;
using FutureKart.Filter;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Order;
using FutureKart.Shared.DTO.Product;
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
    [UserAuthFilter]
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
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();

            });
            OrdersMapper = new Mapper(config);
        }
        /// <summary>
        /// places the order for current user and on given address
        /// </summary>
        /// <param name="AddressID"></param>
        /// <returns></returns>
        public ActionResult CheckOut(Guid AddressID)
        {
            Guid UserID = new Guid(Session["UserID"].ToString());
            try
            {
                orderBusinessContext.PlaceOrder(UserID, AddressID);
                return View("Success");
            }
            catch (NoOrderException ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex.Message });
            }
            catch(CartEmptyException ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex.Message });
            }
            catch (Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex.Message });
            }
            
        }
        /// <summary>
        /// gives all the addresses
        /// </summary>
        /// <returns></returns>
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
                return View("NoOrders");
            }
            catch (Exception ex)
            {
                return View("InternalError");
            }
            return View(ordersViewModel);
        }
        /// <summary>
        /// get info of particular order
        /// </summary>
        /// <param name="OrderID"></param>
        /// <returns></returns>
        public ActionResult GetOrder(Guid OrderID)
        {
            try
            {
                OrderDTO orderDTO = orderBusinessContext.GetOrder(OrderID);
                OrderViewModel orderViewModel = OrdersMapper.Map<OrderDTO, OrderViewModel>(orderDTO);
                return View(orderViewModel);
            }catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex.Message });
            }
        }


        // GET: Order
        public ActionResult Index()
        {
            return View();
        }
    }
}