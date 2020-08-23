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
    public partial class Login : System.Web.UI.Page
    {

        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.UserTableAdapter tau =
            new MercadoUDi_DataSetTableAdapters.UserTableAdapter();

        MercadoUDi_DataSet.UserRow currentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_Username.Focus();
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


        protected void Btn_StartSession_Click(object sender, EventArgs e)
        {
            MercadoUDi_DataSet.UserDataTable res;

            try
            {
                if (IsValid)
                {

                    res = tau.Login(txt_Username.Text, Encrypt(txt_Password.Text));
                    //res = tau.Login(txt_EmailUser.Text, txt_Password.Text);

                    if (res.Count != 0)
                    {
                        currentUser = res[0];

                        Session["Id_User"] = currentUser.IdUser.ToString();
                        Session["Username"] = currentUser.UserName.ToString();
                        Session["UserEmail"] = currentUser.UserEmail.ToString();
                        Session["Password"] = currentUser.UserPassword.ToString();
                        Session["User_Type"] = currentUser.UserType.ToString();
                        Session["User_NumberCard"] = currentUser.UserCard.ToString();
                        Session["User_Status"] = currentUser.UserStatus.ToString();

                        //talog.Insert("Start Session", Session["Username"].ToString(), System.DateTime.Now);

                        if (currentUser.UserType == 1)
                        {

                            //HOME ADMIN
                            Response.Redirect("DefaultAdmin.aspx");

                        }
                        else
                        {

                            //HOME CLIENT

                            Response.Redirect("DefaultClient.aspx");

                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('User Not Found! In the System...');</script>");

                        txt_Username.Text = "";
                        txt_Password.Text = "";

                    }

                }
                else
                {
                    Response.Write("<script>alert('Incorrect Data...');</script>");

                    txt_Username.Text = "";
                    txt_Password.Text = "";

                }

            }
            catch (Exception error)
            {
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alerta", "alert('The following error has occurred:  " + error.Message + " ');", true);
            }

        }

        protected void Recover_Password_Click(object sender, EventArgs e)
        {
            Response.Redirect("Recover_Password.aspx");
        }

        protected void Register_An_Account_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register_User_Login.aspx");
        }
    }
}