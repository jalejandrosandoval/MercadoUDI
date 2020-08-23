using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Logs : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
             new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

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

        protected void Btn_Accept_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultAdmin.aspx");
            //talog.Insert("Watch Logs of System", (string)Session["Username"], System.DateTime.Now);
        }
    }
}