<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCSS.aspx.cs" Inherits="Joe_CMS.EditCSS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox ID="CSSValue" runat="server" TextMode="MultiLine" Width="100%" Height="600px"></asp:TextBox>
    <asp:Button ID="Save" runat="server" Text="Save" onclick="Save_Click" />
    </div>
    </form>
</body>
</html>
