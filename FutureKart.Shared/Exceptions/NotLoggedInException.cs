using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class NotLoggedInException : Exception
    {
        public NotLoggedInException() { }
        public NotLoggedInException(string message) : base(message) { }
        public NotLoggedInException(string message, Exception exception) : base(message, exception) { }
    }
}
