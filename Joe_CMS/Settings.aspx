<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs" Inherits="Joe_CMS.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Message" runat="server" Visible="false" CssClass="Message"></asp:Label>
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
                    <asp:Label ID="NewsStoryItemsOnFrontTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NewsStoryItemsOnFrontDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NewsStoryItemsOnFrontValue" runat="server" Width="400px"></asp:TextBox>
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
                    <asp:Label ID="SupportMailTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="SupportMailDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="SupportMailValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="AddSocialLinksTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="AddSocialLinksDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="AddSocialLinksCheckBox" runat="server" /><br />
                <asp:TextBox ID="AddSocialLinksValue" runat="server" Width="400px" Height="150px"
                    TextMode="MultiLine"></asp:TextBox>
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
    </table>
    <hr />
    <table width="650px">
        <tr>
            <td colspan="2" align="right">
                <strong>
                    <asp:CheckBox ID="SendWelcomeMailCheckBox" runat="server" /><br />
                </strong>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="EmailServerTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="EmailServerDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="EmailServerValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td>
                <strong>
                    <asp:Label ID="NoReplyEmailTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NoReplyEmailDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NoReplyEmailValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="NoReplyEmailUserTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NoReplyEmailUserDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NoReplyEmailUserValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:Label ID="NoReplyEmailPassTitle" runat="server"></asp:Label></strong><br />
                <asp:Label ID="NoReplyEmailPassDescription" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NoReplyEmailPassValue" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
