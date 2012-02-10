<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="NewsItem.aspx.cs" Inherits="Joe_CMS.NewsItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="View" runat="server">
		<h1>
			<asp:Label ID="TitleLabel" runat="server" /></h1>
		<table width="700px">
			<tr>
				<td>
					<strong>
						<asp:Label ID="EditText" runat="server" Visible="false"></asp:Label></strong>
				</td>
				<td align="right">
					<asp:LinkButton ID="DeleteNews" runat="server" Visible="false" Text="Delete" OnClick="DeleteNews_Click"
						OnClientClick="return confirm('Are you sure you want to delete this news item? This cannot be undone!')"></asp:LinkButton>
				</td>
			</tr>
		</table>
		<div>
			<asp:Literal ID="BodyLabel" runat="server"></asp:Literal>
		</div>
		<div class="page-date">
			<asp:Label ID="DateLabel" runat="server" />
			- Posted by
			<asp:Label ID="AuthorLabel" runat="server" /></div>
	</asp:Panel>
	<asp:Panel ID="Deleted" runat="server" Visible="false">
		<h1>
			<asp:Label ID="DeletedTitle" runat="server"></asp:Label>
			has been deleted</h1>
		<a href="News.aspx">Return to News</a>
		<h2>
			Deleted Text</h2>
		<asp:Label ID="DeletedBody" runat="server"></asp:Label>
	</asp:Panel>
</asp:Content>
