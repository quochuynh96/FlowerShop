using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FlowerShop.Carts
{
    public class Cart
    {
        private int amount;
        private PRODUCT product;
        public Cart()
        {
            amount = 0;
            product = null;
        }
        public Cart(int n,PRODUCT pro)
        {
            this.amount = n;
            this.product = pro;
        }

        public int Amount { get => amount; set => amount = value; }
        public PRODUCT Product { get => product; set => product = value; }
    }
}