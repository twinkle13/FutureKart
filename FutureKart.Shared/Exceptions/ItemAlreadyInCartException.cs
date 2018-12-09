using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
   public class ItemAlreadyInCartException : Exception
    {
        public ItemAlreadyInCartException() { }
        public ItemAlreadyInCartException(string message) : base(message) { }
        public ItemAlreadyInCartException(string message, Exception exception) : base(message, exception) { }
    }
}
