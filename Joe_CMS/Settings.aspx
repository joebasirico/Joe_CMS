<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs" Inherits="Joe_CMS.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="650px">
        <tr>
            <td>
                <strong>
                    <asp:Label ID="SiteNameTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="SiteNameDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="SiteNameValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="NewsTitleTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NewsTitleDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NewsTitleValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="NewsStoryLengthFrontPageTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NewsStoryLengthFrontPageDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NewsStoryLengthFrontPageValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="NewsStoryItemsPerPageTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NewsStoryItemsPerPageDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NewsStoryItemsPerPageValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="NewsStoryLengthNewsPageTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NewsStoryLengthNewsPageDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NewsStoryLengthNewsPageValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="AddSocialLinksTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="AddSocialLinksDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:CheckBox id="AddSocialLinksCheckBox" runat="server" /><br />
                <asp:TextBox ID="AddSocialLinksValue" runat="server" Width="400px" Height="150px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="AuthorizationCodeTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="AuthorizationCodeDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="AuthorizationCodeValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button ID="Save" runat="server" Text="Save" onclick="Save_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
