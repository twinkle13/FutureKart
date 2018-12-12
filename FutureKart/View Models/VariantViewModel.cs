using FutureKart.Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class VariantViewModel
    {
        public Guid ID { get; set; }
        public string VariantString { get; set; }
        public double ListingPrice { get; set; }
        public double Discount { get; set; }
        public double SellingPrice { get; set; }
        public int QuantitySold { get; set; }
        public int Inventory { get; set; }
        public ProductViewModel Product { get; set; }
        public IEnumerable<VariantImageViewModel> VariantImages { get; set; }
        public double DiscountedPrice { get; set; }
        public string SKU { get; set; }
    }
}