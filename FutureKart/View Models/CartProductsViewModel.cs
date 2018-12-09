using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class CartProductsViewModel
    {
        public string Name { get; set; }
        public VariantViewModel Variant { get; set; }
        public Guid ID { get; set; }
        public int Quantity { get; set; }
    }
}