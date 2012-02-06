<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="Upload.aspx.cs" Inherits="TLWebsite2011.Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Upload a File</h1>
<div>Use this page to upload a file. If the upload is successful a link to the file will be displayed.</div>
	<asp:Label ID="Message" runat="server" Visible = "false"></asp:Label><br />
		<asp:FileUpload ID="Uploader" runat="server" />
	<br />
	<asp:Button ID="UploadBtn" runat="server" Text="Upload" 
		onclick="UploadBtn_Click" />
</asp:Content>
