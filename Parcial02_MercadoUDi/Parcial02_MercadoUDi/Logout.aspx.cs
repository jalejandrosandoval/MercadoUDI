using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Logout : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id_User"] != null)
            {

                Session.Abandon();

                //talog.Insert("Close Session", Session["Username"].ToString(), System.DateTime.Now);

                Response.Redirect("Login.aspx");

            }
        }
    }
}