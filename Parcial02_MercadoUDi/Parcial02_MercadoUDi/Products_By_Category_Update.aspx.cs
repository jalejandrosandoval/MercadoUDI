using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Products_By_Category_Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (ListView_Products_By_Categories.Items.Count == 0)
            {

                LabelInfo.Visible = false;

            }


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

    }
}