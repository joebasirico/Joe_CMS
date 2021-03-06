﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="SiteMap.aspx.cs" Inherits="Joe_CMS.SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Sitemap</h1>
<h2>A listing of all pages on the <asp:Label ID="SiteName" runat="server"></asp:Label> website!</h2>
	<asp:ListView ID="PageList" runat="server">
		<LayoutTemplate>
			<asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
		</LayoutTemplate>
		<ItemTemplate>
			<strong>
				<a href='<%# Eval("Link")%>'><%# Eval("Title")%></a></strong>
			<%# Eval("Subtitle")%></br>
		</ItemTemplate>
		<EmptyDataTemplate>
			No News has been posted yet.
		</EmptyDataTemplate>
	</asp:ListView>
</asp:Content>
