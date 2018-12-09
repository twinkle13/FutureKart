using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.Exceptions
{
    public class ProductDoesNotExistsException : Exception
    {
        public ProductDoesNotExistsException() { }
        public ProductDoesNotExistsException(string message) : base(message) { }
        public ProductDoesNotExistsException(string message, Exception exception) : base(message, exception) { }
    }
}
