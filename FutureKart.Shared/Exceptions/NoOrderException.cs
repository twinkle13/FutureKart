using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class NoOrderException : Exception
    {
        public NoOrderException() { }
        public NoOrderException(string message) : base(message) { }
        public NoOrderException(string message, Exception exception) : base(message, exception) { }
    }
}
