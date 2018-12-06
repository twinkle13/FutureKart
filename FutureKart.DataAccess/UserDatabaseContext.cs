using AutoMapper;
using FutureKart.Entities;
using FutureKart.Shared.DTO.Role;
using FutureKart.Shared.DTO.User;
using FutureKart.Shared.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.DataAccess
{
   public class UserDatabaseContext
    {
        FutureKartEntities FutureKartContext ;
        IMapper UserRegistermapper;
        IMapper RegisterUserMapper;
        IMapper UserInfoMapper;
        IMapper RoleMapper;
        public UserDatabaseContext()
        {

            FutureKartContext = new FutureKartEntities();
            var userRegisterDTOconfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<User, UserRegisterDTO>();
            });

            var registerUserConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<UserRegisterDTO, User>();
            });

            var userInfoDTOConfig = new MapperConfiguration(cfg => {
                cfg.CreateMap<User,UserInfoDTO > ();
            });

            var roleMapperConfig = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Role, RoleDTO>();
            });

            UserRegistermapper = new Mapper(userRegisterDTOconfig);
            RegisterUserMapper = new Mapper(registerUserConfig);
            UserInfoMapper = new Mapper(userInfoDTOConfig);
            RoleMapper = new Mapper(roleMapperConfig);
        }
        
        public bool UserEmailExists(string RegisterEmail)
        {
            User user = FutureKartContext.Users.Where(a => a.Email == RegisterEmail).FirstOrDefault();
            if(user == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public UserInfoDTO GetUser(UserLoginDTO loggedInUserCredentialsDTO)
        {
            User user = FutureKartContext.Users.Where(u => u.Email == loggedInUserCredentialsDTO.Email).FirstOrDefault();
            if(user != null)
            {
                UserInfoDTO userDetailsDTO = UserInfoMapper.Map<User, UserInfoDTO>(user);
                return userDetailsDTO;
            }
            else
            {
                throw new UserNotFoundException("User not found exception");
            }
        }

        public RolesDTO GetRoles()
        {
            List<Role> roleList = FutureKartContext.Roles.Where(r => r.Name != "ADMIN").ToList();
            if(roleList.Count()<=0)
            {
                throw new NoRolesFoundException("No roles found exception");
            }
            IEnumerable<Role> rolesListIEnumerable = roleList.AsEnumerable();
            RolesDTO rolesDTO = new RolesDTO();
            rolesDTO.Roles = RoleMapper.Map<IEnumerable<Role>, IEnumerable<RoleDTO>>(rolesListIEnumerable);
            return rolesDTO;
            
        }

        public UserInfoDTO AddUser(UserRegisterDTO userDTO)
        {
            User user = RegisterUserMapper.Map<UserRegisterDTO, User>(userDTO);
            user.ID = Guid.NewGuid();
            user.RoleID = FutureKartContext.Roles.Where(s => s.Name == userDTO.RoleName).Select(a => a.ID).FirstOrDefault();
            FutureKartContext.Users.Add(user);
            FutureKartContext.SaveChanges();
            UserInfoDTO newUserInfoDTO = UserInfoMapper.Map<User, UserInfoDTO>(user);
            return newUserInfoDTO;
        }
    }
}
