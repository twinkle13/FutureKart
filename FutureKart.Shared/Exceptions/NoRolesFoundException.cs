using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class NoRolesFoundException : Exception
    {
        public NoRolesFoundException() { }
        public NoRolesFoundException(string message) : base(message) { }
        public NoRolesFoundException(string message, Exception exception) : base(message, exception) { }
    }
}
