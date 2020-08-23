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
    public partial class Config_Client : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSet.UserDataTable res;

        string password = "";
        int id_User = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Id_User"] == null)
            {

                Response.Redirect("Login.aspx");

            }
            else
            {

                if (Convert.ToInt32(Session["User_Type"].ToString()) != 2)
                {

                    Response.Redirect("DefaultAdmin.aspx");

                }
                else
                {
                    id_User = Convert.ToInt32(Session["Id_User"].ToString());

                    if (!IsPostBack)
                    {
                        if (Session["Id_User"] != null)
                        {
                            MercadoUDi_DataSetTableAdapters.UserTableAdapter tau =
                            new MercadoUDi_DataSetTableAdapters.UserTableAdapter();

                            res = tau.GetDataBy_IdUser(id_User);

                            txt_Username.Text = res[0].UserName;
                            txt_Email.Text = res[0].UserEmail;
                            txt_Password.Text = res[0].UserPassword;
                            txt_ConfirmPassword.Text = res[0].UserPassword;

                            if (res[0].UserCard.ToString() != " ")
                            {

                                txt_UserCard.Text = res[0].UserCard.ToString();

                            }
                            else
                            {

                                txt_UserCard.Text = " ";

                            }

                            password = res[0].UserPassword;                          

                            Session["User_PasswordRegisterConfig"] = res[0].UserPassword;

                        }
                    }
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

                if (IsValid)
                {
                    MercadoUDi_DataSetTableAdapters.UserTableAdapter tau =
                        new MercadoUDi_DataSetTableAdapters.UserTableAdapter();

                    string password = "";
                    
                    if (Session["User_PasswordRegisterConfig"].ToString() != txt_Password.Text)
                    {

                        password = Encrypt(txt_Password.Text);

                    }
                    else
                    {

                        password = Session["User_PasswordRegisterConfig"].ToString();

                    }

                    Session["uName_Config"] = txt_Username.Text;
                    Session["uEmail_Config"] = txt_Email.Text;

                    string UserCard = txt_UserCard.Text;

                    tau.Update(Session["uName_Config"].ToString(), 
                        Session["uEmail_Config"].ToString(), 
                        password,
                        Session["User_Status"].ToString(),
                        Convert.ToInt32(Session["User_Type"].ToString()),
                        UserCard, id_User);

                    string script = @"alert('You have updated your information personal..');
                                window.location.href='DefaultAdmin.aspx';";

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                    //talog.Insert("The user updated it personal information byself...", (string)Session["Username"], System.DateTime.Now);

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
            Response.Redirect("DefaultAdmin.aspx");
        }
    }
}