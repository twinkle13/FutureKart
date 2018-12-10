using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Address
{
    public class AddressDTO
    {
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public int PIN { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public Guid ID { get; set; }

    }
}
