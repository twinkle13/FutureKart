using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Analytics;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.DataAccess
{
   public class ProductDatabaseContext
    {
        IMapper AnalyticsMapper;
        FutureKartEntities futureKartEntities;
        public ProductDatabaseContext()
        {
            futureKartEntities = new FutureKartEntities();

            var AnalyticsConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Category, CategoryProductsDTO>().ForMember(dest => dest.Products, opt => opt.MapFrom(src => src.Products));
            });
            AnalyticsMapper = new Mapper(AnalyticsConfig);
        }
        public AnalyticsDTO GetTopProductsByCart()
        {
            List<Category> categories = futureKartEntities.Categories.Include(c => c.Products).OrderByDescending(c => c.ProductsSold).ToList();
            foreach (Category category in categories)
            {
                category.Products = category.Products.ToList();
                IEnumerable<Product> products = category.Products;
                foreach (Product product in products)
                {
                    IEnumerable<Variant> variants = product.Variants;
                    
                }
            }
            AnalyticsDTO analyticsDTO = new AnalyticsDTO
            {
                CategoryProducts = AnalyticsMapper.Map<IEnumerable<Category>, IEnumerable<CategoryProductsDTO>>(categories)
            };
            return analyticsDTO;
        }


    }
}
