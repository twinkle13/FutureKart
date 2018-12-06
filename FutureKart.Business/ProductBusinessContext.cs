using FutureKart.DataAccess;
using FutureKart.Shared.DTO.Analytics;
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
            AnalyticsDTO analyticsDTO = productDatabaseContext.GetTopProductsByCart();
            foreach (var category in analyticsDTO.CategoryProducts)
            {
                category.Products = category.Products.Take(4);
            }
            return analyticsDTO;
        }
    }
}
