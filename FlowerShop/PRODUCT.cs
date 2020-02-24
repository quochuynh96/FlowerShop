//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FlowerShop
{
    using System;
    using System.Collections.Generic;
    
    public partial class PRODUCT
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PRODUCT()
        {
            this.IMAGEs = new HashSet<IMAGE>();
            this.ORDERS_DETAIL = new HashSet<ORDERS_DETAIL>();
        }
    
        public int Product_ID { get; set; }
        public string Product_Name { get; set; }
        public Nullable<int> Product_Price { get; set; }
        public string Product_Description { get; set; }
        public Nullable<long> Product_Stock_Quantity { get; set; }
        public Nullable<byte> Product_Status { get; set; }
        public Nullable<int> Categories_ID { get; set; }
    
        public virtual CATEGORy CATEGORy { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<IMAGE> IMAGEs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ORDERS_DETAIL> ORDERS_DETAIL { get; set; }
    }
}