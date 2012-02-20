<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Joe_CMS.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <asp:Literal ID="CustomHeader" runat="server" Visible="false"></asp:Literal>

    <link href="Stylesheet.ashx" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <asp:PlaceHolder ID="DefaultPreContentPanel" runat="server">
        <div class="BodyWrapper">
            <h1>
                <asp:Label ID="SiteName" runat="server"></asp:Label></h1>
            <div>
                Welcome to your start page of Joe_CMS, the easiest CMS to administer. You can get
                started by creating a user, logging in and clicking this
                <asp:LinkButton ID="EditButton" runat="server" Visible="false" OnClick="EditButton_Click">Edit This Page</asp:LinkButton>
                button or the one at the bottom of the page.</div>
            <h2>
                News:
            </h2>
            <!--foo-->
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="CustomPreContentPanel" runat="server" Visible="false">
        <!--foo-->
        <asp:Literal ID="PreContentHTML" runat="server"></asp:Literal>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="SystemContent" runat="server">
        <!--foo-->
        <asp:ListView ID="NewsList" runat="server">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="DefaultNewsWrap">
                    <div class="DefaultNewsTitle">
                        <a href='<%# Eval("Link")%>'>
                            <%# Eval("Title")%></a></div>
                    <div class="DefaultNewsSubTitle">
                        <%# Eval("Date")%>
                        - Posted by
                        <%# Eval("Author")%></div>
                    <div class="DefaultNewsBody">
                        <%# Eval("Body")%></div>
                </div>
            </ItemTemplate>
            <EmptyDataTemplate>
                No News has been posted yet.
            </EmptyDataTemplate>
        </asp:ListView>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="DefaultPostNewsPanel" runat="server">
        <asp:Label ID="DefaultLoginText" runat="server"></asp:Label>
        </div> </asp:PlaceHolder>
    <asp:PlaceHolder ID="CustomPostContentPanel" runat="server" Visible="false">
        <asp:Literal ID="PostContentHTML" runat="server"></asp:Literal>
    </asp:PlaceHolder>
    <asp:LinkButton ID="EditButton2" runat="server" Visible="false" OnClick="EditButton_Click">Edit This Page</asp:LinkButton>
    </form>
</body>
</html>
