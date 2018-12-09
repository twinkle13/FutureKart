using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Analytics;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;
using FutureKart.Shared.Exceptions;
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
        IMapper ProductInfoMapper;
        FutureKartEntities futureKartEntities;
        public ProductDatabaseContext()
        {
            futureKartEntities = new FutureKartEntities();

            var AnalyticsConfig = new MapperConfiguration(cfg => {

                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Category, CategoryProductsDTO>().ForMember(dest => dest.Products, opt => opt.MapFrom(src => src.Products));
            });
            var productDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
            });
            AnalyticsMapper = new Mapper(AnalyticsConfig);
            ProductInfoMapper = new Mapper(productDTOConfig);
        }
        public AnalyticsDTO GetTopProductsByCart()
        {
            List<Category> categories = futureKartEntities.Categories.Include(c => c.Products).OrderByDescending(c => c.ProductsSold).ToList();
            foreach (Category category in categories)
            {
                category.Products = category.Products.OrderByDescending(p => p.TotalVariantsSold).ToList();
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

        public ProductDTO GetProduct(Guid productID)
        {
            Product product = futureKartEntities.Products.Where(p => p.ID == productID).Include(p => p.Variants).FirstOrDefault();
            ProductDTO productDTO = new ProductDTO();
            productDTO = ProductInfoMapper.Map<Product, ProductDTO>(product);
            productDTO.Variants = ProductInfoMapper.Map<IEnumerable<Variant>, IEnumerable<VariantDTO>>(product.Variants);
            return productDTO;
        }

        public bool ProductExists(Guid productID)
        {
            Product product = futureKartEntities.Products.Find(productID);
            if(product == null)
            {
                return false;
            }
            else
            {
                return true;
            }
            
        }

        public string GetProductImage(ProductDTO product)
        {
            string url = futureKartEntities.VariantImages.Where(a => a.VariantID == product.Variants.First().ID).Select(i => i.ImageURL).FirstOrDefault();
            return url;
        }


    }
}
