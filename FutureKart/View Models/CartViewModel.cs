using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class CartViewModel
    {
        public int Quantity { get; set; }
        public Guid UserID { get; set; }
        public Guid VariantID { get; set; }
        public Guid ProductID { get; set; }
        public int OrderLimit { get; set; }
        public int Inventory { get; set; }
    }
}