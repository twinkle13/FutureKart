using AutoMapper;
using FutureKart.Business;
using FutureKart.Filter;
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
       

        public ProductController()
        {
            productBusinessContext = new ProductBusinessContext();
            var productListDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
            });
            var productDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
            });
            var searchConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<ProductsSearchedResultDTO, ProductsSearchedResultViewModel>();
                cfg.CreateMap<ProductDTO, ProductViewModel>();
                cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();
                cfg.CreateMap<VariantDTO, VariantViewModel>();
                cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
            });

            CategoryProductViewModelMapper = new Mapper(productListDTOConfig);
            ProductViewModelMapper = new Mapper(productDTOConfig);
            ProductSearchResultMapper = new Mapper(searchConfig);


        }
        public ActionResult SearchProducts(string SearchString)
        {
            if (Session["UserID"] != null)
            {
                ViewBag.IsLoggedIn = "True";
            }

            if (String.IsNullOrEmpty(SearchString))
            {
                return View("Error");
            }

            ProductsSearchedResultDTO newProductsSearchResultDTO = new ProductsSearchedResultDTO();
            ProductsSearchedResultViewModel viewModel = new ProductsSearchedResultViewModel();
            try
            {
                newProductsSearchResultDTO = productBusinessContext.SearchProductsWithString(SearchString);
                viewModel = ProductSearchResultMapper.Map<ProductsSearchedResultDTO, ProductsSearchedResultViewModel>(newProductsSearchResultDTO);
                ViewBag.SearchString = SearchString;
                return View(viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }
        [UserAuthFilter]
        public ActionResult ProductDetail(Guid ProductID)
        {
            ProductViewModel productViewModel = new ProductViewModel();
            ProductDTO productDTO = new ProductDTO();
            try
            {
                productDTO = productBusinessContext.GetProduct(ProductID);
                productViewModel = ProductViewModelMapper.Map<ProductDTO, ProductViewModel>(productDTO);
                productViewModel.variantDisplay = ProductViewModelMapper.Map<VariantDTO, VariantViewModel>(productDTO.Variants.FirstOrDefault());
                return RedirectToAction("ShowVariant", new { variantID = productViewModel.variantDisplay.ID });
                //productViewModel.IsLoggedIn = true;
                //return View(productViewModel);
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
        
        public ActionResult ShowVariant(Guid variantID)
        {
            try
            {
                ModelState.Clear();
                VariantDTO variantDTO = productBusinessContext.GetVariant(variantID);
                ProductDTO productDTO = productBusinessContext.GetProduct(variantDTO.Product.ID);
                VariantViewModel variantViewModel = ProductViewModelMapper.Map<VariantDTO, VariantViewModel>(variantDTO);
                ProductViewModel productViewModel = ProductViewModelMapper.Map<ProductDTO, ProductViewModel>(productDTO);
                productViewModel.variantDisplay = variantViewModel;
                return View(productViewModel);
            }catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }
        [HttpPost]
        public ActionResult UpdateVariant(string variantID)
        {
            try
            {
                ModelState.Clear();
                Guid VariantID = new Guid(variantID);
                VariantDTO variantDTO = productBusinessContext.GetVariant(VariantID);
                ProductDTO productDTO = productBusinessContext.GetProduct(variantDTO.Product.ID);
                return RedirectToAction("ShowVariant", new { variantID = variantDTO.ID });
            }catch(Exception ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
        }
    }
}