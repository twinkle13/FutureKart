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
    public class CategoryController : Controller
    {
        IMapper CategoryMapper;
        CategoryBusinessContext categoryBusinessContext;
        public CategoryController()
        {
            categoryBusinessContext = new CategoryBusinessContext();
            var config = new MapperConfiguration(cfg =>
                {
                    cfg.CreateMap<CategoryProductsDTO, CategoryProductViewModel>();
                    cfg.CreateMap<ProductDTO, ProductViewModel>();
                    cfg.CreateMap<VariantDTO, VariantViewModel>();
                    cfg.CreateMap<VariantImageDTO, VariantImageViewModel>();
                });
            CategoryMapper = new Mapper(config);
        }
        public PartialViewResult GetCategories()
        {
          CategoriesProductViewModel categoriesViewModel = new CategoriesProductViewModel();
          CategoriesProductsDTO categoryDTOs = categoryBusinessContext.GetCategories();        
            categoriesViewModel.categories = categoryDTOs.categories;
            return PartialView(categoriesViewModel);
        }
        public ActionResult GetCategoryProducts(string CategoryName)
        {
            try
            {
                CategoryProductsDTO categoryProductsDTO = categoryBusinessContext.GetCategoryProducts(CategoryName);
                CategoryProductViewModel categoryViewModel;
                categoryViewModel = CategoryMapper.Map<CategoryProductsDTO, CategoryProductViewModel>(categoryProductsDTO);
                return View(categoryViewModel);
            }
            catch(CategoryDoesNotExistsException ex)
            {
                return RedirectToAction("ExceptionCatch", "Static", new { exception = ex });
            }
            

        }
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }
    }
}