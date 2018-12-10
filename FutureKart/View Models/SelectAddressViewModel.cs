using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class SelectAddressViewModel
    {
        public IEnumerable<AddressViewModel> Addresses { get; set; }
        public string AddressID { get; set; }
    }
}