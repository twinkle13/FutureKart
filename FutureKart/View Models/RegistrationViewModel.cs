﻿using FutureKart.CustomAttributes;
using FutureKart.Shared.DTO.Role;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class RegistrationViewModel
    {
        [Required]
        [RegularExpression("^[a-zA-Z ]+", ErrorMessage = "Name may only contain alphabetic characters and space")]
        public string Name { get; set; }


        [Required]
        [DisplayName("Password")]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Password should be between 8 and 20 characters")]
        public string Password { get; set; }

        [Required]
        [DisplayName("Confirm Password")]
        [ConfirmPassword]
        public string ConfirmedPassword { get; set; }

        [Required]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }

        [Required]
        public IEnumerable<RoleDTO> Roles { get; set; }
        //[Required]
        //[RegularExpression(@"\d{10}", ErrorMessage = "Please enter a valid Mobile Number")]
        public string PhoneNumber { get; set; }
        public string RoleName { get; set; }


    }
}