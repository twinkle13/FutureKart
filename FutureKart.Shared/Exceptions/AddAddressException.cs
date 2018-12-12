using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class AddAddressException : Exception
    {
        public AddAddressException() { }
        public AddAddressException(string message) : base(message) { }
        public AddAddressException(string message, Exception exception) : base(message, exception) { }
    }
}
