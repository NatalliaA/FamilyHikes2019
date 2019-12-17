using System;
using System.Data.OleDb;
using System.Configuration;
using System.Net.Mail;
using System.IO;// access to the File class for reading the file
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace FamilyHikes2019
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
            //make invisible search option
            TextBox searchMaster = (TextBox)Master.FindControl("tbx_search");
            Button buttonMaster = (Button)Master.FindControl("btn_search");
            searchMaster.Visible = false;
            buttonMaster.Visible = false;
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false);
           String continueUrl = RegisterUser.ContinueDestinationPageUrl;
       if(string.IsNullOrEmpty(continueUrl))

          { continueUrl = "~/"; }

            //adding a record to the UserProfile table

            //make a connection with database using OleDbConnection class
            string scon = ConfigurationManager.ConnectionStrings["Hikes2019ConnectionString"].ConnectionString;
            OleDbConnection oleDbConn = new OleDbConnection(scon);

            //creating a string with temporary values for security 'injection attacks'
            String SqlString = "INSERT INTO HikerProfile(HikerName) Values (@name)";
          

            //prepare command using OleDbCommand class 
            OleDbCommand cmd = new OleDbCommand(SqlString, oleDbConn);
            cmd.CommandType = CommandType.Text;
            oleDbConn.Open();
            cmd.Parameters.AddWithValue("@name", RegisterUser.UserName);
            cmd.ExecuteNonQuery();


            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "Your new account at FamilyHikes";
            myMessage.Body = "Hello " + RegisterUser.UserName.ToString() + ", "
                + Environment.NewLine + "" + Environment.NewLine +
                "Thank you for signing up for a new account at www.FamilyHikes.com ." +
               Environment.NewLine + "" + Environment.NewLine +
                "To log in to the site, please use the following details:" +
               Environment.NewLine + "" + Environment.NewLine +
               "User Name: " + RegisterUser.UserName.ToString() + ""
                + Environment.NewLine + "Password: " + RegisterUser.Password.ToString() + ""
                + Environment.NewLine + "" + Environment.NewLine + "Happy trails!"
                + Environment.NewLine + "" + Environment.NewLine + "The FamilyHikes Team";

            myMessage.From = new MailAddress("natallia.akulenka@gmail.com", "FamilyHikes");
            myMessage.To.Add(new MailAddress(RegisterUser.Email.ToString(), RegisterUser.UserName.ToString()));

            SmtpClient mySmtpClient = new SmtpClient();
            mySmtpClient.Send(myMessage);

            Response.Redirect("~/EditProfile.aspx");
        }
    }
}