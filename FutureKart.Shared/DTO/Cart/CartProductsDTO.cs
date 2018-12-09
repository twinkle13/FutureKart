using FutureKart.Shared.DTO.Variant;
using System;

namespace FutureKart.Shared.DTO.Cart
{
    public class CartProductsDTO
    {
        public string Name { get; set; }
        public VariantDTO Variant { get; set; }
        public Guid ID { get; set; }
        public int Quantity {get;set;}
    }
}