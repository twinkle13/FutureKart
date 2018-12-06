using System;
using System.Collections.Generic;

namespace FutureKart.View_Models
{
    public class CategoryProductViewModel
    {
        public Guid ID { get; set; }
        public int ProductsSold { get; set; }
        public string Name { get; set; }
        public IEnumerable<ProductViewModel> Products { get; set; }
    }
}