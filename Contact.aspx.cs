using System;
using System.IO; //access to the File class for reading files
using System.Net.Mail; //access to the mail related classes
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FamilyHikes2019
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // for validating contact form fields
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //make invisible search option
            TextBox searchMaster = (TextBox)Master.FindControl("tbx_search");
            Button buttonMaster = (Button)Master.FindControl("btn_search");
            searchMaster.Visible = false;
            buttonMaster.Visible = false;

            //invisible confirm label
            confirm.Visible = false;
           
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string fileName = Server.MapPath("~/App_Data/ContactForm.txt");
                string mailBody = File.ReadAllText(fileName);

                mailBody = mailBody.Replace("<% UserName %>",tbx_name.Text );
                mailBody = mailBody.Replace("<% E-Mail %>", tbx_email.Text);
                mailBody = mailBody.Replace("<% Comment %>", tbx_message.Text);

                MailMessage myMessage = new MailMessage();
                myMessage.Subject = "Response from web site";
                myMessage.Body = mailBody;

                myMessage.From = new MailAddress("contact@familyhikes.com", "Sender Name");
                myMessage.To.Add(new MailAddress("contact@familyhikes.com", "Receiver Name"));
                myMessage.ReplyToList.Add(new MailAddress(tbx_email.Text));

                SmtpClient mySmtpClient = new SmtpClient();
                mySmtpClient.Send(myMessage);
                FormTable.Visible = false;
                confirm.Visible = true;
             }
        }
    }
}