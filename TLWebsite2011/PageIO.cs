using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text.RegularExpressions;

namespace Joe_CMS
{
    public class PageIO
    {
        public int ID = -1;
        public string Title = "";
        public string SubTitle = "";
        public string URLTitle = "";
        public string Body = "";
        public DateTime Updated = new DateTime();
        public string ContentType = "";
        public int UpdatedBy = -1;
        public bool IsDraft = false;

        public PageIO(string urlTitle)
        {
            URLTitle = urlTitle;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("GetRecentPage", conn);
                command.Parameters.AddWithValue("@URLTitle", URLTitle);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ID = reader.GetInt32(0);
                    Title = reader.GetString(1);
                    SubTitle = reader.GetString(2);
                    Body = reader.GetString(4);
                    Updated = reader.GetDateTime(5);
                    ContentType = reader.GetString(6);
                    UpdatedBy = reader.GetInt32(7);
                    IsDraft = reader.GetBoolean(8);
                }
            }
        }

        public PageIO(string urlTitle, DateTime date)
        {
            URLTitle = urlTitle;
            Updated = date;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("GetPageVersion", conn);
                command.Parameters.AddWithValue("@URLTitle", URLTitle);
                command.Parameters.AddWithValue("@Updated", date);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ID = reader.GetInt32(0);
                    Title = reader.GetString(1);
                    SubTitle = reader.GetString(2);
                    Body = reader.GetString(4);
                    ContentType = reader.GetString(6);
                    UpdatedBy = reader.GetInt32(7);
                    IsDraft = reader.GetBoolean(8);
                }
            }
        }

        public PageIO(string title, string subTitle, string urlTitle, string body,
            DateTime updated, string contentType, int updatedBy, bool isDraft)
        {
            Title = title;
            SubTitle = subTitle;
            URLTitle = urlTitle;
            Body = body;
            Updated = updated;
            ContentType = contentType;
            UpdatedBy = updatedBy;
            IsDraft = isDraft;
        }

        public static string GetResolvedURLText(string url)
        {
            return url.Replace(' ', '-').ToLower();
        }

        public void SavePage()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("CreatePage", conn);
                command.Parameters.AddWithValue("@Title", Title);
                command.Parameters.AddWithValue("@SubTitle", SubTitle);
                command.Parameters.AddWithValue("@URLTitle", URLTitle);
                command.Parameters.AddWithValue("@Body", Body);
                command.Parameters.AddWithValue("@Updated", System.DateTime.Now);
                command.Parameters.AddWithValue("@ContentType", ContentType);
                command.Parameters.AddWithValue("@IsDraft", IsDraft);
                command.Parameters.AddWithValue("@UpdatedBy", UpdatedBy);
                command.CommandType = CommandType.StoredProcedure;
                command.ExecuteNonQuery();
            }
        }

        public void SavePage(DateTime UpdatedOverride)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("CreatePage", conn);
                command.Parameters.AddWithValue("@Title", Title);
                command.Parameters.AddWithValue("@SubTitle", SubTitle);
                command.Parameters.AddWithValue("@URLTitle", URLTitle);
                command.Parameters.AddWithValue("@Body", Body);
                command.Parameters.AddWithValue("@Updated", UpdatedOverride);
                command.Parameters.AddWithValue("@ContentType", ContentType);
                command.Parameters.AddWithValue("@IsDraft", IsDraft);
                command.CommandType = CommandType.StoredProcedure;
                command.ExecuteNonQuery();
            }
        }

        public string GetBodyAsHTML()
        {
            switch (ContentType)
            {
                case "PlainText":
                    return Body.Replace("\n", "<br />");
                case "HTML":
                    return Body;
                case "Markdown":
                    Markdown m = new Markdown();
                    return m.Transform(Body);
                default: //assume HTML
                    return Body;
            }
        }

        public string GetBodyAsPlaintext()
        {
            return Regex.Replace(GetBodyAsHTML(), @"<(.|\n)*?>", string.Empty);
        }

        public List<PageIO> GetHistory()
        {
            List<PageIO> pages = new List<PageIO>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("GetPageHistory", conn);
                command.Parameters.AddWithValue("@URLTitle", URLTitle);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                pages = GetPages(reader);
            }
            return pages;
        }

        #region Static Methods
        public static List<PageIO> GetAllRecentPages()
        {
            List<PageIO> pages = new List<PageIO>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("GetAllMostRecentPages", conn);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                pages = GetPages(reader);
            }
            return pages;
        }

        /// <summary>
        /// This uses a SqlDataReader setup to read all the columns of the Pages table and 
        /// poplates a list of PageIO objects with it.
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        private static List<PageIO> GetPages(SqlDataReader reader)
        {
            List<PageIO> pages = new List<PageIO>();

            while (reader.Read())
            {
                PageIO p = new PageIO(reader.GetString(1), reader.GetString(2),
                    reader.GetString(3), reader.GetString(4), reader.GetDateTime(5),
                    reader.GetString(6), reader.GetInt32(7), reader.GetBoolean(8));
                p.ID = reader.GetInt32(0);
                pages.Add(p);
            }

            return pages;
        }

        #endregion
    }
}