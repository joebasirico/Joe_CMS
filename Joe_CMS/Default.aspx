<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Joe_CMS.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:Literal ID="CustomHeader" runat="server" Visible="false"></asp:Literal>
    <asp:Literal ID="StyleSheet" runat="server"></asp:Literal>
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
    <asp:PlaceHolder ID="EditBody" runat="server" Visible="false">
        <div class="BodyWrapper">
            <h2>
                Title</h2>
            <asp:TextBox ID="EditTitleTextBox" runat="server" CssClass="DefaultEditTitle"></asp:TextBox><br />
            <div class="EditDefaultAdminButtons">
                <h2>
                    Custom StyleSheet</h2>
                <div>
                    Leave blank to use the default.</div>
                <asp:TextBox ID="EditStyleSheetTextBox" runat="server" Width="665px"></asp:TextBox><br />
                This page accepts Markdown, and easy to learn markup language. <a href="Show.aspx?page=Markdown"
                    target="_blank">Click here</a> for more information.<br />
                <table class="EditDefaultUploadLinks">
                    <tr>
                        <td>
                            <a href="Upload.aspx" target="_blank"><strong>Upload</strong> image or file</a>
                        </td>
                        <td>
                            <a href="UploadedFiles.aspx" target="_blank"><strong>View</strong> Uploaded Files</a>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                Be sure to include the text &&SYSTEM_CONTENT&& (All Caps), where you want the
                <asp:Label ID="ContentDescription" runat="server"></asp:Label>
                to go. If you want to put a link to log people in add &&SYSTEM_LOGIN&& to the text
                (optional).
                <h2>
                    Body</h2>
                <asp:DropDownList ID="ContentTypeDropDown" runat="server">
                    <asp:ListItem Value="PlainText">Plain Text</asp:ListItem>
                    <asp:ListItem Selected="True">Markdown</asp:ListItem>
                    <asp:ListItem>HTML</asp:ListItem>
                </asp:DropDownList>
            </div>
                <asp:TextBox ID="EditBodyTextBox" runat="server" TextMode="MultiLine" CssClass="EditDefaultBody"></asp:TextBox>
            <div id="EditHeaderWrapper">
                <h2>
                    Header</h2>
                <asp:TextBox ID="EditHeaderTextBox" runat="server" TextMode="MultiLine" CssClass="EditDefaultHeader"></asp:TextBox>
            </div>
            <br />
            <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
            <asp:Button ID="Finish" runat="server" Text="Finish" OnClick="Finish_Click" />
        </div>
    </asp:PlaceHolder>
    </form>
</body>
</html>
