<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="EditNews.aspx.cs" Inherits="TLWebsite2011.EditNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="Create" runat="server">
		<asp:Label ID="Message" runat="server" Visible="false" CssClass="message"></asp:Label>
		<asp:TextBox ID="TitleBox" runat="server" CssClass="page-title"></asp:TextBox>
		<br />
		This page accepts Markdown, and easy to learn markup language. <a href="Show.aspx?page=Markdown" target="_blank">
			click here</a> for more information.<br />
			<a href="Upload.aspx" target="_blank">Upload image or file</a><br />
		Date Published (leave blank for today) <asp:TextBox ID="DateBox" runat="server"></asp:TextBox><br />
		<asp:TextBox ID="BodyBox" runat="server" CssClass="page-main" TextMode="MultiLine"
			Height="326px" Width="665px"></asp:TextBox>
		<br />
		<asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
	</asp:Panel>
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="EditNews.aspx.cs" Inherits="TLWebsite2011.EditNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="Create" runat="server">
		<asp:Label ID="Message" runat="server" Visible="false" CssClass="message"></asp:Label>
		<asp:TextBox ID="TitleBox" runat="server" CssClass="page-title"></asp:TextBox>
		<br />
		This page accepts Markdown, and easy to learn markup language. <a href="Show.aspx?page=Markdown" target="_blank">
			click here</a> for more information.<br />
			<a href="Upload.aspx" target="_blank">Upload image or file</a><br />
		Date Published (leave blank for today) <asp:TextBox ID="DateBox" runat="server"></asp:TextBox><br />
		<asp:TextBox ID="BodyBox" runat="server" CssClass="page-main" TextMode="MultiLine"
			Height="326px" Width="665px"></asp:TextBox>
		<br />
		<asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
	</asp:Panel>
</asp:Content>
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
