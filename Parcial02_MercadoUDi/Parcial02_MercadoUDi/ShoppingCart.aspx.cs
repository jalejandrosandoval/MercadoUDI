using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Parcial02_MercadoUDi
{
    public partial class ShoppingCart1 : System.Web.UI.Page
    {

        List<ShoppingCart> shoppingCartList;

        ShoppingCart ProductToEdit = new ShoppingCart();

        int ProductPriceTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            btn_Purchase.Visible = false;
            label9.Text = "";
            labelTotal.Text = "";

            if (!IsPostBack)
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

        protected void GridView_Shopping_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);

            int Quantity = Convert.ToInt32(GridView_Shopping.DataKeys[e.RowIndex].Values[1].ToString());
            //int Quantity = Convert.ToInt32(GridView_Shopping.Rows[e.RowIndex].Cells[7].Text.ToString());
            Session["Quantity"] = Convert.ToInt32(Session["Quantity"].ToString()) - Quantity;

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

                btn_Purchase.Visible = false;
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
            /*
              
            try{
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
                    {*/

            
                TextBox txt_QuantityProducts = (TextBox)GridView_Shopping.Rows[e.RowIndex].FindControl("txt_Quantity");

                int productId = Convert.ToInt32(GridView_Shopping.DataKeys[e.RowIndex].Values[0].ToString());
                //int Quantity = Convert.ToInt32(GridView_Shopping.DataKeys[e.RowIndex].Values[1].ToString());

                int Quantity = Convert.ToInt32(txt_QuantityProducts.Text);

                UpdateShoppingCartList(productId, Quantity, shoppingCartList);

                GridView_Shopping.EditIndex = -1;
                GridView_Shopping.DataSource = Session["Purchase"];
                GridView_Shopping.DataBind();


            
            /*}

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
            }*/
        

        }

        public void UpdateShoppingCartList(int OriginalId, int Quantity, List<ShoppingCart> list)
        {

           list = (List<ShoppingCart>)Session["Purchase"];
            if (GridView_Shopping != null)
            {
                foreach (ShoppingCart item in list)
                {

                    if (item.ProductId == OriginalId)
                    {

                        item.Quantity = Quantity;
                        item.ProductPriceTotal = item.Quantity * item.ProductPriceUnitary;
                        ProductPriceTotal = item.ProductPriceTotal;

                    }

                }

                labelTotal.Text = ProductPriceTotal.ToString();

            }
            else
            {

                btn_Purchase.Visible = false;
                label9.Text = "";
                labelTotal.Text = "";

            }

            Session["Purchase"] = list;

        }

        protected void GridView_Shopping_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_Shopping.EditIndex = -1;
        }

        protected void btn_Purchase_Click(object sender, EventArgs e)
        {

            if (Session["Id_User"] == null)
            {
                string script = @"alert('For continue with the purchase you must a Start Session...');
                            window.location.href='Login.aspx';";

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

            }

        }

    }
}