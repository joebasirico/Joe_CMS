using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace TLWebsite2011
{
    public class SettingsIO
    {
        public static string GetSetting(string key)
        {
            string value = "";
            int count = 0;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("GetSetting", conn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@SettingKey", key);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    value = reader.GetString(0);
                    count++;
                }
            }

            if (count == 1)
                return value;
            else
                return "";
        }

        public static void SetSettings(string key, string value)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
            {
                conn.Open();
                //This will update the value if it exists, and create it if it doesn't
                SqlCommand command = new SqlCommand("SetSetting", conn);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@SettingKey", key);
                command.Parameters.AddWithValue("@SettingValue", value);
                command.ExecuteNonQuery();
            }
        }
    }
}