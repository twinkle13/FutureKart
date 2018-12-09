using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class QuantityUnavailableException : Exception
    {
        public QuantityUnavailableException() { }
        public QuantityUnavailableException(string message) : base(message) { }
        public QuantityUnavailableException(string message, Exception exception) : base(message, exception) { }
    }
}
