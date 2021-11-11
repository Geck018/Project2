<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 160px;
            margin-top: 35px;
        }
        .auto-style2 {
            width: 67px;
        }
        .auto-style3 {
            width: 134px;
        }
        .auto-style4 {
            width: 100%;
            height: 153px;
        }
        .auto-style6 {
            width: 294px;
        }
        .auto-style7 {
            width: 69px;
        }
        .auto-style8 {
            width: 53px;
        }
    </style>
</head>
<body style="height: 595px">
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Username:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td class="auto-style3">
                    <input id="Password1" type="password" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style4">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style6">
                    <input id="Text1" type="text" /></td>
                <td class="auto-style8">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <input id="Text2" type="text" /></td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style6">
                    <input id="boxPW" type="password" /></td>
                <td class="auto-style8">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <input id="Text3" type="text" /></td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style6">
                    <input id="boxPWConfirm" type="password" /></td>
                <td class="auto-style8">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <input id="Text4" type="text" /></td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
