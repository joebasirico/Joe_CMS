<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="UploadDelete.aspx.cs" Inherits="Joe_CMS.UploadDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>
		Delete File</h1>
	<asp:Label ID="Message" runat="server" Visible="false"></asp:Label>
	<asp:Panel ID="ToDelete" runat="server">
		<div>
			Are you sure you want to delete the file "<asp:Label ID="FileName" runat="server"></asp:Label>",
			this cannot be undone.</div>
		<table width="600px">
			<tr>
				<td>
					<strong>
						<asp:LinkButton ID="DeleteBtn" runat="server" Text="Delete" OnClick="Delete_Click"></asp:LinkButton></strong>
				</td>
				<td>
					<a href="UploadedFiles.aspx">Cancel</a>
				</td>
			</tr>
		</table>
	</asp:Panel>
	<asp:Panel ID="Finished" runat="server" Visible="false">
		<h2>
			File Deleted</h2>
		The File has been sucessfully deleted, you may now return to the <a href="UploadedFiles.aspx">
			Uploads directory</a>.
	</asp:Panel>
</asp:Content>
