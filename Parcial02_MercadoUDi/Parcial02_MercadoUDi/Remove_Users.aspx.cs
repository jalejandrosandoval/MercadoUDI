using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Remove_Users : System.Web.UI.Page
    {
        public int idUser;

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

        protected void GridView_Users_SelectedIndexChanged(object sender, EventArgs e)
        {
            string u = this.GridView_Users.SelectedRow.Cells[1].Text;
            Session["Id_User_Remove"] = u;

            Response.Redirect("Remove_Users_Delete.aspx");

            GridView_Users.DataBind();
        }
    }
}