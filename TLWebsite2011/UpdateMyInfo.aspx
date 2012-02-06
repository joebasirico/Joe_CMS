<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="UpdateMyInfo.aspx.cs" Inherits="TLWebsite2011.UpdateMyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>
		Update My Info</h1>
	<asp:Label ID="message" runat="server" Visible="false" CssClass="mainPageMessage" />
	<div class="paragraph">
		Use this page to update information about yourself for this website.
	</div>
	<h2>
		Change Password</h2>
	<div class="paragraph">
		<table>
			<tr>
				<td width="200px">
					Current Password:
				</td>
				<td>
					<asp:TextBox ID="currentPassword" runat="server" TextMode="Password"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					New Password:
				</td>
				<td>
					<asp:TextBox ID="Password1" runat="server" TextMode="Password"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Repeat New Password:
				</td>
				<td>
					<asp:TextBox ID="Password2" runat="server" TextMode="Password"></asp:TextBox>
				</td>
			</tr>
		</table>
	</div>
	<h2>
		Change or Add e-mail Address</h2>
	<div class="paragraph">
		<table>
			<tr>
				<td width="200px">
					e-mail Address:
				</td>
				<td>
					<asp:TextBox ID="email" runat="server" Width="300px"></asp:TextBox>
				</td>
			</tr>
		</table>
	</div>
	<asp:Button ID="submit" runat="server" Text="Update" OnClick="submit_Click" 
		style="height: 26px" />
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="UpdateMyInfo.aspx.cs" Inherits="TLWebsite2011.UpdateMyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>
		Update My Info</h1>
	<asp:Label ID="message" runat="server" Visible="false" CssClass="mainPageMessage" />
	<div class="paragraph">
		Use this page to update information about yourself for this website.
	</div>
	<h2>
		Change Password</h2>
	<div class="paragraph">
		<table>
			<tr>
				<td width="200px">
					Current Password:
				</td>
				<td>
					<asp:TextBox ID="currentPassword" runat="server" TextMode="Password"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					New Password:
				</td>
				<td>
					<asp:TextBox ID="Password1" runat="server" TextMode="Password"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Repeat New Password:
				</td>
				<td>
					<asp:TextBox ID="Password2" runat="server" TextMode="Password"></asp:TextBox>
				</td>
			</tr>
		</table>
	</div>
	<h2>
		Change or Add e-mail Address</h2>
	<div class="paragraph">
		<table>
			<tr>
				<td width="200px">
					e-mail Address:
				</td>
				<td>
					<asp:TextBox ID="email" runat="server" Width="300px"></asp:TextBox>
				</td>
			</tr>
		</table>
	</div>
	<asp:Button ID="submit" runat="server" Text="Update" OnClick="submit_Click" 
		style="height: 26px" />
</asp:Content>
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
