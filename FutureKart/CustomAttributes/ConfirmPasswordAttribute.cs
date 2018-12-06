﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Web;

namespace FutureKart.CustomAttributes
{
    public class ConfirmPasswordAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object confirmedPassword, ValidationContext validationContext)
        {

            if ((string)confirmedPassword == null)
            {
                return new ValidationResult("Confirmation Password not entered");
            }
            object instance = validationContext.ObjectInstance;
            Type type = instance.GetType();
            PropertyInfo password = type.GetProperty("Password");
            PropertyInfo confirm = type.GetProperty("Confirm Password");
            if (password == null)
            {
                return new ValidationResult("Password not entered");
            }

            string passwordValue = (string)password.GetValue(instance);
            string confirmedPasswordValue = (string)confirmedPassword;
            if (passwordValue != confirmedPasswordValue)
            {
                return new ValidationResult("Passwords do not match");
            }
            return ValidationResult.Success;
        }
    }
}