<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using TLWebsite2011.Properties;
using System.Text;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;

namespace TLWebsite2011
{
	public partial class Register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void DoRegister_Click(object sender, EventArgs e)
		{
			try
			{
				if (RegCode.Text == Settings.Default.RegCode)
				{
					if (!Auth.UserExists(UsernameBox.Text))
					{
						DataClassesDataContext dc = new DataClassesDataContext();
						if (null == dc.Users.FirstOrDefault(u => u.email == email.Text))
						{
							if (!new Regex(Settings.Default.UsernameRegex).IsMatch(UsernameBox.Text))
								Message.Text = Settings.Default.UsernameFailedMatchMessage;
							else
							{
								if (!new Regex(Settings.Default.emailRegex).IsMatch(email.Text))
									Message.Text = Settings.Default.EmailFailedMatchMessage;
								else
								{
									//Add the user
									Auth.registerUser(UsernameBox.Text,
										Auth.ByteToHex(
											SHA512Managed.Create().ComputeHash(
												Encoding.ASCII.GetBytes(UsernameBox.Text + Auth.getSaltyGoo() + PasswordBox.Text))), email.Text);
									//Log the event
									Auth.CreateEvent("Created User", "UserName: " + UsernameBox.Text + "\r\n", Request.UserHostAddress);

									//Login the new user 
									//check the user has been created properly
									int userID = Auth.checkCredentials(UsernameBox.Text,
												Auth.ByteToHex(
													SHA512Managed.Create().ComputeHash(
														Encoding.ASCII.GetBytes(UsernameBox.Text + Auth.getSaltyGoo() + PasswordBox.Text))));

									//if the user is valid and the creds are still good log them in and give them a cookie yum!
									if (userID != 0)
									{
										Guid session = Guid.NewGuid();
										Auth.createSession(userID, session);
										Auth.CreateEvent("Successful Login", "By user: " + UsernameBox.Text, Request.UserHostAddress);
										Response.Cookies.Add(new HttpCookie("session", session.ToString()));

										//Change the UI to reflect everytihng went well
										RegisterPanel.Visible = false;
										RegistrationCompletePanel.Visible = true;

										//send them a welcome email!
										if (Settings.Default.SendWelcomeMail)
											SendEmail(UsernameBox.Text, email.Text);
									}
									else
									{
										Auth.CreateEvent("Failed Login Attempt", "By user: " + UsernameBox.Text, Request.UserHostAddress);
										RegisterPanel.Visible = false;
										ErrorPanel.Visible = true;
									}
								}
							}
						}
						else
							Message.Text = "That email address is already in use. If you have a user and you forgot your password you can try the <a href=\"Forgot.aspx\"> page to retrieve it.";
					}
					else
						Message.Text = "That username is already in use, please select another.";
				}
				else
					Message.Text = "Invalid Registration Code. Type is carefully, it is also case sensitive.";
			}
			catch (Exception ex)
			{
				Message.Text = "Sorry, you couldn't be registered because: " + Server.HtmlEncode(ex.Message);
				Auth.CreateEvent("Could not Register:" + ex.Message, ex.ToString(), Request.UserHostAddress);
			}
		}

		private void SendEmail(string Username, string email)
		{
			string subject = @"Registered on the TL Website!";
			string message =
@"Hi there {0}!

You have successfully registered for the Technically Learning Website

The username you chose was: {0}

--Joe
";

			message = string.Format(message, Username);

			MailAddress from = new MailAddress(Settings.Default.emailUser, "Technically Learning");
			MailAddress to = new MailAddress(email, Username);

			MailMessage mm = new MailMessage(from, to);
			mm.Subject = subject;
			mm.Body = message;
			mm.BodyEncoding = System.Text.Encoding.ASCII;
			mm.IsBodyHtml = false;

			SmtpClient client = new SmtpClient();
			client.Credentials = new NetworkCredential(Settings.Default.emailUser, Settings.Default.emailPass);
			client.Send(mm);
		}
	}
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using TLWebsite2011.Properties;
using System.Text;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;

