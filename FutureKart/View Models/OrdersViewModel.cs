using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class OrdersViewModel
    {
        public IEnumerable<OrderViewModel> Orders;
        public bool IsLoggedIn { get; set; }
    }
}