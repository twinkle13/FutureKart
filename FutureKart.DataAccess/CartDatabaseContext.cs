using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Cart;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Variant;

namespace FutureKart.DataAccess
{
    public class CartDatabaseContext
    {
        FutureKartEntities FutureKartDBObject;
        IMapper CartItemsMapper;
        public CartDatabaseContext()
        {
            FutureKartDBObject = new FutureKartEntities();
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CartVariantMapping, CartProductsDTO>();
                cfg.CreateMap <Variant, VariantDTO > ();
                cfg.CreateMap <Product, ProductDTO > ();
                cfg.CreateMap <VariantImageDTO, VariantImageDTO > ();
            });
            CartItemsMapper = new Mapper(config);
        }
        public int GetInitialQuantityInCart(CartDTO cartDTO)
        {

            int quantity = FutureKartDBObject.CartVariantMappings.Where(c => c.CartID == cartDTO.UserID && c.VariantID == cartDTO.VariantID).Select(c => c.Quantity).FirstOrDefault();
            
            return quantity;
        }
        public int GetInventory(CartDTO cartDTO)
        {
            int Inventory = FutureKartDBObject.Variants.Where(v => v.ID == cartDTO.VariantID).Select(v => v.Inventory).FirstOrDefault();
            return Inventory;
        }
        public int GetOrderLimit(CartDTO cartDTO)
        {
            Guid ProductID = FutureKartDBObject.Variants.Where(v => v.ID == cartDTO.VariantID).Select(v=>v.ProductID).FirstOrDefault();
            var OrderLimit = FutureKartDBObject.Products.Where(p => p.ID == ProductID).Select(p => p.OrderLimit).FirstOrDefault(); 
            if(OrderLimit == null)
            {
                return GetInventory(cartDTO);
            }
            return OrderLimit.GetValueOrDefault();
        }
        private bool isItemPresent(CartDTO cartDTO)
        {
            CartVariantMapping cart=  FutureKartDBObject.CartVariantMappings.Where(c => c.CartID == cartDTO.UserID && c.VariantID == cartDTO.VariantID).FirstOrDefault();
            if(cart != null)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public void AddItem(CartDTO cartDTO)
        {
            CartVariantMapping cart;
            if (isItemPresent(cartDTO))
            {
                cart = FutureKartDBObject.CartVariantMappings.Where(c => c.CartID == cartDTO.UserID && c.VariantID == cartDTO.VariantID).FirstOrDefault();
                cart.Quantity = cartDTO.Quantity;
            }
            else
            {
                double SellingPrice = GetSellingPrice(cartDTO.VariantID);
                Guid id = Guid.NewGuid();
                cart = new CartVariantMapping { ID= id,CartID = cartDTO.UserID, VariantID = cartDTO.VariantID, Quantity = cartDTO.Quantity, SellingPrice = SellingPrice };
                FutureKartDBObject.CartVariantMappings.Add(cart);
            }
            FutureKartDBObject.SaveChanges();

        }
        private double GetSellingPrice(Guid VariantID)
        {
            double ListingPrice = FutureKartDBObject.Variants.Where(v => v.ID == VariantID).Select(v => v.ListingPrice).FirstOrDefault();
            double Discount = FutureKartDBObject.Variants.Where(v => v.ID == VariantID).Select(v => v.Discount).FirstOrDefault();
            double SellingPrice = ListingPrice - Discount * ListingPrice / 100;
            return SellingPrice;
        }

        public CartItemsDTO GetCart(Guid UserID)
        {
            var cartItems = FutureKartDBObject.CartVariantMappings.Where(c => c.CartID == UserID).ToList();
            CartItemsDTO cartItemsDTO = new CartItemsDTO();
            cartItemsDTO.CartItems = CartItemsMapper.Map<IEnumerable<CartVariantMapping>, IEnumerable<CartProductsDTO>>(cartItems);
            return cartItemsDTO;
        }

        public void RemoveItem(Guid UserID, Guid VariantID)
        {
            FutureKartDBObject.CartVariantMappings.RemoveRange(FutureKartDBObject.CartVariantMappings.Where(c => c.CartID == UserID && c.VariantID == VariantID));
            FutureKartDBObject.SaveChanges();
        }

    }
}
