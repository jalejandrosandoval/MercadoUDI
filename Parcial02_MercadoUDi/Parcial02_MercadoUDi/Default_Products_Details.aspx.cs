using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Default_Products_Details : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.ProductTableAdapter tap =
            new MercadoUDi_DataSetTableAdapters.ProductTableAdapter();

        MercadoUDi_DataSet.ProductDataTable res;

        List<ShoppingCart> shoppingCartList;

        ShoppingCart productToAdd = new ShoppingCart();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Purchase"] == null)
            {
                
                shoppingCartList = new List<ShoppingCart>();
                Session["Purchase"] = shoppingCartList;

            }
            else
            {
                shoppingCartList = ( List<ShoppingCart> )Session["Purchase"];
               
            }

        }

        protected void Btn_Add_Shopping_Product_Click(object sender, EventArgs e)
        {

            try {

                int ProductId = Convert.ToInt32(Request.Params["IdPro"].ToString());
                int ProductQuantity = Convert.ToInt32(txt_Quantity.Text);

                res = tap.GetDataBy_IdProduct(ProductId);

                int ProductStock = Convert.ToInt32(res[0].ProductStock.ToString());

                if (txt_Quantity.Text != "")
                {

                    if (ProductStock != 0)
                    {

                        if (ProductQuantity > ProductStock || ProductQuantity < 0 || ProductQuantity == 0)
                        {

                            string script = @"alert('Non-Existent this Quantity of this Product... Sorry :/')";
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                        }
                        else
                        {

                            int ProductPriceUnitary = Convert.ToInt32(res[0].ProductPrice.ToString());

                            productToAdd.ProductId = ProductId;
                            productToAdd.ProductName = res[0].ProductName.ToString();
                            productToAdd.ProductImage = res[0].ProductImage.ToString();
                            productToAdd.ProductPriceUnitary = ProductPriceUnitary;
                            productToAdd.ProductStock = Convert.ToInt32(res[0].ProductStock.ToString());
                            productToAdd.Quantity = ProductQuantity;
                            productToAdd.ProductPriceTotal = ProductPriceUnitary * ProductQuantity;

                            if (metodo(shoppingCartList, ProductId) != true)
                            {

                                shoppingCartList.Add(productToAdd);



                                Session["Purchase"] = shoppingCartList;

                                Session["Quantity"] = ProductQuantity;

                                string script = @"alert('Product Added Correctly to the Shopping Cart...')";
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                            }
                            else
                            {
                                string script = @"alert('Product previously added to the Shopping Cart .... If you want this product, you must modify the Quantity in the Shopping Cart')";
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);
                            }

                        }

                    }
                    else
                    {

                        string script = @"alert('Non-Existent this Quantity of this Product... Sorry :/')";
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                    }

                }
                else
                {

                    Response.Write("<script>alert('Write a quantity valid');</script>");

                }

            }
            catch (Exception error)
            {
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alerta", "alert('The following error has occurred:  " + error.Message + " ');", true);
            }
            
        }

        protected void ListView_Products_Details_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            
        }

        public bool metodo(List <ShoppingCart>list, int id)
        {

            bool bol = false;

            foreach(ShoppingCart prod in list)
            {

                if(prod.ProductId == id)
                {

                    bol = true;

                }

            }

            return bol;

        }

    }
}