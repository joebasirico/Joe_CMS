<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="TLWebsite2011.History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>History for <asp:Label ID="TitleLabel" runat="server"></asp:Label></h1>
	<asp:ListView ID="HistoryList" runat="server">
		<LayoutTemplate>
			<asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
		</LayoutTemplate>
		<ItemTemplate>
			<h3><a href='<%# Eval("Link")%>'><%# Eval("Title")%></a></h3>
			<h4>Updated by <%# Eval("UpdatedBy")%> at <%# Eval("Updated")%></h4>
			<%# Eval("Body")%>
			<br /><br />
		</ItemTemplate>
		<EmptyDataTemplate>
			No History for this item.
		</EmptyDataTemplate>
	</asp:ListView>

</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="TLWebsite2011.History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>History for <asp:Label ID="TitleLabel" runat="server"></asp:Label></h1>
	<asp:ListView ID="HistoryList" runat="server">
    <h1><asp:Label ID="PageTitle" runat="server"></asp:Label></h1>
		<LayoutTemplate>
			<asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
		</LayoutTemplate>
		<ItemTemplate>
			<h3><a href='<%# Eval("Link")%>'><%# Eval("Title")%></a></h3>
			<h4>Updated by <%# Eval("UpdatedBy")%> at <%# Eval("Updated")%></h4>
			<%# Eval("Body")%>
			<br /><br />
		</ItemTemplate>
		<EmptyDataTemplate>
			No History for this item.
		</EmptyDataTemplate>
	</asp:ListView>

</asp:Content>
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
