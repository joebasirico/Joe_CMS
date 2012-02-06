<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="TLWebsite2011.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-title">
        Latest News</h1>
    <asp:Label ID="AddNews" runat="server" Visible="false"></asp:Label>
    <asp:ListView ID="NewsList" runat="server">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
        </LayoutTemplate>
        <ItemTemplate>
            <h2 class="page-sub-title">
                <a href='<%# Eval("Link")%>'>
                    <%# Eval("Title")%></a></h2>
            <div class="page-date">
                <%# Eval("Date")%>
                - Posted by
                <%# Eval("Author")%></div>
            <div>
                <%# Eval("Body")%>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            No News has been posted yet.
        </EmptyDataTemplate>
    </asp:ListView>
    <br />
    <asp:DataPager ID="NewsPager" runat="server" PagedControlID="NewsList" 
        onprerender="NewsPager_PreRender">
        <Fields>
            <asp:NextPreviousPagerField FirstPageText="&lt;&lt;" ShowFirstPageButton="True" ShowNextPageButton="False"
                ShowPreviousPageButton="False" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField LastPageText="&gt;&gt;" ShowLastPageButton="True" ShowNextPageButton="False"
                ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
</asp:Content>
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
	CodeBehind="News.aspx.cs" Inherits="TLWebsite2011.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1 class="page-title">
		Latest News</h1>
	<asp:Label ID="AddNews" runat="server" Visible="false"></asp:Label> 
	<asp:ListView ID="NewsList" runat="server">
		<LayoutTemplate>
			<asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
		</LayoutTemplate>
		<ItemTemplate>
			<h2 class="page-sub-title">
				<a href='<%# Eval("Link")%>'>
					<%# Eval("Title")%></a></h2>
			<div class="page-date">
				<%# Eval("Date")%>
				- Posted by
				<%# Eval("Author")%></div>
			<div>
				<%# Eval("Body")%>
			</div>
		</ItemTemplate>
		<EmptyDataTemplate>
			No News has been posted yet.
		</EmptyDataTemplate>
	</asp:ListView>
</asp:Content>
>>>>>>> 3d0d5fc01fd7ab919e6e6007dadf00490afee882
