using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FutureKart.DataAccess;
using FutureKart.Shared.DTO.Address;

namespace FutureKart.Business
{
    public class AddressBusinessContext
    {
        AddressDatabaseContext addressDatabaseContext;
        
        public AddressBusinessContext()
        {
            addressDatabaseContext = new AddressDatabaseContext();
        }
        public IEnumerable<AddressDTO> getUserAddresses(Guid userID)
        {
            IEnumerable<AddressDTO> addresses = addressDatabaseContext.GetUserAddresses(userID);
            return addresses;
        }

        public Guid AddAddress(Guid userID, AddressDTO address)
        {
            Guid AddressID = addressDatabaseContext.AddAddress(userID, address);
            return AddressID;
        }
    }
}
