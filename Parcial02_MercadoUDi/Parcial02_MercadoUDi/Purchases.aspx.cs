using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Purchases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id_User"] == null)
            {

                Response.Redirect("Login.aspx");

            }
            else
            {

                if (Convert.ToInt32(Session["User_Type"].ToString()) != 1)
                {

                    Response.Redirect("DefaultClient.aspx");

                }

            }
        }

        protected void GridView_Invoices_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idInvoice = Convert.ToInt32(this.GridView_Invoices.SelectedRow.Cells[1].Text.ToString());
            int TotalPriceInvoice = Convert.ToInt32(this.GridView_Invoices.SelectedRow.Cells[4].Text.ToString());

            Session["IdInvoAdmin"] = idInvoice;
            Session["TotalPriceInvoice"] = TotalPriceInvoice;

            Response.Redirect("Purchases_Details.aspx");
        }

    }
}