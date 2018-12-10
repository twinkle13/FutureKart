using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class OrderProductViewModel
    {
        public IEnumerable<OrderPlacedVariantViewModel> OrderPlacedVariants { get; set; }
    }
}