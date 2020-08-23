using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class ShoppingCartClient : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.InvoiceTableAdapter tai =
            new MercadoUDi_DataSetTableAdapters.InvoiceTableAdapter();

        MercadoUDi_DataSetTableAdapters.InvoiceDetailsTableAdapter taid =
            new MercadoUDi_DataSetTableAdapters.InvoiceDetailsTableAdapter();

        MercadoUDi_DataSet.InvoiceDataTable resInv;

        List<ShoppingCart> shoppingCartList;

        ShoppingCart ProductToEdit = new ShoppingCart();

        int ProductPriceTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            btn_Purchase.Visible = false;
            label9.Text = "";
            labelTotal.Text = "";

            if (Session["Id_User"] == null)
            {

                Response.Redirect("Login.aspx");

            }
            else
            {

                if (Convert.ToInt32(Session["User_Type"].ToString()) != 2)
                {

                    Response.Redirect("DefaultAdmin.aspx");

                }
                else
                {                    

                    if (Session["Purchase"] != null)
                    {

                        btn_Purchase.Visible = true;
                        label9.Visible = true;
                        labelTotal.Visible = true;

                        shoppingCartList = new List<ShoppingCart>();
                        shoppingCartList = (List<ShoppingCart>)Session["Purchase"];

                        GridView_Shopping.DataSource = shoppingCartList;
                        GridView_Shopping.AutoGenerateColumns = false;
                        GridView_Shopping.DataBind();

                        foreach (ShoppingCart item in shoppingCartList)
                        {

                            ProductPriceTotal += item.ProductPriceTotal;

                        }

                        label9.Text = "Total: $";
                        labelTotal.Text = ProductPriceTotal.ToString();

                    }
                    
                }
            }
        }

        protected void GridView_Shopping_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);

            shoppingCartList.RemoveAt(index);
            Session["Purchase"] = shoppingCartList;
            GridView_Shopping.DataSource = Session["Purchase"];
            GridView_Shopping.DataBind();

            if (GridView_Shopping != null)
            {
                
                foreach (ShoppingCart item in shoppingCartList)
                {

                    ProductPriceTotal -= item.ProductPriceTotal;

                }

                labelTotal.Text = ProductPriceTotal.ToString();

            }
            else
            {

                btn_Purchase.Visible = false ;
                label9.Text = "";
                labelTotal.Text = "";

            }

        }
        protected void GridView_Shopping_RowEditing(object sender, GridViewEditEventArgs e)
        {

            this.GridView_Shopping.EditIndex = e.NewEditIndex;

        }

        protected void GridView_Shopping_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            TextBox txt_QuantityProducts = (TextBox)GridView_Shopping.Rows[e.RowIndex].FindControl("txt_Quantity");

            int productId = Convert.ToInt32(GridView_Shopping.DataKeys[e.RowIndex].Values[0].ToString());
            //int Quantity = Convert.ToInt32(GridView_Shopping.DataKeys[e.RowIndex].Values[1].ToString());

            int Quantity = Convert.ToInt32(txt_QuantityProducts.Text);

            List<ShoppingCart> UpdateList;

            UpdateList = UpdateShoppingCartList(productId, Quantity, shoppingCartList);

            GridView_Shopping.EditIndex = -1;
            Session["Purchase"] = UpdateList;
            GridView_Shopping.DataSource = Session["Purchase"];
            GridView_Shopping.DataBind();

        }

        public List<ShoppingCart> UpdateShoppingCartList(int OriginalId, int Quantity, List<ShoppingCart> list)
        {

            List<ShoppingCart> lista = list;

            foreach (ShoppingCart item in lista)
            {

                if (item.ProductId == OriginalId)
                {

                    item.Quantity = Quantity;

                }

            }

            return lista;

        }

        protected void GridView_Shopping_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Shopping.EditIndex = -1;
        }

        protected void btn_Purchase_Click(object sender, EventArgs e)
        {


            if (Session["User_NumberCard"] == null)
            {
                string script = @"alert('For continue with the purchase, you must have a registered card...');
                                window.location.href='Config_Client.aspx';";

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

            }
            else
            {
                string price = labelTotal.Text;
                int idUser = Convert.ToInt32(Session["Id_User"].ToString());
                int priceTotal = Convert.ToInt32(price);

                tai.Insert(idUser, System.DateTime.Now, priceTotal);

                int idInvoice = (int) tai.GetDataMaxIdInvoice();

                foreach (ShoppingCart item in shoppingCartList)
                {

                    taid.Insert(idInvoice, Convert.ToInt32((item.ProductId.ToString())),
                        Convert.ToInt32((item.Quantity.ToString())), Convert.ToInt32((item.ProductPriceUnitary.ToString())));

                }                

                //talog.Insert("Purchase", Session["Username"].ToString(), System.DateTime.Now);


                string script = @"alert('Purchase made correctly... In a couple of days you will have the products');
                                window.location.href='ShoppingCartClient.aspx';";

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                shoppingCartList = null;
                Session["Purchase"] = shoppingCartList;
                GridView_Shopping.DataSource = Session["Purchase"];
                GridView_Shopping.DataBind();
                
            }
            
        }

    }
}