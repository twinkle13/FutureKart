using System.Collections.Generic;

namespace FutureKart.View_Models
{
    public class ProductViewModel
    {
        public System.Guid ID { get; set; }
        public IEnumerable<VariantViewModel> Variants { get; set; }
        public CategoryProductViewModel Category { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int OrderLimit { get; set; }
        public int TotalVariantsSold { get; set; }
        public string ProductImageURL { get; set; }
    }
}