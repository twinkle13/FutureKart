using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class CartItemsViewModel
    {
        public double TotalAmount { get; set; }
        public double TotalDiscount { get; set; }
        public IEnumerable<CartProductsViewModel> CartItems { get; set; }
    }
}