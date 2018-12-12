using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class CartMessagesViewModel
    {
        public string SuccessMessage { get; set; }
        public List<string> ErrorMessages { get; set; }
        public CartMessagesViewModel()
        {
            ErrorMessages = new List<string>();
        }
    }
}