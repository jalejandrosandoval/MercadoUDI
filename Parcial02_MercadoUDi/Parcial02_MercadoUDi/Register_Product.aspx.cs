using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Register_Product : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
           new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.ProductTableAdapter tap =
            new MercadoUDi_DataSetTableAdapters.ProductTableAdapter();

        MercadoUDi_DataSet.ProductDataTable res;

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_ProductName.Focus();

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
                if (txt_ProductName.Text != "" && CKEditor_ProductDescription.Text != "" && txt_ProductPrice.Text !="" &&
                    txt_ProductStock.Text != "" && FileUpload_Image.HasFile &&
                    DropDownList_CategoriesProducts.SelectedValue != "")
                {

                    string ProductName = txt_ProductName.Text;
                    string ProductDescription = CKEditor_ProductDescription.Text;
                    string ProductImage = "";
                    int ProductCategory = Convert.ToInt32(DropDownList_CategoriesProducts.SelectedValue.ToString()) ;
                    int ProductPrice = Convert.ToInt32(txt_ProductPrice.Text);
                    int ProductStock = Convert.ToInt32(txt_ProductStock.Text);
                    int ProductCreatedBy_Id = Convert.ToInt32(Session["Id_User"].ToString());

                    ProductImage = "~/Uploads/Product/" + FileUpload_Image.FileName;
                    FileUpload_Image.SaveAs(Server.MapPath(ProductImage));

                    tap.Insert(ProductName, ProductImage, ProductDescription, ProductCategory, ProductStock,
                        ProductPrice, ProductCreatedBy_Id, System.DateTime.Now);
                    
                    Response.Redirect("Admin_Products.aspx");

                    //talog.Insert("Registration of New User by Itself", (string)Session["Username"], System.DateTime.Now);


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
            Response.Redirect("Admin_Products.aspx");
        }
    }
}