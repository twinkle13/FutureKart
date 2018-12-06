using AutoMapper;
using FutureKart.DataAccess;
using FutureKart.Shared.DTO.Role;
using FutureKart.Shared.DTO.User;
using FutureKart.Shared.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Business
{
    public class UserBusinessContext
    {
        UserDatabaseContext UserDBContext;
        IMapper mapper;
        public UserBusinessContext()
        {
            UserDBContext = new UserDatabaseContext();
        }
        
        public UserInfoDTO RegisterUser(UserRegisterDTO userRegister)
        {
            try
            {
                if (UserDBContext.UserEmailExists(userRegister.Email))
                {
                    throw new EmailAlreadyExistsException("Email already exists");
                }
                userRegister.HashPassword = PasswordHasher.HashPassword(userRegister.Password);
                UserInfoDTO newUserInfoDTO = UserDBContext.AddUser(userRegister);
                return newUserInfoDTO;


            }
            catch (EmailAlreadyExistsException ex)
            {
                throw new EmailAlreadyExistsException();
            }
            catch(Exception ex) { throw new Exception(); }
        }

        public UserInfoDTO LoginUser(UserLoginDTO loggedInUserCredentialsDTO)
        {
            UserInfoDTO userDetailsDTO;
            
                if (UserDBContext.UserEmailExists(loggedInUserCredentialsDTO.Email))
                {
                    userDetailsDTO = UserDBContext.GetUser(loggedInUserCredentialsDTO);
                    if (PasswordHasher.VerifyPassword(loggedInUserCredentialsDTO.Password, userDetailsDTO.HashPassword)){
                        return userDetailsDTO;
                    }
                    else
                    {
                        throw new IncorrectPasswordException("Incorrect Password");
                    }
                }
                else
                {
                    throw new InvalidLoginException();
                }
            
        }

        public RolesDTO GetRoles()
        {
            RolesDTO rolesList = UserDBContext.GetRoles();


                if (rolesList.Roles.Count()<=0)
                {
                    throw new NoRolesFoundException();
                }
                else
                {
                    return rolesList;
                }
            
        }
    }
}
