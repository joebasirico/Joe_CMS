<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TLWebsite2011.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="RegisterPanel" runat="server">
			<asp:Label ID="Message" runat="server"></asp:Label>
			<table>
				<tr>
					<td>
						<strong>Please Register</strong>
					</td>
					<td align="right">
						<a href="Login.aspx">...or login</a>
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
						email*:
					</td>
					<td>
						<asp:TextBox runat="server" ID="email" />
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
					<td>
						Registration Code:
					</td>
					<td>
						<asp:TextBox runat="server" ID="RegCode" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<asp:Button Text="Register" ID="DoLogin" runat="server" OnClick="DoRegister_Click" />
					</td>
				</tr>
			</table>
	</asp:Panel>
	<asp:Panel ID="RegistrationCompletePanel" runat="server" Visible="false">
			<h1>Registration Complete</h1><br />
			You're all done. You may now browse around the site to see new admin functionality!
	</asp:Panel>
	<asp:Panel ID="AlreadyLoggedIn" runat="server" Visible="false">
			<strong>Already Logged In</strong><br />
			It looks like you're already registered and logged in.
			<br />
			If you need to <a href="Logout.aspx">logout</a>, you can do that too.
	</asp:Panel>
	<asp:Panel ID="ErrorPanel" runat="server" Visible="false">
			<strong>Something went wrong</strong><br />
			We're sorry there was an issue logging you in after you signed up. You can try to
			<a href="Login.aspx">login</a>, or <asp:HyperLink ID="supportMail" runat="server" Text="notify me"></asp:HyperLink>
			and I'll work to fix the error.
	</asp:Panel>
</asp:Content>
