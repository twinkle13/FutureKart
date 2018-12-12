using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;

namespace FutureKart.DataAccess
{
    public class CategoryDatabaseContext
    {
        FutureKartEntities futureKartContext;
        IMapper CategoryMapper;
        public CategoryDatabaseContext()
        {
            futureKartContext = new FutureKartEntities();
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Category, CategoryProductsDTO>();
                cfg.CreateMap<VariantImage, VariantImageDTO>();
            });
            CategoryMapper = new Mapper(config);
        }

        public CategoriesProductsDTO GetCategories()
        {
            CategoriesProductsDTO categoriesDTO = new CategoriesProductsDTO();
            IEnumerable<string> categories = futureKartContext.Categories.ToList().Select(p => p.Name);
            Debug.WriteLine(futureKartContext.Categories.ToList().Select(p => p.Name));
            categoriesDTO.categories = categories;
            return categoriesDTO;
        }

        public CategoryProductsDTO GetCategoryProducts(string categoryName)
        {
            Category category = futureKartContext.Categories.Where(c => c.Name == categoryName).FirstOrDefault();
            Debug.WriteLine(futureKartContext.Categories.Where(c => c.Name == categoryName).FirstOrDefault());
            CategoryProductsDTO categoryDTO = CategoryMapper.Map<Category, CategoryProductsDTO>(category);
            return categoryDTO;
        }
    }
}
