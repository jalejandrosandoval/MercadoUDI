using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class MyPurchases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Accept_Click(object sender, EventArgs e)
        {

        }

        protected void GridView_Invoices_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idInvoice = Convert.ToInt32(this.GridView_Invoices.SelectedRow.Cells[1].Text.ToString());

            Session["IdInvo"] = idInvoice;

            Response.Redirect("MyPurchases_Details.aspx");
        }
    }
}