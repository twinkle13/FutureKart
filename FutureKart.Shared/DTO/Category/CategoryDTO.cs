﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FutureKart.Shared.DTO.Category
{
    public class CategoryDTO
    {
        public string Name { get; set; }
        public int ProductsSold { get; set; }
        public Guid ID { get; set; }
    }
}
