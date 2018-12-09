using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FutureKart.DataAccess;
using FutureKart.Shared.DTO.Cart;
using FutureKart.Shared.Exceptions;

namespace FutureKart.Business
{
    public class CartBusinessContext
    {
        CartDatabaseContext CartDatabaseContextObject;
        public CartBusinessContext()
        {
            CartDatabaseContextObject = new CartDatabaseContext();
        }
        public void AddItemToCart(CartDTO cartDTO)
        {
            int totalQuantity = CartDatabaseContextObject.GetInitialQuantityInCart(cartDTO) + cartDTO.Quantity;
            int OrderLimit = CartDatabaseContextObject.GetOrderLimit(cartDTO);
            int Inventory = CartDatabaseContextObject.GetInventory(cartDTO);
            if(totalQuantity > OrderLimit)
            {
                throw new OrderLimitExceedException();
            }
            if(totalQuantity > Inventory)
            {
                throw new QuantityUnavailableException();
            }
            cartDTO.Quantity = totalQuantity;
            CartDatabaseContextObject.AddItem(cartDTO);
        }



        public CartItemsDTO GetCart(Guid UserID)
        {
            CartItemsDTO CartItemsDTOObject = CartDatabaseContextObject.GetCart(UserID);
            double TotalAmount = 0;
            double TotalDiscount = 0;
            foreach(var CartProduct in CartItemsDTOObject.CartItems)
            {
                int Quantity = CartProduct.Quantity;
                double Discount = CartProduct.Variant.Discount;
                double Price = CartProduct.Variant.ListingPrice;
                CartProduct.Variant.DiscountedPrice = (Price * (100 - Discount) / 100);
                double DiscountedPrice = CartProduct.Variant.DiscountedPrice;
                TotalAmount += DiscountedPrice * Quantity;
                TotalDiscount += Discount * Price / 100;

            }
            CartItemsDTOObject.TotalAmount = TotalAmount;
            CartItemsDTOObject.TotalDiscount = TotalDiscount;
            return CartItemsDTOObject;
        }

        public void RemoveItemFromCart(Guid UserID, Guid variantID)
        {
            CartDatabaseContextObject.RemoveItem(UserID, variantID);
        }
    }
}
