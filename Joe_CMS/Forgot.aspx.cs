﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Joe_CMS
{
	public partial class Forgot : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (null != Page.Request["resetValue"])
			{
				Guid resetValue = new Guid();
				if (Guid.TryParse(Page.Request["resetValue"], out resetValue))
				{
					PasswordReset.Visible = true;
					BeginForm.Visible = false;
				}
			}
		}

		protected void Submit_Click(object sender, EventArgs e)
		{
			try
			{
				//lookup e-mail address
				DataClassesDataContext dc = new DataClassesDataContext();
				User currentUser = dc.Users.FirstOrDefault(u => u.email == eMailAddress.Text);
				if (null != currentUser)
				{
					//create reset value
					Guid resetValue = Guid.NewGuid();
					Auth.CreateResetValue(currentUser, resetValue);

					//send e-mail
					SendEmail(currentUser, resetValue);
				}
				BeginForm.Visible = false;
				EmailSent.Visible = true;
			}
			catch (Exception ex)
			{
				Auth.CreateEvent("Error Sending Forgot Password Mail", ex.ToString(), Request.UserHostAddress);
			}
		}

		protected void Reset_Click(object sender, EventArgs e)
		{
			if (null != Page.Request["resetValue"])
			{
				Guid resetValue = new Guid();
				if (Guid.TryParse(Page.Request["resetValue"], out resetValue))
				{
					if (Password1.Text == Password2.Text)
					{
						//lookup
						int userID = Auth.CheckResetValue(resetValue);
						if (0 != userID)
						{
							//set password
							Auth.UpdatePassword(userID, Auth.GetPBKDF2Digest(Auth.LookupUserName(userID) + Password1.Text));
                                //Auth.ByteToHex(
                                //        SHA512Managed.Create().ComputeHash(
                                //            Encoding.ASCII.GetBytes(Auth.LookupUserName(userID) +
                                //            Auth.getSaltyGoo() + Password1.Text))));
						}

						Guid session = Guid.NewGuid();
						Auth.createSession(userID, session);
						Auth.CreateEvent("Successful Login through password reset", "By user: " + Auth.LookupUserName(userID), Request.UserHostAddress);

						Response.Cookies.Add(new HttpCookie("session", session.ToString()));
                        Response.Cookies["session"].HttpOnly = true;

						//remove the reset value
						Auth.DeleteResetValue(resetValue);

						PasswordReset.Visible = false;
						Success.Visible = true;
					}
					else
					{
						resetMessage.Text = "Both of the passwords must match.";
					}
				}
			}
		}

		private void SendEmail(User currentUser, Guid resetValue)
		{
			string subject = SettingsIO.GetSetting("SiteName") + @" Password Reset";
			string message =
@"Hey {0},

Sorry you lost your password. Never fear though, the link below will help you
reset it. If you can't click the link just copy it and paste the whole thing in your 
browser.

Once you're back on the site, you'll get a chance to enter a new password. 
Don't forget this one! Actually you can reset this as many times as you'd like, so don't
worry too much :-)

In case you forgot your username too that's: {0}

Here's your link:
{1}

--Your friends at {2}

P.S. One last thing. This link will only last for a week, so be sure to reset it as soon as you can.
";
			string link = @"{0}/Forgot.aspx?resetValue={1}";
            link = string.Format(link, HttpContext.Current.Request.Url.Host, resetValue.ToString(), SettingsIO.GetSetting("SiteName"));

			message = string.Format(message, currentUser.UserName, link);

			MailAddress from = new MailAddress(SettingsIO.GetSetting("noReplyEmail"), SettingsIO.GetSetting("SiteName") + " Support");
			MailAddress to = new MailAddress(currentUser.email, currentUser.UserName);

			MailMessage mm = new MailMessage(from, to);
			mm.Subject = subject;
			mm.Body = message;
			mm.BodyEncoding = System.Text.Encoding.ASCII;
			mm.IsBodyHtml = false;

			SmtpClient client = new SmtpClient();
            client.Credentials = new NetworkCredential(SettingsIO.GetSetting("noReplyEmailUser"), SettingsIO.GetSetting("noReplyEmailPass"));
			client.Send(mm);
		}
	}
}