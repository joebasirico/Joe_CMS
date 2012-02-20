<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditMasterTemplate.aspx.cs"
    Inherits="Joe_CMS.EditMasterTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
    <h2>
        Body</h2>
    <asp:DropDownList ID="ContentTypeDropDown" runat="server">
        <asp:ListItem Value="PlainText">Plain Text</asp:ListItem>
        <asp:ListItem>Markdown</asp:ListItem>
        <asp:ListItem Selected="True">HTML</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:TextBox ID="EditBodyTextBox" runat="server" TextMode="MultiLine" Height="326px"
        Width="100%"></asp:TextBox>
    <div id="EditHeaderWrapper">
        <h2>
            Header</h2>
        <asp:TextBox ID="EditHeaderTextBox" runat="server" TextMode="MultiLine" Height="120px"
            Width="100%"></asp:TextBox>
    </div>
    <br />
    <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
    <asp:Button ID="Finish" runat="server" Text="Finish" OnClick="Finish_Click" />
    </form>
</body>
</html>
