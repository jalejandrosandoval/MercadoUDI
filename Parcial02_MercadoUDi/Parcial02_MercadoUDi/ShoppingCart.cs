using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Parcial02_MercadoUDi
{
    public class ShoppingCart
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public string ProductImage { get; set; }

        public int ProductPriceUnitary { get; set; }

        public int ProductStock { get; set; }

        public int Quantity { get; set; }

        public int ProductPriceTotal { get; set; }

    }
}