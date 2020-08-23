using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Admin_Users : System.Web.UI.Page
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

        protected void ImageButton_Add_User_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Register_User.aspx");
        }

        protected void ImageButton_Edit_User_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Update_User.aspx");
        }

        protected void ImageButton_Remove_User_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Remove_Users.aspx");
        }

        protected void ImageButton_List_User_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("list_User.aspx");
        }
    }
}