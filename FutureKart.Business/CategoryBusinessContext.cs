using FutureKart.DataAccess;
using FutureKart.Shared.DTO.Category;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Business
{
    public class CategoryBusinessContext
    {
        public CategoryDatabaseContext categoryDatabaseContext;
        public CategoryBusinessContext()
        {
            categoryDatabaseContext = new CategoryDatabaseContext();
        }

        public CategoriesProductsDTO GetCategories()
        {
            CategoriesProductsDTO categoriesProductsDTO = categoryDatabaseContext.GetCategories();
            return categoriesProductsDTO;
        }

        public CategoryProductsDTO GetCategoryProducts(string categoryName)
        {
            CategoryProductsDTO categoryProductsDTO = categoryDatabaseContext.GetCategoryProducts(categoryName);
            return categoryProductsDTO;
        }
    }
}
