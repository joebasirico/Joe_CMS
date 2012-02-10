using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace Joe_CMS
{
	public partial class UploadedFiles : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			string saveDir = @"Uploads";
			string appPath = Request.PhysicalApplicationPath;
			string realPath = appPath + Path.DirectorySeparatorChar + saveDir;

			DataTable dt = new DataTable();
			dt.Columns.Add("File");
			dt.Columns.Add("Type");
			dt.Columns.Add("Path");

			foreach (string file in Directory.GetFiles(realPath))
			{
				DataRow dr = dt.NewRow();
				dr["File"] = Path.GetFileName(file);
				dr["Type"] = Path.GetExtension(file);
				dr["Path"] = "<a href=\"/" +
					saveDir + "/" + Path.GetFileName(file) + "\">/" + saveDir + "/" + Path.GetFileName(file) + "</a>";
				dt.Rows.Add(dr);
			}

			FileList.DataSource = dt;
			FileList.DataBind();
		}
	}
}