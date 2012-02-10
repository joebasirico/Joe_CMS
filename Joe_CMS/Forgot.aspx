<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="Joe_CMS.Forgot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel runat="server" ID="BeginForm">
			<h1>
				Password Recovery</h1>
			<div class="section">
				Please enter the e-mail address you used to register. If it is found in the system
				an e-mail will be sent to that address with instructions to reset your password.
			</div>
			<div class="section">
				<h3>
					e-mail address</h3>
				<asp:TextBox runat="server" ID="eMailAddress" Width="90%"></asp:TextBox><br />
				<asp:Button runat="server" ID="Submit" Text="Submit" OnClick="Submit_Click" />
			</div>
	</asp:Panel>
	<asp:Panel runat="server" ID="EmailSent" Visible="false">
			<h1>
				Password Recovery</h1>
			<div class="section">
				An e-mail is on it's way with instructions on how to reset your password.
			</div>
	</asp:Panel>
	<asp:Panel runat="server" ID="PasswordReset" Visible="false">
			<h1>
				Password Recovery</h1>
			<div class="section">
				<asp:Label ID="resetMessage" runat="server" />
				Please enter a new password (don't worry, I won't look).
				<br />
				<asp:TextBox runat="server" ID="Password1" TextMode="Password"></asp:TextBox><br />
				<asp:TextBox runat="server" ID="Password2" TextMode="Password"></asp:TextBox><br />
				<asp:Button runat="server" ID="Reset" Text="Submit" OnClick="Reset_Click" />
			</div>
	</asp:Panel>
	<asp:Panel runat="server" ID="Success" Visible="false">
			<h1>
				Password Recovery</h1>
			<div class="section">
				Success! You've reset your password, and you've been logged in. Feel free to browse
				around!
			</div>
	</asp:Panel>
</asp:Content>
