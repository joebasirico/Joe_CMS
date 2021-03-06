﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Show.aspx.cs" Inherits="Joe_CMS.Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1 class="PageTitle">
            <asp:Label ID="TitleLabel" runat="server"></asp:Label></h1>
        <h2 class="PageSubTitle">
            <asp:Label ID="SubTitleLabel" runat="server"></asp:Label></h2>
        <table width="700px">
            <tr>
                <td>
                    <strong>
                        <asp:Label ID="EditText" runat="server" Visible="false"></asp:Label></strong>
                </td>
                <td>
                    <asp:Label ID="HistoryText" runat="server" Visible="false"></asp:Label>
                </td>
                <td>
                    <asp:LinkButton ID="Revert" Text="Revert To This Version" runat="server" OnClick="Revert_Click"
                        Visible="false" />
                </td>
            </tr>
        </table>
        <div class="PageBody">
            <asp:Literal ID="BodyLiteral" runat="server" />
            <asp:Literal ID="SocialLinks" runat="server" />
        </div>
        <div class="PageFooter">
            Last Updated By:
            <asp:Label ID="UserLabel" runat="server"></asp:Label>
            on
            <asp:Label ID="UpdatedLabel" runat="server"></asp:Label>
        </div>
</asp:Content>
