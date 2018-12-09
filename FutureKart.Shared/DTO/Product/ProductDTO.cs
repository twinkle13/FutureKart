using FutureKart.Shared.DTO.Category;
using FutureKart.Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Product
{
    public class ProductDTO
    {
        public System.Guid ID { get; set; }
        public IEnumerable<VariantDTO> Variants { get; set; }
        public CategoryProductsDTO Category { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public int OrderLimit { get; set; }
        public int TotalVariantsSold { get; set; }
        public string ProductImageURL { get; set; }
    }
}
