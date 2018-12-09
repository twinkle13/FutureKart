using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class OrderLimitExceedException : Exception
    {
        public OrderLimitExceedException() { }
        public OrderLimitExceedException(string message) : base(message) { }
        public OrderLimitExceedException(string message, Exception exception) : base(message, exception) { }
    }
}
