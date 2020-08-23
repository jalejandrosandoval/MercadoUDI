using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

namespace Parcial02_MercadoUDi
{
    public partial class Register_User : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
           new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.UserTableAdapter tau =
                new MercadoUDi_DataSetTableAdapters.UserTableAdapter();

        MercadoUDi_DataSet.UserDataTable res;

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_Username.Focus();

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

        public string Encrypt(string cadena)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider(); //OBJETO DE TIPO MD5
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(cadena)); //ENCRIPTAR LA CADENA EN ASCII

            byte[] resEncriptacion = md5.Hash; //HASH => ALGORITMO CRIPTOGRAFICO

            StringBuilder str = new StringBuilder(); //STRINGS LARGOS 

            for (int i = 0; i < resEncriptacion.Length; i++)
            {
                str.Append(resEncriptacion[i].ToString("x"));
                //AGREGA TEXTO AL FINAL 
            }

            return str.ToString();
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            try
            {

                if (txt_Username.Text != "" && txt_Password.Text != "" && txt_ConfirmPassword.Text != "" && txt_Email.Text != "")
                {
                    string username = txt_Username.Text;
                    string password = txt_Password.Text;
                    string confirm = txt_ConfirmPassword.Text;
                    string usercard = txt_UserCard.Text;

                    res = tau.Bring_Username(username);

                    if (res.Count == 0)
                    {
                        password = Encrypt(txt_Password.Text);

                        tau.Insert(txt_Username.Text, txt_Email.Text, password, "Active", 2, usercard);

                        string script = @"alert('User New add correctly...');
                            window.location.href='Admin_Users.aspx';";

                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                        //talog.Insert("Registration of New User by Itself", (string)Session["Username"], System.DateTime.Now);

                    }
                    else
                    {

                        Response.Write("<script>alert('Username Already Registered... Try again with other username');</script>");
                        txt_Username.Focus();
                    }

                }
                else
                {

                    Response.Write("<script>alert('Fill in the fields correctly');</script>");

                    txt_Username.Text = "";
                    txt_ConfirmPassword.Text = "";
                    txt_Password.Text = "";
                    txt_UserCard.Text = "";

                }

            }
            catch (Exception error)
            {
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alerta", "alert('The following error has occurred:  " + error.Message + " ');", true);
            }

        }


        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Users.aspx");
        }
    }
}