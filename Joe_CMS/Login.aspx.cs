using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Threading;

namespace Joe_CMS
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (userID != 0)
            {
                LoginPanel.Visible = false;
                AlreadyLoggedIn.Visible = true;
            }

            if (string.IsNullOrWhiteSpace(SettingsIO.GetSetting("AuthCode")))
                AuthCodeCheck.Visible = false;


            String scriptName = "SetFocusScript";
            Type scriptType = this.GetType();

            ClientScriptManager cs = Page.ClientScript;
            if (!cs.IsStartupScriptRegistered(scriptType, scriptName))
            {
                StringBuilder setUserNameFocus = new StringBuilder();

                setUserNameFocus.Append("<script language='Javascript'> function setfocus(){");
                setUserNameFocus.Append("document.getElementById(\"" +
                UsernameBox.ClientID + "\").focus();");
                setUserNameFocus.Append("} setfocus();</script>");

                cs.RegisterStartupScript(scriptType, scriptName, setUserNameFocus.ToString());
            }
        }

        protected void DoLogin_Click(object sender, EventArgs e)
        {
            try
            {
                int userID = 0;

                userID = Auth.checkCredentials(UsernameBox.Text,
                                    Auth.ByteToHex(
                                        SHA512Managed.Create().ComputeHash(
                                            Encoding.ASCII.GetBytes(UsernameBox.Text + Auth.getSaltyGoo() + PasswordBox.Text))));

                if (userID != 0)
                {
                    Guid session = Guid.NewGuid();
                    Auth.createSession(userID, session);
                    Auth.CreateEvent("Successful Login", "By user: " + UsernameBox.Text, Request.UserHostAddress);

                    Response.Cookies.Add(new HttpCookie("session", session.ToString()));
                    if (RememberMe.Checked)
                        Response.Cookies["session"].Expires = DateTime.Now.AddMonths(1);


                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Message.Text = "Incorrect username or password, please try again.<br/>";
                    Auth.CreateEvent("Failed Login Attempt", "By user: " + UsernameBox.Text, Request.UserHostAddress);
                }
            }
            catch (ThreadAbortException)
            {

            }
            catch (Exception ex)
            {
                Message.Text = "Sorry, you couldn't be logged in because: " + Server.HtmlEncode(ex.Message);
                Auth.CreateEvent("Could not log user in" + ex.Message, ex.ToString(), Request.UserHostAddress);
            }
        }
    }
}