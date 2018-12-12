﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Product
{
    public class ProductsSearchedResultDTO
    {
        public bool IsLoggedIn { get; set; }
        public IEnumerable<ProductDTO> Products { get; set; }
    }
}