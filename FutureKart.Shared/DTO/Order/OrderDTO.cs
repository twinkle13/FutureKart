using FutureKart.Shared.DTO.Address;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Order
{
    public class OrderDTO
    {
        public int StatusID { get; set; }
        public Guid ID { get; set; }
        public string Status { get; set; }
        public double TotalAmount { get; set; }
        public AddressDTO Address { get; set; }
        public System.DateTime OrderDate { get; set; }
        public IEnumerable<OrderProductDTO> OrderPlaceds { get;set; }

    }
}
