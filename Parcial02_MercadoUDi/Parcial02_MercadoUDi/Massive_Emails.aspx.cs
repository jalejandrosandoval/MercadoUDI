using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Parcial02_MercadoUDi
{
    public partial class Massive_Emails : System.Web.UI.Page
    {
        MercadoUDi_DataSetTableAdapters.LogTableAdapter talog =
            new MercadoUDi_DataSetTableAdapters.LogTableAdapter();

        MercadoUDi_DataSetTableAdapters.UserTableAdapter tau =
            new MercadoUDi_DataSetTableAdapters.UserTableAdapter();

        MercadoUDi_DataSet.UserDataTable res;

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

        protected void btn_SendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_Subject.Text != "" && ListBox_EmailTo.SelectedValue != "" && CKEditor_Message.Text != "")
                {

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587; //587 //25 //465
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential("jhonsandovalmiranda@gmail.com", "3102852214");

                    foreach (ListItem listItem in ListBox_EmailTo.Items)
                    {
                        if (listItem.Selected)
                        {

                            string txt_Usermail = listItem.Text;

                            MailMessage emailMessage = new MailMessage();

                            emailMessage.From = new MailAddress("jhonsandovalmiranda@gmail.com");
                            emailMessage.To.Add(new MailAddress(txt_Usermail));
                            emailMessage.Subject = txt_Subject.Text;
                            emailMessage.Body = CKEditor_Message.Text;

                            try
                            {

                                smtp.Send(emailMessage);

                                string script = @"alert('Emails Sending...');
                                    window.location.href='DefaultAdmin.aspx';";

                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", script, true);

                            }
                            catch (Exception error)
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "alert('email error" + error.Message + "');", true);
                            }

                        }
                    }
                    //talog.Insert("Recover the Password", UserName, System.DateTime.Now);

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