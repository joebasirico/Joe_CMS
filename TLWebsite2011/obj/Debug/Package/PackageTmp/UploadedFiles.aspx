<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="UploadedFiles.aspx.cs" Inherits="TLWebsite2011.UploadedFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1 class="page-title">
		Uploaded Files</h1>
	<h2 class="page-sub-title">
		A list of all files uploaded.
	</h2>
	<div>
		All of these files are publically available, but are listed here for reference.</div>
	<asp:ListView ID="FileList" runat="server">
		<LayoutTemplate>
			<table>
				<tr>
					<td width="100px">
						<strong>Type</strong>
					</td>
					<td>
						<strong>Path</strong>
					</td>
				</tr>
				<asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
			</table>
		</LayoutTemplate>
		<ItemTemplate>
			<tr>
				<td>
					<%# Eval("Type")%>
				</td>
				<td>
					<%# Eval("Path")%>
				</td>
			</tr>
		</ItemTemplate>
		<EmptyDataTemplate>
			No History for this item.
		</EmptyDataTemplate>
	</asp:ListView>
</asp:Content>
