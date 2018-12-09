using AutoMapper;
using FutureKart.Business;
using FutureKart.Shared.DTO.Category;
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
    public class ProductController : Controller
    {
        ProductBusinessContext productBusinessContext;
        IMapper CategoryProductViewModelMapper;
        IMapper ProductViewModelMapper;
        IMapper ProductSearchResultMapper;
        //public ActionResult SearchProduct(string SearchString)
        //{
        //    if(Session["UserID"] != null)
        //    {
        //        ViewBag.IsLoggedIn = "True";
        //    }
        //    if (String.IsNullOrEmpty(SearchString))
        //    {
        //        return View("Search String Empty"); //************* todo *********
        //    }
        //    Pro
        //}
        // GET: Product

        public ProductController()
        {
            productBusinessContext = new ProductBusinessContext();
            var productListDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();
            });
            var productDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();
            });

            CategoryProductViewModelMapper = new Mapper(productListDTOConfig);
            ProductViewModelMapper = new Mapper(productDTOConfig);


        }

        public ActionResult ProductDetail(Guid ProductID)
        {
            ProductViewModel productViewModel = new ProductViewModel();
            ProductDTO productDTO = new ProductDTO();
            try
            {
                productDTO = productBusinessContext.GetProduct(ProductID);
                productViewModel = ProductViewModelMapper.Map<ProductDTO, ProductViewModel>(productDTO);
                //productViewModel.IsLoggedIn = true;
                return View(productViewModel);
            }
            catch(ProductDoesNotExistsException)
            {
                return View("Error");
            }
            catch (Exception ex)
            {
                return View("Internal Error" + ex);
            }
        }
        public ActionResult Index()
        {
            return View();
        }
    }
}