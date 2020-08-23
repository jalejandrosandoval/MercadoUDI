using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Security.Cryptography;


namespace Parcial02_MercadoUDi
{
    public partial class Recover_Password : System.Web.UI.Page
    {

        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.UserTableAdapter tau =
            new MercadoUDi_DataSetTableAdapters.UserTableAdapter();

        MercadoUDi_DataSet.UserDataTable res;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Sing_In_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Register_An_Account_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register_User_Login.aspx");
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

        protected void Btn_RecoverPassword_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_Usermail.Text != "")
                {
                    string UserEmail = txt_Usermail.Text;

                    res = tau.Bring_UserEmail(UserEmail);

                    if (res.Count != 0)
                    {
                        string UserName = res[0].UserName.ToString();

                        string newPassword = "123";

                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587; //587 //25 //465
                        smtp.EnableSsl = true;
                        smtp.Credentials = new System.Net.NetworkCredential("jhonsandovalmiranda@gmail.com", "3102852214");

                        MailMessage emailMessage = new MailMessage();

                        emailMessage.From = new MailAddress("jhonsandovalmiranda@gmail.com");
                        emailMessage.To.Add(new MailAddress(txt_Usermail.Text));
                        emailMessage.Subject = "Reset Password of MercadoUDi";
                        emailMessage.Body = "Hello..." + "\n" +
                                "As requested, your password for our member area has been reset. Your new session details are: " +
                                "\n" + "\n" + "Username:" + UserName + "\n" + "New Password: " + newPassword;

                        int idUser = Convert.ToInt32(res[0].IdUser.ToString());

                        try
                        {

                            smtp.Send(emailMessage);

                            tau.UpdateQueryPassword(Encrypt(newPassword), idUser);

                            string script = @"alert('In a moment you will receive a message with the new password...');
                                window.location.href='Login.aspx';";

                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "alert('Email Sending');", true);
                             

                        }
                        catch (Exception error)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "alert('email error" + error.Message + "');", true);
                        }


                        //talog.Insert("Recover the Password", UserName, System.DateTime.Now);

                    }
                    else
                    {
                        string script = @"alert('The email: " + UserEmail + " does not exist. Try Again...');";

                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                        txt_Usermail.Focus();

                    }
                    
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "alert('Fill in the fields correctly ');", true);

                }

            }
            catch (Exception error)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "alert('The following error has occurred:  " + error.Message + " ');", true);
            }

        }

    }

}