using FutureKart.DataAccess;
using FutureKart.Shared.DTO.Analytics;
using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;
using FutureKart.Shared.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Business
{
    public class ProductBusinessContext
    {
        ProductDatabaseContext productDatabaseContext = new ProductDatabaseContext();

        public AnalyticsDTO GetTopProductsByCart()
        {
            int CategoryCounter = 0;
            AnalyticsDTO analyticsDTO = productDatabaseContext.GetTopProductsByCart();
            foreach (var category in analyticsDTO.CategoryProducts)
            {
                if (CategoryCounter < 3)
                { 
                category.Products = category.Products.Take(3);
                }
                else
                {
                    category.Products = category.Products.Take(5);
                }

                CategoryCounter++;

            }
            return analyticsDTO;
        }

        private void setProductImage(IEnumerable<ProductDTO> products)
        {
            foreach(ProductDTO product in products)
            {
                product.ProductImageURL = productDatabaseContext.GetProductImage(product);
                
            }
        }

        public ProductsSearchedResultDTO SearchProductsWithString(string searchString)
        {
            ProductsSearchedResultDTO newProductsSearchResultDTO = new ProductsSearchedResultDTO();

            try
            {
                newProductsSearchResultDTO = productDatabaseContext.SearchProductsWithString(searchString);
                return newProductsSearchResultDTO;
            }
            catch (Exception ex)
            {
                throw new Exception("Unknown Error");
            }
        }

        public ProductDTO GetProduct(Guid productID)
        {
            bool exists = productDatabaseContext.ProductExists(productID);
            if (exists == false)
            {
                throw new ProductDoesNotExistsException();
            }
            ProductDTO productDTO = productDatabaseContext.GetProduct(productID);
            return productDTO;

        }

        public CategoryProductsDTO GetCategoryProducts(string CategoryName)
        {
            
            bool exists = productDatabaseContext.CategoryExists(CategoryName);                 
            if (!exists)
            {
                throw new CategoryDoesNotExistsException();
            }
            CategoryProductsDTO newCategoryProductsDTO = productDatabaseContext.GetCategoryProducts(CategoryName);
            return newCategoryProductsDTO;
        }

        public VariantDTO GetVariant(Guid variantID)
        {
            VariantDTO variantDTO = productDatabaseContext.GetVariant(variantID);
            return variantDTO;
        }
    }
}
