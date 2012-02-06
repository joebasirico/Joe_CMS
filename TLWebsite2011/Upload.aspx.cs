using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TLWebsite2011
{
	public partial class Upload : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Guid session = new Guid();
			if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				int userID = Auth.checkSession(session);
				if (userID == 0)
					Response.Redirect("404.aspx");
			}
			else
				Response.Redirect("404.aspx");
		}

		protected void UploadBtn_Click(object sender, EventArgs e)
		{
			if (Uploader.HasFile)
			{
				string saveDir = @"Uploads";
				string appPath = Request.PhysicalApplicationPath;

				if (Uploader.HasFile)
				{
					string savePath = appPath + Path.DirectorySeparatorChar + saveDir + Path.DirectorySeparatorChar +
						Server.HtmlEncode(Uploader.FileName);
					Uploader.SaveAs(savePath);

					Message.Visible = true;
					Message.Text = "Your file was uploaded successfully. You can find the file at: <br /><a href=\"/" +
					saveDir + "/" + Uploader.FileName + "\">/" + saveDir + "/" + Uploader.FileName + "</a>";

				}
				else
				{
					Message.Visible = true;
					// Notify the user that a file was not uploaded.
					Message.Text = "You did not specify a file to upload.";
				}
			}
		}
	}
}