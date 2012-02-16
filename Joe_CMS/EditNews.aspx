<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="EditNews.aspx.cs" Inherits="Joe_CMS.EditNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Create" runat="server">
        <asp:Label ID="Message" runat="server" Visible="false" CssClass="Message"></asp:Label>
        <asp:TextBox ID="TitleBox" runat="server" CssClass="EditNewsTitle"></asp:TextBox>
        <div class="EditNewsAdminButtons">
            This page accepts Markdown, and easy to learn markup language. <a href="Show.aspx?page=Markdown"
                target="_blank">click here</a> for more information.<br />
            <table class="EditNewsUploadLinks">
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
            Date Published (leave blank for today)
            <asp:TextBox ID="DateBox" runat="server"></asp:TextBox>
        </div>
        <asp:TextBox ID="BodyBox" runat="server" CssClass="EditNewsBody" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
    </asp:Panel>
</asp:Content>
