using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Analytics;
using FutureKart.Shared.DTO.Cart;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;
using FutureKart.Shared.Exceptions;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.DataAccess
{
   public class ProductDatabaseContext
    {
        IMapper AnalyticsMapper;
        IMapper ProductInfoMapper;
        IMapper ProductSearchMapper;
        FutureKartEntities futureKartEntities;
        public ProductDatabaseContext()
        {
            futureKartEntities = new FutureKartEntities();

            var AnalyticsConfig = new MapperConfiguration(cfg => {

                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Category, CategoryProductsDTO>().ForMember(dest => dest.Products, opt => opt.MapFrom(src => src.Products));
                cfg.CreateMap<VariantImage, VariantImageDTO>();
            });
            var productDTOConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Category, CategoryProductsDTO>();
                cfg.CreateMap<VariantImage, VariantImageDTO>();
            });
            var searchMapperConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Product, ProductDTO>();
                cfg.CreateMap<Variant, VariantDTO>();
                cfg.CreateMap<Category, CategoryProductsDTO>();
                cfg.CreateMap<VariantImage, VariantImageDTO>();

            });
            AnalyticsMapper = new Mapper(AnalyticsConfig);
            ProductInfoMapper = new Mapper(productDTOConfig);
            ProductSearchMapper = new Mapper(searchMapperConfig);
        }
        public AnalyticsDTO GetTopProductsByCart()
        {
            List<Category> categories = futureKartEntities.Categories.Include(c => c.Products).OrderByDescending(c => c.ProductsSold).ToList();
            Debug.WriteLine(futureKartEntities.Categories.Include(c => c.Products).OrderByDescending(c => c.ProductsSold).ToList());
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

        public CategoryProductsDTO GetCategoryProducts(string categoryName)
        {
            Category category = futureKartEntities.Categories.Include(c => c.Products).Where(c => c.Name == categoryName).FirstOrDefault();
            Debug.WriteLine(futureKartEntities.Categories.Include(c => c.Products).Where(c => c.Name == categoryName).FirstOrDefault());
            CategoryProductsDTO categoryProductsDTO = new CategoryProductsDTO();
            categoryProductsDTO = ProductInfoMapper.Map<Category, CategoryProductsDTO>(category);
            return categoryProductsDTO;

        }

        public VariantDTO GetVariant(Guid variantID)
        {
            Variant variant = futureKartEntities.Variants.Where(v => v.ID == variantID).FirstOrDefault();
            Debug.WriteLine(futureKartEntities.Variants.Where(v => v.ID == variantID).FirstOrDefault());
            VariantDTO variantDTO = ProductInfoMapper.Map<Variant, VariantDTO>(variant);
            variantDTO.VariantString = SetVariantStringFromSKU(variantDTO.SKU);
            return variantDTO;
        }

        public bool CategoryExists(string categoryName)
        {
            Category category = futureKartEntities.Categories.Where(c => c.Name == categoryName).FirstOrDefault();
            Debug.WriteLine(futureKartEntities.Categories.Where(c => c.Name == categoryName).FirstOrDefault());
            if(category == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public ProductsSearchedResultDTO SearchProductsWithString(string searchString)
        {
            IEnumerable<Product> searchResults = futureKartEntities.Products.Where(p => p.Description.Contains(searchString) || p.Title.Contains(searchString)).Include(p => p.Category);
            Debug.WriteLine(futureKartEntities.Products.Where(p => p.Description.Contains(searchString) || p.Title.Contains(searchString)).Include(p => p.Category));
            ProductsSearchedResultDTO newProductsSearchResultDTO = new ProductsSearchedResultDTO();
            newProductsSearchResultDTO.Products = ProductSearchMapper.Map<IEnumerable<Product>, IEnumerable<ProductDTO>>(searchResults);
            return newProductsSearchResultDTO;
        }

        public void UpdateInventory(CartItemsDTO cartItemsDTO)
        {
            foreach (CartProductsDTO cartItem in cartItemsDTO.CartItems) {
                futureKartEntities.Variants.FirstOrDefault(v => v.ID == cartItem.Variant.ID).Inventory -= cartItem.Quantity;
                Debug.WriteLine(futureKartEntities.Variants.FirstOrDefault(v => v.ID == cartItem.Variant.ID).Inventory);
                futureKartEntities.Variants.FirstOrDefault(v => v.ID == cartItem.Variant.ID).QuantitySold += cartItem.Quantity;
                Debug.WriteLine(futureKartEntities.Variants.FirstOrDefault(v => v.ID == cartItem.Variant.ID).QuantitySold);
                futureKartEntities.Categories.FirstOrDefault(c => c.ID == cartItem.Variant.Product.Category.ID).ProductsSold += cartItem.Quantity;
                Debug.WriteLine(futureKartEntities.Categories.FirstOrDefault(c => c.ID == cartItem.Variant.Product.Category.ID).ProductsSold);
                futureKartEntities.SaveChanges();
            }
            return;
        }

        public ProductDTO GetProduct(Guid productID)
        {
            Product product = futureKartEntities.Products.Where(p => p.ID == productID).Include(p => p.Variants).FirstOrDefault();
            Debug.WriteLine(futureKartEntities.Products.Where(p => p.ID == productID).Include(p => p.Variants).FirstOrDefault());
            ProductDTO productDTO = new ProductDTO();
            productDTO = ProductInfoMapper.Map<Product, ProductDTO>(product);
            productDTO.Variants = ProductInfoMapper.Map<IEnumerable<Variant>, IEnumerable<VariantDTO>>(product.Variants);
            foreach(VariantDTO variant in productDTO.Variants)
            {
                variant.VariantString = SetVariantStringFromSKU(variant.SKU);
            }
            return productDTO;
        }

        private string SetVariantStringFromSKU(string sKU)
        {
            string variantString = "";
            string[] propertyValueMappingID = sKU.Split('~');
            foreach (string mapper in propertyValueMappingID) {
                int mapperID = int.Parse(mapper);
                Guid propertyID = futureKartEntities.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.PropertyID).FirstOrDefault();
                Debug.WriteLine(futureKartEntities.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.PropertyID).FirstOrDefault());
                Guid valueID = futureKartEntities.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.ValueID).FirstOrDefault();
                Debug.WriteLine(futureKartEntities.VariantPropertyValues.Where(m => m.ID == mapperID).Select(m => m.ValueID).FirstOrDefault());
                string property = futureKartEntities.Properties.Where(p => p.ID == propertyID).Select(p => p.Name).FirstOrDefault();
                string value = futureKartEntities.Values.Where(v => v.ID == valueID).Select(v => v.Name).FirstOrDefault();
                variantString = variantString + " " + property + ":" + value;
            }
            return variantString;
        }

        public bool ProductExists(Guid productID)
        {
            Product product = futureKartEntities.Products.Find(productID);
            Debug.WriteLine(futureKartEntities.Products.Find(productID));
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
            Debug.WriteLine(futureKartEntities.VariantImages.Where(a => a.VariantID == product.Variants.First().ID).Select(i => i.ImageURL).FirstOrDefault());
            return url;
        }


    }
}
