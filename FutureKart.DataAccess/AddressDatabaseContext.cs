using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Address;

namespace FutureKart.DataAccess
{
    public class AddressDatabaseContext
    {
        FutureKartEntities FutureKartContext;
        IMapper AddressMapper;
        public AddressDatabaseContext()
        {
            FutureKartContext = new FutureKartEntities();
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Address,AddressDTO>();
            });
            AddressMapper = new Mapper(config);
        }
        public IEnumerable<AddressDTO> GetUserAddresses(Guid userID)
        {
            IEnumerable<AddressDTO> addressDTOs;
            IEnumerable<Address> addresses;
            int AddressIDsCount = FutureKartContext.UserAddressMappings.Where(m => m.UserID == userID).Count();
            IEnumerable<Guid?> AddressIDs = FutureKartContext.UserAddressMappings.Where(m => m.UserID == userID).Select(m => m.AddressID);
            if (AddressIDsCount == 0)
            {
                return null;
            }
            else
            {
                addresses = FutureKartContext.Addresses.Where(a => AddressIDs.Contains(a.ID));
                addressDTOs = AddressMapper.Map<IEnumerable<Address>, IEnumerable<AddressDTO>>(addresses);
                return addressDTOs;
            }
        }

        public Guid AddAddress(Guid userID, AddressDTO addressDTO)
        {
            Guid id = Guid.NewGuid();
            Guid mappingID = Guid.NewGuid();
            Address address = new Address { ID = id, AddressLine1 = addressDTO.AddressLine1, AddressLine2 = addressDTO.AddressLine2, City = addressDTO.City, Pin = addressDTO.PIN, State = addressDTO.State, Country = addressDTO.Country };
            FutureKartContext.Addresses.Add(address);
            UserAddressMapping userAddressMapping = new UserAddressMapping { ID = mappingID, AddressID = id, UserID = userID };
            FutureKartContext.UserAddressMappings.Add(userAddressMapping);
            FutureKartContext.SaveChanges();
            return id;
        }
    }
}
