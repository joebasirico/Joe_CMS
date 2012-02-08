<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TLWebsite2011.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <asp:Literal ID="DefaultHeader" runat="server"></asp:Literal>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Literal ID="DefaultPreNews" runat="server"></asp:Literal>
    <asp:ListView ID="NewsList" runat="server">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="idx-news-wrap">
                <div class="idx-news-content">
                    <div class="sub-main-title-small">
                        <a href='<%# Eval("Link")%>'>
                            <%# Eval("Title")%></a></div>
                    <div class="idx-news-title">
                        <%# Eval("Date")%>
                        - Posted by
                        <%# Eval("Author")%></div>
                    <%# Eval("Body")%>
                </div>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            No News has been posted yet.
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:Literal ID="DefaultPostNews" runat="server"></asp:Literal>
    </form>
</body>
</html>
