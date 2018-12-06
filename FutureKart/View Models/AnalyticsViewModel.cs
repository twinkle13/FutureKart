using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class AnalyticsViewModel
    {
        public IEnumerable<CategoryProductViewModel> CategoryProducts { get; set; }
    }
}