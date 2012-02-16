<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="Joe_CMS.Edit" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-subtitle
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Create" runat="server">
        <asp:Label ID="Message" runat="server" Visible="false" CssClass="Message"></asp:Label>
        <asp:TextBox ID="TitleBox" runat="server" CssClass="EditPageTitle"></asp:TextBox>
        <br />
        <asp:TextBox ID="SubTitleBox" runat="server" CssClass="EditPageSubtitle"></asp:TextBox>
        <br />
        <div class="urlName">
            URL
            <asp:TextBox ID="URLBox" runat="server" CssClass="EditPageURL"></asp:TextBox>(leave
            this blank unless you know what you're doing)</div>
        <br />
        <asp:CheckBox ID="IsDraftCheckBox" runat="server" Text="Draft" ToolTip="Check this checkbox if this page will be public later, but should be hidden until it is finished" />
        <asp:CheckBox ID="IsPrivateCheckBox" runat="server" Text="Private" ToolTip="Check this checkbox if this page should only be shown to other administrators" /><br />
        Content Type:
        <asp:DropDownList ID="ContentTypeDropDown" runat="server">
            <asp:ListItem Value="PlainText">Plain Text</asp:ListItem>
            <asp:ListItem Selected="True">Markdown</asp:ListItem>
            <asp:ListItem>HTML</asp:ListItem>
        </asp:DropDownList>
        <br />
        This page accepts Markdown, and easy to learn markup language. <a href="Show.aspx?page=Markdown"
            target="_blank">Click here</a> for more information.<br />
        <table class="EditUploadLinks">
            <tr>
                <td>
                    <a href="Upload.aspx" target="_blank"><strong>Upload</strong> image or file</a>
                </td>
                <td>
                    <a href="UploadedFiles.aspx" target="_blank"><strong>View</strong> Uploaded Files</a>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="BodyBox" runat="server" CssClass="EditPageBody" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
    </asp:Panel>
    <asp:Panel ID="Finished" runat="server" Visible="false">
        <h1>
            Page Saved</h1>
        Please review the page below for mistakes or forgotten changes. The new page is
        currently <strong>live</strong>.<br />
        If you see something you'd like to change, go back and
        <asp:Label ID="EditText" runat="server"></asp:Label>.
        <hr />
        <h2 class="PageTitle">
            <asp:Label ID="TitleLabel" runat="server"></asp:Label></h2>
            <h2 class="PageSubTitle">
                <asp:Label ID="SubTitleLabel" runat="server"></asp:Label></h2>
            <div class="PageBody">
                <asp:Literal ID="BodyLiteral" runat="server" />
            </div>
    </asp:Panel>
</asp:Content>
