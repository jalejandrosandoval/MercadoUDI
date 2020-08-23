using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class PageMasterDefault : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["Quantity"] != null)
            {

                labelArticles.Text = "(" + Session["Quantity"].ToString() + ")";

            }
            else
            {

                labelArticles.Text = "";

            }


        }
    }
}