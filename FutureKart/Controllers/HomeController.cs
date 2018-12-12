using AutoMapper;
using FutureKart.Business;
using FutureKart.Shared.DTO.Analytics;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;
using FutureKart.View_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FutureKart.Controllers
{
    public class HomeController : Controller
    {
        IMapper AnalyticsMapper;
        public HomeController()
        {
            var AnalyticsConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<AnalyticsDTO, AnalyticsViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();


            });
            AnalyticsMapper = new Mapper(AnalyticsConfig);
        }
        public ActionResult Index()
        {
            try
            {
                IEnumerable<CategoryDTO> categoryDTOs;

                AnalyticsDTO analyticsDTO = new AnalyticsDTO();
                ProductBusinessContext productBusinessContext = new ProductBusinessContext();
                AnalyticsViewModel analyticsViewModel = new AnalyticsViewModel();
                try
                {
                    analyticsDTO = productBusinessContext.GetTopProductsByCart();
                    analyticsViewModel = AnalyticsMapper.Map<AnalyticsDTO, AnalyticsViewModel>(analyticsDTO);
                    return View(analyticsViewModel);
                }
                catch (Exception e)
                {
                    return View("Internal Error");
                }
            }catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
            
        }
    }
}