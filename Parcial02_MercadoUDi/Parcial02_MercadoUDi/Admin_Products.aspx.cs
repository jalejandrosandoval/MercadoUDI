using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Admin_Products : System.Web.UI.Page
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

        protected void Btn_RegisterProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register_Product.aspx");
        }

        protected void Btn_UpdateProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Update_Products.aspx");
        }

        protected void Btn_ListProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("List_Products.aspx");
        }
        
    }
}