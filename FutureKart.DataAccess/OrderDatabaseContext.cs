using FutureKart.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using FutureKart.Shared.DTO.Order;
using AutoMapper;
using FutureKart.Shared.DTO.Variant;
using FutureKart.Shared.DTO.Address;
using FutureKart.Shared.DTO.Product;
using FutureKart.Shared.DTO.Category;
using System.Diagnostics;

namespace FutureKart.DataAccess
{
    public class OrderDatabaseContext
    {
        FutureKartEntities FutureKartContext;
        IMapper orderMapper;
        public OrderDatabaseContext()
        {
            FutureKartContext = new FutureKartEntities();
            var configOrder = new MapperConfiguration(cfg =>
           {
               cfg.CreateMap<Order, OrderDTO>();
               cfg.CreateMap<OrderPlaced, OrderProductDTO>();
               cfg.CreateMap<OrderPlacedVariant, OrderPlacedVariantDTO>();
               cfg.CreateMap<Variant, VariantDTO>();
               cfg.CreateMap<VariantImage, VariantImageDTO>();
               cfg.CreateMap<Address, AddressDTO>();
               cfg.CreateMap<Product, ProductDTO>();
               cfg.CreateMap<Category, CategoryProductsDTO>();
           });
            orderMapper = new Mapper(configOrder);
        }

        public string GetOrderStatus(int statusID)
        {
           string status =  FutureKartContext.Status.Where(s => s.ID == statusID).Select(s => s.description).FirstOrDefault();
            Debug.WriteLine(FutureKartContext.Status.Where(s => s.ID == statusID).Select(s => s.description).FirstOrDefault());
            return status;
        }

        public void PlaceOrder(Guid userID, Guid addressID, Shared.DTO.Cart.CartItemsDTO cartItemsDTO)
        {
            Guid OrderId = Guid.NewGuid();
            Guid OrderPlacedId = Guid.NewGuid();
            Order order = new Order { ID = OrderId, DeliveryAddressID = addressID, TotalAmount = cartItemsDTO.TotalAmount , isCancelled = "N",
                OrderDate = DateTime.Now, DeliveryDate = DateTime.Now, StatusID = 1};
            FutureKartContext.Orders.Add(order);
            FutureKartContext.SaveChanges();
            OrderPlaced orderPlaced = new OrderPlaced { ID = OrderPlacedId, OrderID = OrderId, UserID = userID };
            FutureKartContext.OrderPlaceds.Add(orderPlaced);
            FutureKartContext.SaveChanges();
            foreach (var cartItem in cartItemsDTO.CartItems)
            {
                OrderPlacedVariant orderPlacedVariant = new OrderPlacedVariant { ID = Guid.NewGuid(), OrderPlacedID = OrderPlacedId, VariantID = cartItem.Variant.ID, SellingPrice = cartItem.Variant.DiscountedPrice, Quantity = cartItem.Quantity };
                FutureKartContext.OrderPlacedVariants.Add(orderPlacedVariant);
                FutureKartContext.SaveChanges();
            }
        }

        public OrdersDTO GetOrders(Guid userID)
        {
            IEnumerable<Guid> OrderPlacedID = FutureKartContext.OrderPlaceds.Where(c => c.UserID == userID).Select(o => o.OrderID).ToList();
            Debug.WriteLine(FutureKartContext.OrderPlaceds.Where(c => c.UserID == userID).Select(o => o.OrderID).ToList());
            List<Order> orderList = new List<Order>();
            foreach (Guid orderID in OrderPlacedID)
            {
                Order order = FutureKartContext.Orders.Where(c => c.ID == orderID).FirstOrDefault();
                Debug.WriteLine(FutureKartContext.Orders.Where(c => c.ID == orderID).FirstOrDefault());

                orderList.Add(order);
            }
            OrdersDTO orderInfo = new OrdersDTO();
            orderInfo.Orders = orderMapper.Map<IEnumerable<Order>, IEnumerable<OrderDTO>>(orderList.AsEnumerable());
            return orderInfo;

        }

        public OrderDTO GetOrder(Guid orderID)
        {
            Order order = FutureKartContext.Orders.Where(o => o.ID == orderID).FirstOrDefault();
            Debug.WriteLine(FutureKartContext.Orders.Where(o => o.ID == orderID).FirstOrDefault());
            OrderDTO orderDTO = orderMapper.Map<Order, OrderDTO>(order);
            return orderDTO;
        }

        public bool checkItemsExistInCart(Guid userID)
        {
            int cartExist = FutureKartContext.CartVariantMappings.Include(c => c.VariantID).Where(c => c.CartID == userID).Count();
            Debug.WriteLine(FutureKartContext.CartVariantMappings.Include(c => c.VariantID).Where(c => c.CartID == userID).Count());
            if (cartExist  > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
