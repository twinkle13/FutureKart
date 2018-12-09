using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Cart
{
   public class CartItemsDTO
    {
        public double TotalAmount { get; set; }
        public double TotalDiscount { get; set; }
        public IEnumerable<CartProductsDTO> CartItems { get; set; }
    }
}
