<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Joe_CMS.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:Literal ID="CustomHeader" runat="server" Visible="false"></asp:Literal>
    <link href="Stylesheet.ashx" rel="stylesheet" type="text/css" />
    <asp:Literal ID="RSS" runat="server"></asp:Literal>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Literal ID="PreContentHTML" runat="server"></asp:Literal>
    <asp:PlaceHolder ID="SystemContent" runat="server">
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
    <asp:Literal ID="PostContentHTML" runat="server"></asp:Literal>
    <asp:LinkButton ID="EditButton2" runat="server" Visible="false" OnClick="EditButton_Click">Edit This Page</asp:LinkButton>
    </form>
</body>
</html>
