using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Update_Category : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.CategoryTableAdapter tac =
            new MercadoUDi_DataSetTableAdapters.CategoryTableAdapter();

        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSet.CategoryDataTable res;

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

                if (Request.Params["IdCat"] != null)
                {

                    if (!IsPostBack)
                    {

                        int idCat = Convert.ToInt32(Request.Params["IdCat"].ToString());

                        res = tac.GetDataBy_IdCategory(idCat);

                        txt_CategoryName.Text = res[0].CategoryName.ToString();

                        string CategoryImage = res[0].CategoryImage.ToString();
                        Image_Category.ImageUrl = CategoryImage;

                        txt_CategoryDescription.Text = res[0].CategoryDescription.ToString();
                        DropDownList_Status.Text = res[0].CategoryStatus.ToString();

                    }

                }

            }
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {

            try
            {

                if (txt_CategoryName.Text != "" && txt_CategoryDescription.Text != "" && DropDownList_Status.SelectedValue != "")
                {                    
                    int idCategory = Convert.ToInt32(Request.Params["IdCat"].ToString());

                    res = tac.GetDataBy_IdCategory(idCategory);

                    string CategoryName = txt_CategoryName.Text;
                    string CategoryDescription = txt_CategoryDescription.Text;
                    string CategoryImageUpdate = "";
                    string CategoryStatus = DropDownList_Status.SelectedItem.Text;

                    if (FileUpload_Image.HasFile)
                    {

                        CategoryImageUpdate = "~/Uploads/Category/" + FileUpload_Image.FileName;
                        FileUpload_Image.SaveAs(Server.MapPath(CategoryImageUpdate));

                    }
                    else
                    {

                        CategoryImageUpdate = res[0].CategoryImage.ToString();

                    }                   


                    tac.Update(txt_CategoryName.Text, CategoryImageUpdate, txt_CategoryDescription.Text,
                        DropDownList_Status.SelectedItem.Text, idCategory);
                    
                    string script = @"alert('Information of Category Updated');
                            window.location.href='Admin_Categories.aspx';";

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                    //talog.Insert("Update User", (string)Session["Username"], System.DateTime.Now);

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