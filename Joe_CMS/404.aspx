<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="404.aspx.cs" Inherits="Joe_CMS._404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="StyleSheet404" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Message" runat="server" Visible="false"></asp:Label>
    <asp:Panel ID="DefaultBody" runat="server">
        <h1>
            Page Not Found (404)</h1>
        <div>
            We're sorry, but this page doesn't exist. Please browse around to find what you're
            looking for or use the <a href="SiteMap.aspx">Site Map</a> to see all the pages
            on the site.</div>
    </asp:Panel>
    <asp:Panel ID="CustomBody" runat="server" Visible="false">
        <asp:Literal ID="CustomBodyHTML" runat="server"></asp:Literal>
    </asp:Panel>
    <asp:LinkButton ID="EditButton" runat="server" Visible="false" OnClick="EditButton_Click">Edit This Page</asp:LinkButton>
    <asp:Panel ID="EditBody" runat="server" Visible="false">
        <asp:TextBox ID="EditStyleSheetTextBox" runat="server" Width="665px"></asp:TextBox><br />
        <asp:DropDownList ID="ContentTypeDropDown" runat="server">
            <asp:ListItem Value="PlainText">Plain Text</asp:ListItem>
            <asp:ListItem Selected="True">Markdown</asp:ListItem>
            <asp:ListItem>HTML</asp:ListItem>
        </asp:DropDownList>
        <br />
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
        <asp:TextBox ID="EditBodyTextBox" runat="server" TextMode="MultiLine" Height="326px" Width="665px"></asp:TextBox>
        <br />
        <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
    </asp:Panel>
</asp:Content>
