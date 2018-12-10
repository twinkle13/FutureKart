using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class OrderViewModel
    {
        public int StatusID { get; set; }
        public double TotalAmount { get; set; }
        public System.DateTime OrderDate { get; set; }
        public IEnumerable<OrderProductViewModel> OrderPlaceds { get; set; }
    }
}