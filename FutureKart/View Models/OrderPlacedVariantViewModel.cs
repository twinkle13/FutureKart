﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class OrderPlacedVariantViewModel
    {
        public double SellingPrice { get; set; }
        public int Quantity { get; set; }
        public VariantViewModel Variant { get; set; }
    }
}