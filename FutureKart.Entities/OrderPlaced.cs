//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FutureKart.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderPlaced
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrderPlaced()
        {
            this.OrderPlacedVariants = new HashSet<OrderPlacedVariant>();
        }
    
        public System.Guid ID { get; set; }
        public System.Guid OrderID { get; set; }
        public System.Guid UserID { get; set; }
    
        public virtual Order Order { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderPlacedVariant> OrderPlacedVariants { get; set; }
    }
}
