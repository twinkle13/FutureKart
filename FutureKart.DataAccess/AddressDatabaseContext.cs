using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Address;
using FutureKart.Shared.Exceptions;

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
            Debug.WriteLine(FutureKartContext.UserAddressMappings.Where(m => m.UserID == userID).Select(m => m.AddressID));
            IEnumerable<Guid?> AddressIDs = FutureKartContext.UserAddressMappings.Where(m => m.UserID == userID).Select(m => m.AddressID);
            Debug.WriteLine(FutureKartContext.UserAddressMappings.Where(m => m.UserID == userID).Select(m => m.AddressID));
            if (AddressIDsCount == 0)
            {
                return null;
            }
            else
            {
                addresses = FutureKartContext.Addresses.Where(a => AddressIDs.Contains(a.ID));
                Debug.WriteLine(FutureKartContext.Addresses.Where(a => AddressIDs.Contains(a.ID)));
                addressDTOs = AddressMapper.Map<IEnumerable<Address>, IEnumerable<AddressDTO>>(addresses);
                return addressDTOs;
            }
        }

        public Guid AddAddress(Guid userID, AddressDTO addressDTO)
        {
            Guid id = Guid.NewGuid();
            Guid mappingID = Guid.NewGuid();
            Address address = new Address { ID = id, AddressLine1 = addressDTO.AddressLine1, AddressLine2 = addressDTO.AddressLine2, City = addressDTO.City, Pin = addressDTO.PIN, State = addressDTO.State, Country = addressDTO.Country };
            try { 
            FutureKartContext.Addresses.Add(address);
            }
            catch(Exception ex)
            {
                throw new AddAddressException("Unknown exception occured " +ex);
            }
            UserAddressMapping userAddressMapping = new UserAddressMapping { ID = mappingID, AddressID = id, UserID = userID };
            try { 
            FutureKartContext.UserAddressMappings.Add(userAddressMapping);
                }
            catch(Exception ex)
            {
                throw new AddAddressException("Unknown exception occured " +ex);
             }
            FutureKartContext.SaveChanges();
            return id;
        }
    }
}
