using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FamilyHikes2019
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //make invisible search option
            TextBox searchMaster = (TextBox)Master.FindControl("tbx_search");
            Button buttonMaster = (Button)Master.FindControl("btn_search");
            searchMaster.Visible = false;
            buttonMaster.Visible = false;
        }
        protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e)
        {
            if (Login1.UserName.Contains("@") && Membership.GetUser(Login1.UserName) == null)
            {
                string Username = Membership.GetUserNameByEmail(Login1.UserName);
                if (Username == null)
                    return;

                if (Membership.ValidateUser(Username, Login1.Password) == true)
                {
                    FormsAuthentication.SetAuthCookie(Username, false);
                    FormsAuthentication.RedirectFromLoginPage(Username, false);
                    e.Cancel = true;
                }
            }
        }

        protected void PasswordRecovery1_VerifyingUser(object sender, LoginCancelEventArgs e)
        {
            PasswordRecovery passRecovery = (PasswordRecovery)sender;

            if (Membership.FindUsersByName(passRecovery.UserName).Count == 0)
            {
                // There is no matching user name.  Check if a known email address
                // was entered.  If so, use the user name corresponding to the email address.
                string user = Membership.GetUserNameByEmail(passRecovery.UserName);
                if (user != null)
                    passRecovery.UserName = user;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Login1.Visible = false;
            //log out after sending an email with a new password
            System.Web.Security.FormsAuthentication.SignOut();
        }

        protected void link_lostPassword_Click(object sender, EventArgs e)
        {
            Login1.Visible = false;
            PasswordRecovery1.Visible = true;
            link_lostPassword.Visible = false;
        }

        protected void CancelPushButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);

        }
    }
}