<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="Edit.aspx.cs" Inherits="Joe_CMS.Edit" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style type="text/css">
		.page-subtitle
		{
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="Create" runat="server">
		<asp:Label ID="Message" runat="server" Visible="false" CssClass="message"></asp:Label>
		<asp:TextBox ID="TitleBox" runat="server" CssClass="page-title"></asp:TextBox>
		<br />
		<asp:TextBox ID="SubTitleBox" runat="server" CssClass="page-subtitle" Width="670px"></asp:TextBox>
		<br />
		<div class="urlName">
			URL
			<asp:TextBox ID="URLBox" runat="server" CssClass="EditURL"></asp:TextBox>(leave
			this blank unless you know what you're doing)</div>
		<br />
		Content Type:
		<asp:DropDownList ID="ContentTypeDropDown" runat="server">
			<asp:ListItem Value="PlainText">Plain Text</asp:ListItem>
			<asp:ListItem Selected="True">Markdown</asp:ListItem>
			<asp:ListItem>HTML</asp:ListItem>
		</asp:DropDownList>
		<br />
		This page accepts Markdown, and easy to learn markup language. <a href="Show.aspx?page=Markdown"
			target="_blank">Click here</a> for more information.<br />
		<table width="700px">
			<tr>
				<td>
					<a href="Upload.aspx" target="_blank"><strong>Upload</strong> image or file</a>
				</td>
				<td>
					<a href="UploadedFiles.aspx" target="_blank"><strong>View</strong> Uploaded Files</a>
				</td>
			</tr>
		</table>
		<asp:TextBox ID="BodyBox" runat="server" CssClass="page-main" TextMode="MultiLine"
			Height="326px" Width="665px"></asp:TextBox>
		<br />
		<asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
	</asp:Panel>
	<asp:Panel ID="Finished" runat="server" Visible="false">
		<h1 class="page-sub-title">
			Page Saved</h1>
		Please review the page below for mistakes or forgotten changes. The new page is
		currently <strong>live</strong>.<br />
		If you see something you'd like to change, go back and
		<asp:Label ID="EditText" runat="server"></asp:Label>.
		<hr />
		<h1 class="page-title">
			<asp:Label ID="TitleLabel" runat="server"></asp:Label></h1>
		<h2 class="page-sub-title">
			<asp:Label ID="SubTitleLabel" runat="server"></asp:Label></h2>
		<asp:Literal ID="BodyLiteral" runat="server" />
	</asp:Panel>
</asp:Content>
