using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class ShoppingCartDefault : System.Web.UI.Page
    {

        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.ProductTableAdapter tap =
            new MercadoUDi_DataSetTableAdapters.ProductTableAdapter();

        MercadoUDi_DataSet.ProductDataTable res;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["IdPro"] != null && Request.Params["Quantity"] != null)
            {

                txt_IdPro.Text = Request.Params["IdPro"].ToString();

                txt_Quantity.Text = Request.Params["Quantity"].ToString();

                int idProd = Convert.ToInt32(Request.Params["IdPro"].ToString());

                res = tap.GetDataBy_IdProduct(idProd);

                int price = Convert.ToInt32(res[0].ProductPrice.ToString());
                int quantity = Convert.ToInt32(Request.Params["Quantity"].ToString());
                int subtotal = price * quantity;

                label_Subtotal.Text = "Subtotal: $" + subtotal.ToString();
            }
        }
    }
}