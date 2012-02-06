<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TLWebsite2011
{
	public partial class UploadDelete : System.Web.UI.Page
	{
		string file = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			Guid session = new Guid();
			if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				int userID = Auth.checkSession(session);
				if (userID != 0)
				{
					if (Request.QueryString.Keys.Count > 0
									&& !string.IsNullOrEmpty(Request.QueryString["file"]))
					{
						file = Request.QueryString["file"];
						string saveDir = "Uploads";
						string appPath = Request.PhysicalApplicationPath;
						string suggestedPath = appPath + saveDir +
							Path.DirectorySeparatorChar + file;
						string realPath = Path.GetFullPath(suggestedPath);

						if (!string.IsNullOrEmpty(file) && suggestedPath == realPath && File.Exists(realPath))
						{
							FileName.Text = Server.HtmlEncode(file);
						}
						else
						{
							ToDelete.Visible = false;
							Message.Visible = true;
							Message.Text = "Could not find file. Please return to <a href=\"UploadedFiles.aspx\">Uploads</a>.";
						}
					}
					else
					{
						ToDelete.Visible = false;
						Message.Visible = true;
						Message.Text = "Could not find file. Please return to <a href=\"UploadedFiles.aspx\">Uploads</a>.";
					}
				}
				else
					Response.Redirect("404.aspx");
			}
			else
				Response.Redirect("404.aspx");
		}

		protected void Delete_Click(object sender, EventArgs e)
		{
			string saveDir = "Uploads";
			string appPath = Request.PhysicalApplicationPath;
			string suggestedPath = appPath + saveDir +
				Path.DirectorySeparatorChar + file;
			string realPath = Path.GetFullPath(suggestedPath);

			if (suggestedPath == realPath && File.Exists(realPath))
			{
				File.Delete(realPath);
				ToDelete.Visible = false;
				Finished.Visible = true;
			}
			else
			{
				ToDelete.Visible = false;
				Message.Visible = true;
				Message.Text = "Could not find file. Please return to <a href=\"UploadedFiles.aspx\">Uploads</a>.";
			}
		}
	}
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TLWebsite2011
{
	public partial class UploadDelete : System.Web.UI.Page
	{
		string file = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			Guid session = new Guid();
			if (Request.Cookies["session"] != null && Guid.TryParse(Request.Cookies["session"].Value, out session))
			{
				int userID = Auth.checkSession(session);
				if (userID != 0)
				{
					if (Request.QueryString.Keys.Count > 0
									&& !string.IsNullOrEmpty(Request.QueryString["file"]))
					{
						file = Request.QueryString["file"];
						string saveDir = "Uploads";
						string appPath = Request.PhysicalApplicationPath;
						string suggestedPath = appPath + saveDir +
							Path.DirectorySeparatorChar + file;
                        Page.Title = "Delete " + file +"?";
						string realPath = Path.GetFullPath(suggestedPath);

						if (!string.IsNullOrEmpty(file) && suggestedPath == realPath && File.Exists(realPath))
						{
							FileName.Text = Server.HtmlEncode(file);
						}
						else
						{
							ToDelete.Visible = false;
							Message.Visible = true;
							Message.Text = "Could not find file. Please return to <a href=\"UploadedFiles.aspx\">Uploads</a>.";
						}
					}
					else
					{
						ToDelete.Visible = false;
						Message.Visible = true;
						Message.Text = "Could not find file. Please return to <a href=\"UploadedFiles.aspx\">Uploads</a>.";
					}
				}
				else
					Response.Redirect("404.aspx");
			}
			else
				Response.Redirect("404.aspx");
		}

		protected void Delete_Click(object sender, EventArgs e)
		{
			string saveDir = "Uploads";
			string appPath = Request.PhysicalApplicationPath;
			string suggestedPath = appPath + saveDir +
				Path.DirectorySeparatorChar + file;
			string realPath = Path.GetFullPath(suggestedPath);

			if (suggestedPath == realPath && File.Exists(realPath))
			{
				File.Delete(realPath);
				ToDelete.Visible = false;
				Finished.Visible = true;
			}
			else
			{
				ToDelete.Visible = false;
				Message.Visible = true;
				Message.Text = "Could not find file. Please return to <a href=\"UploadedFiles.aspx\">Uploads</a>.";
			}
		}
	}
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
}