using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial02_MercadoUDi
{
    public partial class Update_Products : System.Web.UI.Page
    {

        MercadoUDi_DataSetTableAdapters.ProductTableAdapter tap =
            new MercadoUDi_DataSetTableAdapters.ProductTableAdapter();

        MercadoUDi_DataSet.ProductDataTable res;

        int idcat;
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

                if (Request.Params["IdPro"] != null)
                {

                    if (!IsPostBack)
                    {

                        int idPro = Convert.ToInt32(Request.Params["IdPro"].ToString());

                        res = tap.GetDataBy_IdProduct(idPro);
                        idcat = Convert.ToInt32(res[0].ProductCategory.ToString());

                        txt_ProductName.Text = res[0].ProductName.ToString();

                        string ProductImage = res[0].ProductImage.ToString();
                        Image_Product.ImageUrl = ProductImage;

                        DropDownList_CategoriesProducts.Text = res[0].ProductCategory.ToString();
                        txt_ProductPrice.Text = res[0].ProductPrice.ToString();
                        txt_ProductStock.Text = res[0].ProductStock.ToString();
                        CKEditor_ProductDescription.Text = res[0].ProductDescription.ToString();

                    }
                }

            }
        }

        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products_By_Category_Update.aspx?IdCat=" + idcat);
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            try
            {

                if (txt_ProductName.Text != "" && CKEditor_ProductDescription.Text != "" && txt_ProductPrice.Text != "" &&
                    txt_ProductStock.Text != "" && DropDownList_CategoriesProducts.SelectedValue != "")
                {
                    int IdPro = Convert.ToInt32(Request.Params["IdPro"].ToString());

                    res = tap.GetDataBy_IdProduct(IdPro);

                    string ProductName = txt_ProductName.Text;
                    string ProductDescription = CKEditor_ProductDescription.Text;
                    string productImageUpdate = "";
                    int ProductCategory = Convert.ToInt32(DropDownList_CategoriesProducts.SelectedValue.ToString());
                    int ProductPrice = Convert.ToInt32(txt_ProductPrice.Text);
                    int ProductStock = Convert.ToInt32(txt_ProductStock.Text);
                    int ProductCreatedBy_Id = Convert.ToInt32(Session["Id_User"].ToString());
                    DateTime productCreatedAt = Convert.ToDateTime(res[0].ProductCreatedAt.ToString());

                    if (FileUpload_Image.HasFile)
                    {

                        productImageUpdate = "~/Uploads/Product/" + FileUpload_Image.FileName;
                        FileUpload_Image.SaveAs(Server.MapPath(productImageUpdate));

                    }
                    else
                    {

                        productImageUpdate = res[0].ProductImage.ToString();

                    }


                    tap.Update(ProductName, productImageUpdate, ProductDescription, ProductCategory,
                        ProductStock, ProductPrice, ProductCreatedBy_Id, productCreatedAt, IdPro);

                    Response.Redirect("Products_By_Category_Update.aspx?IdCat=" + ProductCategory);

                    Response.Write("<script>alert('Information of this Product Updated');</script>");

                    /*string script = @"alert('Information of this Product Updated');
                            window.location.href = 'Products_By_Category_Update.aspx?IdPro='"+ IdPro+" ;";*/

                    //string script = @"alert('Information of this Product Updated');";

                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

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

    }
}