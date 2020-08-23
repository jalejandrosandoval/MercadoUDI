using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Purchases_Details : System.Web.UI.Page
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
                else
                {

                    labelTotal.Text = Session["TotalPriceInvoice"].ToString();

                }

            }

        }

        protected void Btn_Accept_Click(object sender, EventArgs e)
        {
            Response.Redirect("Purchases.aspx");
        }
    }
}