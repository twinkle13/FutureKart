using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Cart
{
    public class CartDTO
    {
        public int Quantity { get; set; }
        public Guid UserID { get; set; }
        public Guid VariantID { get; set; }
        public double SellingPrice { get; set; }
    }
}
