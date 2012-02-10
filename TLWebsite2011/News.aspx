<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="Joe_CMS.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-title"><asp:Label ID="NewsTitle" runat="server"></asp:Label><asp:TextBox ID="EditNewsTitleTextBox" runat="server" Visible="false"></asp:TextBox></h1>
    <asp:Label ID="AddNews" runat="server" Visible="false"></asp:Label>
    <asp:LinkButton ID="EditTitle" runat="server" Visible="false" 
        onclick="EditTitle_Click" Text="Edit Title"></asp:LinkButton><asp:LinkButton ID="SaveTitle" 
        runat="server" Visible="false" onclick="SaveTitle_Click" Text="Save Title"></asp:LinkButton>
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
