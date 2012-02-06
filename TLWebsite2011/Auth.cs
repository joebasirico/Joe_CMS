<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TLWebsite2011
{
	public class Auth
	{
		private static string saltyGoo = "KLyI*Hfkwhkjrsakdfyt7823hkjGUGUYUbj23yr567832iu%$^&*jrn32y4gkruy13o2i2oindfkahsf7iFH";

		public static int checkCredentials(string username, string password)
		{
			int count = 0;
			int userID = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("CheckUser", conn);
				command.Parameters.AddWithValue("@UserName", username);
				command.Parameters.AddWithValue("@PasswordHash", password);
				command.CommandType = CommandType.StoredProcedure;
				SqlDataReader reader = command.ExecuteReader();
				count = 0;
				userID = 0;
				while (reader.Read())
				{
					userID = reader.GetInt32(0);
					count++;
				}
			}

			if (count == 1)
				return userID;
			else
				return 0;
		}

		public static string ByteToHex(byte[] input)
		{
			string StringVersion = "";

			foreach (byte b in input)
			{
				string hexChar = b.ToString("x");
				if (hexChar.Length == 1)
					hexChar = "0" + hexChar;
				StringVersion += hexChar;
			}
			return StringVersion;
		}

		public static void UpdatePassword(int userID, string password)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.UpdatePassword(userID, password);
		}

		public static bool UserExists(string username)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			var user = dc.CheckUserExists(username);
			bool foundUser = false;
			foreach (var id in user)
				foundUser = true;
			return foundUser;
		}

		public static void registerUser(string username, string password, string email)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.CreateUser(username, password, DateTime.Now, true, email);
		}

		public static void createSession(int userID, Guid session)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.CreateSession(userID, session, DateTime.Now);
		}

		public static int checkSession(Guid session)
		{
			int userID = 0;
			int count = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("GetUserIDBySession", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@SessionID", session);
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					userID = reader.GetInt32(0);
					count++;
				}
			}

			if (count == 1)
				return userID;
			else
				return 0;
		}

		public static void destroySession(Guid session)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.DestroySession(session);
		}

		public static string getSaltyGoo()
		{
			return saltyGoo;
		}

		public static void CreateEvent(string title, string body, string source)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.CreateEvent(title, DateTime.Now, source, body);
		}

		public static string LookupUserName(int userID)
		{
			string username = "";
			int count = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("GetUserByID", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", userID);
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					username = reader.GetString(0);
					count++;
				}
			}

			if (count == 1)
				return username;
			else
				return "";
		}

		public static void CreateResetValue(User currentUser, Guid resetValue)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("AddPasswordReset", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", currentUser.UserID);
				command.Parameters.AddWithValue("@ResetValue", resetValue);
				command.Parameters.AddWithValue("@TimeCreated", System.DateTime.Now);

				command.ExecuteNonQuery();
			}
		}

		public static int CheckResetValue(Guid resetValue)
		{
			int userID = 0;
			int count = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("LookupResetValue", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ResetValue", resetValue);
				command.Parameters.AddWithValue("@TimeOut", DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0)));
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					userID = reader.GetInt32(0);
					count++;
				}
			}

			if (count == 1)
				return userID;
			else
				return 0;
		}

		public static void DeleteResetValue(Guid resetValue)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("DeleteResetValue", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ResetValue", resetValue);
				command.ExecuteNonQuery();
			}
		}

		internal static void UpdateEmail(int userID, string newEmail)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("UpdateEmail", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", userID);
				command.Parameters.AddWithValue("@NewEmail", newEmail);

				command.ExecuteNonQuery();
			}
		}
	}
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TLWebsite2011
{
	public class Auth
	{
		private static string saltyGoo = "KLyI*Hfkwhkjrsakdfyt7823hkjGUGUYUbj23yr567832iu%$^&*jrn32y4gkruy13o2i2oindfkahsf7iFH";

		public static int checkCredentials(string username, string password)
		{
			int count = 0;
			int userID = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("CheckUser", conn);
				command.Parameters.AddWithValue("@UserName", username);
				command.Parameters.AddWithValue("@PasswordHash", password);
				command.CommandType = CommandType.StoredProcedure;
				SqlDataReader reader = command.ExecuteReader();
				count = 0;
				userID = 0;
				while (reader.Read())
				{
					userID = reader.GetInt32(0);
					count++;
				}
			}

			if (count == 1)
				return userID;
			else
				return 0;
		}

		public static string ByteToHex(byte[] input)
		{
			string StringVersion = "";

			foreach (byte b in input)
			{
				string hexChar = b.ToString("x");
				if (hexChar.Length == 1)
					hexChar = "0" + hexChar;
				StringVersion += hexChar;
			}
			return StringVersion;
		}

		public static void UpdatePassword(int userID, string password)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.UpdatePassword(userID, password);
		}

		public static bool UserExists(string username)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			var user = dc.CheckUserExists(username);
			bool foundUser = false;
			foreach (var id in user)
				foundUser = true;
			return foundUser;
		}

		public static void registerUser(string username, string password, string email)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.CreateUser(username, password, DateTime.Now, true, email);
		}

		public static void createSession(int userID, Guid session)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.CreateSession(userID, session, DateTime.Now);
		}

		public static int checkSession(Guid session)
		{
			int userID = 0;
			int count = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("GetUserIDBySession", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@SessionID", session);
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					userID = reader.GetInt32(0);
					count++;
				}
			}

			if (count == 1)
				return userID;
			else
				return 0;
		}

		public static void destroySession(Guid session)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.DestroySession(session);
		}

		public static string getSaltyGoo()
		{
			return saltyGoo;
		}

		public static void CreateEvent(string title, string body, string source)
		{
			DataClassesDataContext dc = new DataClassesDataContext();
			dc.CreateEvent(title, DateTime.Now, source, body);
		}

		public static string LookupUserName(int userID)
		{
			string username = "";
			int count = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("GetUserByID", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", userID);
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					username = reader.GetString(0);
					count++;
				}
			}

			if (count == 1)
				return username;
			else
				return "";
		}

		public static void CreateResetValue(User currentUser, Guid resetValue)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("AddPasswordReset", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", currentUser.UserID);
				command.Parameters.AddWithValue("@ResetValue", resetValue);
				command.Parameters.AddWithValue("@TimeCreated", System.DateTime.Now);

				command.ExecuteNonQuery();
			}
		}

		public static int CheckResetValue(Guid resetValue)
		{
			int userID = 0;
			int count = 0;
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("LookupResetValue", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ResetValue", resetValue);
				command.Parameters.AddWithValue("@TimeOut", DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0)));
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					userID = reader.GetInt32(0);
					count++;
				}
			}

			if (count == 1)
				return userID;
			else
				return 0;
		}

		public static void DeleteResetValue(Guid resetValue)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("DeleteResetValue", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ResetValue", resetValue);
				command.ExecuteNonQuery();
			}
		}

		internal static void UpdateEmail(int userID, string newEmail)
		{
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TLConnectionString"].ConnectionString))
			{
				conn.Open();
				SqlCommand command = new SqlCommand("UpdateEmail", conn);
				command.CommandType = CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", userID);
				command.Parameters.AddWithValue("@NewEmail", newEmail);

				command.ExecuteNonQuery();
			}
		}
	}
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
}