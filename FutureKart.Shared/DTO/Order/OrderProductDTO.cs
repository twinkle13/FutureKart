using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Order
{
    public class OrderProductDTO
    {
        public IEnumerable<OrderPlacedVariantDTO> OrderPlacedVariants { get; set; }
    }
}
