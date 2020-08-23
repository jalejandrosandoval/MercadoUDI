using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Register_Category : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
           new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.CategoryTableAdapter tac =
            new MercadoUDi_DataSetTableAdapters.CategoryTableAdapter();

        MercadoUDi_DataSet.CategoryDataTable res;

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_CategoryName.Focus();

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

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            try
            {

                if (txt_CategoryName.Text != "" && txt_CategoryDescription.Text != "" && FileUpload_Image.HasFile && DropDownList_Status.SelectedValue != "")
                {
                    string CategoryName = txt_CategoryName.Text;
                    string CategoryDescription = txt_CategoryDescription.Text;
                    string CategoryImage = "";
                    string CategoryStatus = DropDownList_Status.SelectedItem.Text;

                    CategoryImage = "~/Uploads/Category/" + FileUpload_Image.FileName;
                    FileUpload_Image.SaveAs(Server.MapPath(CategoryImage));
                    
                    res = tac.Bring_CategoryName(CategoryName);

                    if (res.Count == 0)
                    {

                        tac.Insert(CategoryName, CategoryImage, CategoryDescription, CategoryStatus);

                        Response.Write("<script>alert('User New add correctly');</script>");

                        Response.Redirect("Admin_Categories.aspx");

                        //talog.Insert("Registration of New User by Itself", (string)Session["Username"], System.DateTime.Now);


                    }
                    else
                    {

                        Response.Write("<script>alert('The Name of the Category Already Registered... Try again with other username');</script>");
                        txt_CategoryName.Focus();
                    }

                }
                else
                {

                    Response.Write("<script>alert('Fill in the fields correctly');</script>");

                }

            }
            catch (Exception error)
            {
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alerta", "alert('The following error has occurred:  " + error.Message + " ');", true);
            }
        }

        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Categories.aspx");
        }
    }
}