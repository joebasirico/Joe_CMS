﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text.RegularExpressions;
using TidyNet;
using System.IO;
using System.Text;

namespace Joe_CMS
{
	public class NewsIO
	{
		public int ID = -1;
		public string Title = "";
		public string Body = "";
		public DateTime Updated = new DateTime();
		public int UpdatedBy = -1;
		public bool wasTruncated = false;
		DataClassesDataContext dc = new DataClassesDataContext();

		public NewsIO(int id)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("GetNewsByID", conn);
				command.Parameters.AddWithValue("@NewsID", id);
				command.CommandType = CommandType.StoredProcedure;
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					ID = reader.GetInt32(0);
					Title = reader.GetString(1);
					Body = reader.GetString(2);
					Updated = reader.GetDateTime(3);
					UpdatedBy = reader.GetInt32(4);
				}
			}
		}

		public NewsIO(string title, string body, DateTime updated, int updatedBy)
		{
			Title = title;
			Body = body;
			Updated = updated;
			UpdatedBy = updatedBy;
		}

		public void Save()
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
			{
				SqlCommand command = new SqlCommand("", conn);
				conn.Open();
				command.Parameters.AddWithValue("@Title", Title);
				command.Parameters.AddWithValue("@Body", Body);
				command.Parameters.AddWithValue("@Updated", Updated);
				command.Parameters.AddWithValue("@UpdatedBy", UpdatedBy);

                command.CommandType = CommandType.StoredProcedure;

				if (null == dc.NewsItems.FirstOrDefault(n => n.ID == ID))
				{
					command.CommandText = "CreateNews";
                    SqlDataReader dr = command.ExecuteReader();

                    while (dr.Read())
                    {
                        ID = Convert.ToInt32(dr[0]);
                    }
                }
				else
				{
					command.CommandText = "UpdateNews";
					command.Parameters.AddWithValue("@ID", ID);
                    command.ExecuteNonQuery();
				}
			}
		}

		public static List<NewsIO> GetRecentNews(int count, bool showFutureEvents)
		{
			List<NewsIO> news = new List<NewsIO>();

			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("GetRecentNews", conn);
				command.Parameters.AddWithValue("@Count", count);
                command.Parameters.AddWithValue("@ShowFutureEvents", showFutureEvents);
				command.CommandType = CommandType.StoredProcedure;
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					NewsIO n = new NewsIO(reader.GetString(1), reader.GetString(2),
						reader.GetDateTime(3), reader.GetInt32(4));
					n.ID = reader.GetInt32(0);
					if(showFutureEvents || n.Updated < DateTime.Now)
						news.Add(n);
				}
			}
			return news;
		}

		public static void DeleteNews(int id)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("DeleteNews", conn);
				command.Parameters.AddWithValue("@ID", id);
				command.CommandType = CommandType.StoredProcedure;
				command.ExecuteNonQuery();
			}
		}

		public bool GetBodyAsHTML(int truncateChars, out string HTMLBody)
		{
			Markdown m = new Markdown();
			if (-1 == truncateChars || Body.Length <= truncateChars)
			{
				HTMLBody = TidyItUp(m.Transform(Body));
				return false;
			}
			else
			{
                HTMLBody = TidyItUp(m.Transform(Body).Substring(0, truncateChars) + " ...");
				return true;
			}
		}

		public bool GetBodyAsPlainText(int truncateChars, out string PlainBody)
		{
			string HTMLBody = "";
			GetBodyAsHTML(-1, out HTMLBody);
			string body = Regex.Replace(HTMLBody, @"<(.|\n)*?>", string.Empty);

			if (-1 == truncateChars || body.Length <= truncateChars)
			{
				PlainBody = body;
				return false;
			}
			else
			{
				PlainBody = body.Substring(0, truncateChars);
				return true;
			}

		}

        private string TidyItUp(string malformed)
        {
            Tidy tidy = new Tidy();
            tidy.Options.DocType = DocType.Omit;
            tidy.Options.DropFontTags = true;
            tidy.Options.LogicalEmphasis = true;
            tidy.Options.Xhtml = false;
            tidy.Options.XmlOut = false;
            tidy.Options.MakeClean = true;
            tidy.Options.TidyMark = false;
            tidy.Options.QuoteNbsp = false;
            tidy.Options.NumEntities = true;
            tidy.Options.EncloseText = false;
            tidy.Options.CharEncoding = CharEncoding.UTF8;

            TidyMessageCollection tmc = new TidyMessageCollection();
            MemoryStream input = new MemoryStream();
            MemoryStream output = new MemoryStream();

            byte[] bytes = Encoding.UTF8.GetBytes(malformed);
            input.Write(bytes, 0, bytes.Length);
            input.Position = 0;
            tidy.Parse(input, output, tmc);

            string result = Encoding.UTF8.GetString(output.ToArray());

            if (result.Contains("<body>"))
                result = result.Remove(0, result.IndexOf("<body>", StringComparison.CurrentCultureIgnoreCase) + 7); //result.LastIndexOf("</body>")).Substring(result.IndexOf("<body>") + 7).Trim();
            if (result.Contains("</body>"))
                result = result.Remove(result.LastIndexOf("</body>", StringComparison.CurrentCultureIgnoreCase));//result.LastIndexOf("</body>")).Substring(result.IndexOf("<body>") + 7).Trim();

            return result;
        }
	}
}