namespace TLWebsite2011
{
	public partial class Register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            Page.Title = "Register";
		}

		protected void DoRegister_Click(object sender, EventArgs e)
		{
			try
			{
				if (RegCode.Text == Settings.Default.RegCode)
				{
					if (!Auth.UserExists(UsernameBox.Text))
					{
						DataClassesDataContext dc = new DataClassesDataContext();
						if (null == dc.Users.FirstOrDefault(u => u.email == email.Text))
						{
							if (!new Regex(Settings.Default.UsernameRegex).IsMatch(UsernameBox.Text))
								Message.Text = Settings.Default.UsernameFailedMatchMessage;
							else
							{
								if (!new Regex(Settings.Default.emailRegex).IsMatch(email.Text))
									Message.Text = Settings.Default.EmailFailedMatchMessage;
								else
								{
									//Add the user
									Auth.registerUser(UsernameBox.Text,
										Auth.ByteToHex(
											SHA512Managed.Create().ComputeHash(
												Encoding.ASCII.GetBytes(UsernameBox.Text + Auth.getSaltyGoo() + PasswordBox.Text))), email.Text);
									//Log the event
									Auth.CreateEvent("Created User", "UserName: " + UsernameBox.Text + "\r\n", Request.UserHostAddress);

									//Login the new user 
									//check the user has been created properly
									int userID = Auth.checkCredentials(UsernameBox.Text,
												Auth.ByteToHex(
													SHA512Managed.Create().ComputeHash(
														Encoding.ASCII.GetBytes(UsernameBox.Text + Auth.getSaltyGoo() + PasswordBox.Text))));

									//if the user is valid and the creds are still good log them in and give them a cookie yum!
									if (userID != 0)
									{
										Guid session = Guid.NewGuid();
										Auth.createSession(userID, session);
										Auth.CreateEvent("Successful Login", "By user: " + UsernameBox.Text, Request.UserHostAddress);
										Response.Cookies.Add(new HttpCookie("session", session.ToString()));

										//Change the UI to reflect everytihng went well
										RegisterPanel.Visible = false;
										RegistrationCompletePanel.Visible = true;

										//send them a welcome email!
										if (Settings.Default.SendWelcomeMail)
											SendEmail(UsernameBox.Text, email.Text);
									}
									else
									{
										Auth.CreateEvent("Failed Login Attempt", "By user: " + UsernameBox.Text, Request.UserHostAddress);
										RegisterPanel.Visible = false;
										ErrorPanel.Visible = true;
									}
								}
							}
						}
						else
							Message.Text = "That email address is already in use. If you have a user and you forgot your password you can try the <a href=\"Forgot.aspx\"> page to retrieve it.";
					}
					else
						Message.Text = "That username is already in use, please select another.";
				}
				else
					Message.Text = "Invalid Registration Code. Type is carefully, it is also case sensitive.";
			}
			catch (Exception ex)
			{
				Message.Text = "Sorry, you couldn't be registered because: " + Server.HtmlEncode(ex.Message);
				Auth.CreateEvent("Could not Register:" + ex.Message, ex.ToString(), Request.UserHostAddress);
			}
		}

		private void SendEmail(string Username, string email)
		{
			string subject = @"Registered on the TL Website!";
			string message =
@"Hi there {0}!

You have successfully registered for the Technically Learning Website

The username you chose was: {0}

--Joe
";

			message = string.Format(message, Username);

			MailAddress from = new MailAddress(Settings.Default.emailUser, "Technically Learning");
			MailAddress to = new MailAddress(email, Username);

			MailMessage mm = new MailMessage(from, to);
			mm.Subject = subject;
			mm.Body = message;
			mm.BodyEncoding = System.Text.Encoding.ASCII;
			mm.IsBodyHtml = false;

			SmtpClient client = new SmtpClient();
			client.Credentials = new NetworkCredential(Settings.Default.emailUser, Settings.Default.emailPass);
			client.Send(mm);
		}
	}
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
}