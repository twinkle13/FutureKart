using FutureKart.DataAccess;
using FutureKart.Shared.DTO.Cart;
using FutureKart.Shared.DTO.Order;
using FutureKart.Shared.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Business
{
    public class OrderBusinessContext
    {
        OrderDatabaseContext orderDatabaseContext;
        CartDatabaseContext cartDatabaseContext;
        ProductDatabaseContext productDatabaseContext;
        public OrderBusinessContext()
        {
            orderDatabaseContext = new OrderDatabaseContext();
            cartDatabaseContext = new CartDatabaseContext();
            productDatabaseContext = new ProductDatabaseContext();

        }
        public OrdersDTO GetOrders(Guid UserID)
        {
            OrdersDTO ordersDTO = orderDatabaseContext.GetOrders(UserID);
            if(ordersDTO.Orders.ToList().Count == 0)
            {
                throw new NoOrderException();
            }
            else
            {
                return ordersDTO;
            }
        }
        public void PlaceOrder(Guid userID, Guid addressID)
        {
            if (orderDatabaseContext.checkItemsExistInCart(userID))
            {
                CartItemsDTO cartItemsDTO = cartDatabaseContext.GetCart(userID);
                
                double TotalAmount = 0;
                double TotalDiscount = 0;
                foreach (var CartProduct in cartItemsDTO.CartItems)
                {
                    int Quantity = CartProduct.Quantity;
                    double Discount = CartProduct.Variant.Discount;
                    double Price = CartProduct.Variant.ListingPrice;
                    CartProduct.Variant.DiscountedPrice = (Price * (100 - Discount) / 100);
                    double DiscountedPrice = CartProduct.Variant.DiscountedPrice;
                    TotalAmount += DiscountedPrice * Quantity;
                    TotalDiscount += Discount * Price / 100;

                }
                cartItemsDTO.TotalAmount = TotalAmount;
                cartItemsDTO.TotalDiscount = TotalDiscount;
                orderDatabaseContext.PlaceOrder(userID, addressID,cartItemsDTO);
                productDatabaseContext.UpdateInventory(cartItemsDTO);
                cartDatabaseContext.EmptyCart(userID);

            }
            else
            {
                throw new CartEmptyException();
            }
        }
    }
}
