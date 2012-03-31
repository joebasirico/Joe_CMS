<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="Joe_CMS.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="NewsPageTitle">
        <asp:Label ID="NewsTitle" runat="server"></asp:Label><asp:TextBox ID="EditNewsTitleTextBox"
            runat="server" Visible="false"></asp:TextBox></h1>
    <asp:Label ID="AddNews" runat="server" Visible="false"></asp:Label>
    <asp:LinkButton ID="EditTitle" runat="server" Visible="false" OnClick="EditTitle_Click"
        Text="Edit Title"></asp:LinkButton><asp:LinkButton ID="SaveTitle" runat="server"
            Visible="false" OnClick="SaveTitle_Click" Text="Save Title"></asp:LinkButton>
    <asp:ListView ID="NewsList" runat="server">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
        </LayoutTemplate>
        <ItemTemplate>
            <h2 class="NewsTitle">
                <a href='<%# Eval("Link")%>'>
                    <%# Eval("Title")%></a></h2>
            <div class="NewsSubTitle">
                <%# Eval("Date")%>
                - Posted by
                <%# Eval("Author")%></div>
            <div class="NewsBody">
                <%# Eval("Body")%>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            No News has been posted yet.
        </EmptyDataTemplate>
    </asp:ListView>
    <br />
    <asp:DataPager ID="NewsPager" runat="server" PagedControlID="NewsList" OnPreRender="NewsPager_PreRender">
        <Fields>
            <asp:NextPreviousPagerField PreviousPageText="&lArr;" ShowLastPageButton="False" ShowNextPageButton="False"
                ShowPreviousPageButton="True" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField NextPageText="&rArr;" ShowFirstPageButton="False" ShowNextPageButton="True"
                ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
</asp:Content>
