<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Joe_CMS.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="LoginPanel" runat="server">
		<h1>Login</h1>
			<asp:Label ID="Message" runat="server" CssClass="Message"></asp:Label>
			<table>
				<tr>
					<td>
						<h1>Please Login</h1>
					</td>
					<td align="right">
						<a href="Register.aspx">...or register <asp:Label ID="AuthCodeCheck" runat="server">(Authorization Code Needed)</asp:Label></a>
					</td>
				</tr>
				<tr>
					<td>
						Username:
					</td>
					<td>
						<asp:TextBox runat="server" ID="UsernameBox" Width="300px" />
					</td>
				</tr>
				<tr>
					<td>
						Password:
					</td>
					<td>
						<asp:TextBox runat="server" ID="PasswordBox" TextMode="Password"  Width="300px" />
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
			<h1>Login Complete</h1><br />
			You have been logged successfully in.
	</asp:Panel>
	<asp:Panel ID="AlreadyLoggedIn" runat="server" Visible="false">
			<h1>Already Logged In</h1><br />
			It looks like you're already logged in.<br />
			<br />
			If you need to <a href="Logout.aspx">logout</a>, you can do that too.
	</asp:Panel>
</asp:Content>
