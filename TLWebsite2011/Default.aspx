<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TLWebsite2011.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <asp:Literal ID="CustomHeader" runat="server" Visible="false"></asp:Literal>
    <asp:Literal ID="StyleSheet" runat="server"></asp:Literal>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document.body).click(function () {
            if ($("EditHeaderWrapper").is(":hidden")) {
                $("EditHeaderWrapper").slideDown("slow");
            } else {
                $("EditHeaderWrapper").slideUp("slow");
            }
        });
    </script>
    <style type="text/css">
        .EditHeaderWrapper
        {
            background: #EEEEEE;
            margin: 3px;
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="DefaultPreContentPanel" runat="server">
        <h1>
            <asp:Label ID="SiteName" runat="server"></asp:Label></h1>
        <div>
            Welcome to your start page of Joe_CMS, the easiest CMS to administer. You can get
            started by creating a user, logging in and clicking this
            <asp:LinkButton ID="EditButton" runat="server" Visible="false" OnClick="EditButton_Click">Edit This Page</asp:LinkButton>
            button or the one at the bottom of the page.</div>
        <h2>
            News:</h2>
    </asp:Panel>
    <asp:Panel ID="CustomPreContentPanel" runat="server" Visible="false">
        <asp:Literal ID="PreContentHTML" runat="server"></asp:Literal>
    </asp:Panel>
    <asp:Panel ID="SystemContent" runat="server">
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
    </asp:Panel>
    <asp:Panel ID="DefaultPostNewsPanel" runat="server">
        <asp:Label ID="DefaultLoginText" runat="server"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="CustomPostContentPanel" runat="server" Visible="false">
        <asp:Literal ID="PostContentHTML" runat="server"></asp:Literal>
    </asp:Panel>
    <asp:LinkButton ID="EditButton2" runat="server" Visible="false" OnClick="EditButton_Click">Edit This Page</asp:LinkButton>



    <asp:Panel ID="EditBody" runat="server" Visible="false">
        <h2>Title</h2>
        <asp:TextBox ID="EditTitleTextBox" runat="server" Width="665px" CssClass="Title"></asp:TextBox><br />
        <h2>Custom StyleSheet</h2>
        <div>Leave blank to use the default.</div>
        <asp:TextBox ID="EditStyleSheetTextBox" runat="server" Width="665px"></asp:TextBox><br />
        
        This page accepts Markdown, and easy to learn markup language. <a href="Show.aspx?page=Markdown"
            target="_blank">Click here</a> for more information.<br />
        <table width="700px">
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
        <h2>Body</h2>
        <asp:DropDownList ID="ContentTypeDropDown" runat="server">
            <asp:ListItem Value="PlainText">Plain Text</asp:ListItem>
            <asp:ListItem Selected="True">Markdown</asp:ListItem>
            <asp:ListItem>HTML</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:TextBox ID="EditBodyTextBox" runat="server" TextMode="MultiLine" Height="326px"
            Width="665px"></asp:TextBox>
        
        <div id="EditHeaderWrapper">
        <h2>Header</h2>
            <asp:TextBox ID="EditHeaderTextBox" runat="server" TextMode="MultiLine" Height="120px"
                Width="665px"></asp:TextBox>
        </div>
        <br />
        <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" /> 
        <asp:Button ID="Finish" runat="server" Text="Finish" onclick="Finish_Click" />
    </asp:Panel>
    </form>
</body>
</html>
