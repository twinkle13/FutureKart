﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class EmailAlreadyExistsException : Exception
    {
        public EmailAlreadyExistsException() { }
        public EmailAlreadyExistsException(string message) : base(message) { }
        public EmailAlreadyExistsException(string message, Exception exception) : base(message, exception) { }
    }
}
