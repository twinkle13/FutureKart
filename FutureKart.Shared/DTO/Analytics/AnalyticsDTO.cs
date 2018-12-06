using FutureKart.Shared.DTO.Category;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Analytics
{
    public class AnalyticsDTO
    {
        public IEnumerable<CategoryProductsDTO> CategoryProducts { get; set; }
    }
}
