<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="EditCSS.aspx.cs" Inherits="Joe_CMS.EditCSS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="Javascript" type="text/javascript" src="SiteResources/edit_area/edit_area_full.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Message" runat="server" Visible="false" CssClass="Message"></asp:Label>
        <asp:TextBox ID="CSSValue" runat="server" TextMode="MultiLine" Width="100%" Height="600px"></asp:TextBox>
        <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
        <asp:Button ID="Finish" runat="server" Text="Finish" OnClick="Finish_Click" />
    </div>
</asp:Content>
