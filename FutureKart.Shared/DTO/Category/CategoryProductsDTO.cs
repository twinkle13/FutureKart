using FutureKart.Shared.DTO.Product;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Category
{
    public class CategoryProductsDTO
    {
        public IEnumerable<ProductDTO> Products { get; set; }
        public string Name { get; set; }
        public int ProductsSold { get; set; }
    }
}
