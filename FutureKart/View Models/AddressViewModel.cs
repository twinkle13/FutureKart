using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FutureKart.View_Models
{
    public class AddressViewModel
    {
        [Required]
        [Display(Name = "AddressLine 1")]
        public string AddressLine1 { get; set; }

        [Display(Name = "AddressLine 2")]
        public string AddressLine2 { get; set; }

        [Required]
        [Display(Name = "PIN")]
        [RegularExpression("^[1-9][0-9]{5}")]
        public int PIN { get; set; }

        [Required]
        [Display(Name = "City")]
        public string City { get; set; }

        [Required]
        [Display(Name = "State")]
        public string State { get; set; }

        [Required]
        [Display(Name = "Country")]
        public string Country { get; set; }

        public Guid ID { get; set; }
    }
}