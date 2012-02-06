<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TLWebsite2011.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="LoginPanel" runat="server">
		<h1>Login</h1>
			<asp:Label ID="Message" runat="server"></asp:Label>
			<table>
				<tr>
					<td>
						<strong>Please Login</strong>
					</td>
					<td align="right">
						<a href="Register.aspx">...or register (auth code needed)</a>
					</td>
				</tr>
				<tr>
					<td>
						Username:
					</td>
					<td>
						<asp:TextBox runat="server" ID="UsernameBox" />
					</td>
				</tr>
				<tr>
					<td>
						Password:
					</td>
					<td>
						<asp:TextBox runat="server" ID="PasswordBox" TextMode="Password" />
					</td>
				</tr>
				<tr>
					<td colspan="2" >
						<asp:CheckBox ID="RememberMe" runat="server" Text="Remember for one month" />
					</td>
				</tr>
				<tr>
					<td>
						<a href="Forgot.aspx">forgot?</a>
					</td>
					<td align="right">
						<asp:Button Text="Login" ID="DoLogin" runat="server" OnClick="DoLogin_Click" />
					</td>
				</tr>
			</table>
	</asp:Panel>
	<asp:Panel ID="LoginCompletePanel" runat="server" Visible="false">
			<strong>Login Complete</strong><br />
			You have been logged successfully in.
	</asp:Panel>
	<asp:Panel ID="AlreadyLoggedIn" runat="server" Visible="false">
			<strong>Already Logged In</strong><br />
			It looks like you're already logged in.<br />
			<br />
			If you need to <a href="Logout.aspx">logout</a>, you can do that too.
	</asp:Panel>
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TLWebsite2011.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="LoginPanel" runat="server">
		<h1>Login</h1>
			<asp:Label ID="Message" runat="server"></asp:Label>
			<table>
				<tr>
					<td>
						<strong>Please Login</strong>
					</td>
					<td align="right">
						<a href="Register.aspx">...or register (auth code needed)</a>
					</td>
				</tr>
				<tr>
					<td>
						Username:
					</td>
					<td>
						<asp:TextBox runat="server" ID="UsernameBox" />
					</td>
				</tr>
				<tr>
					<td>
						Password:
					</td>
					<td>
						<asp:TextBox runat="server" ID="PasswordBox" TextMode="Password" />
					</td>
				</tr>
				<tr>
					<td colspan="2" >
						<asp:CheckBox ID="RememberMe" runat="server" Text="Remember for one month" />
					</td>
				</tr>
				<tr>
					<td>
						<a href="Forgot.aspx">forgot?</a>
					</td>
					<td align="right">
						<asp:Button Text="Login" ID="DoLogin" runat="server" OnClick="DoLogin_Click" />
					</td>
				</tr>
			</table>
	</asp:Panel>
	<asp:Panel ID="LoginCompletePanel" runat="server" Visible="false">
			<strong>Login Complete</strong><br />
			You have been logged successfully in.
	</asp:Panel>
	<asp:Panel ID="AlreadyLoggedIn" runat="server" Visible="false">
			<strong>Already Logged In</strong><br />
			It looks like you're already logged in.<br />
			<br />
			If you need to <a href="Logout.aspx">logout</a>, you can do that too.
	</asp:Panel>
</asp:Content>
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
