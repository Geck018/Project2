<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 160px;
            margin-top: 3px;
        }
        .auto-style4 {
            width: 100%;
            height: 153px;
            margin-top: 4px;
        }
        .auto-style7 {
            width: 77px;
        }
        .auto-style8 {
            width: 95px;
        }
        .auto-style9 {
            width: 150px;
        }
        .auto-style10 {
            width: 77px;
            height: 42px;
        }
        .auto-style12 {
            width: 95px;
            height: 42px;
        }
        .auto-style13 {
            height: 42px;
        }
        .auto-style15 {
            width: 150px;
            height: 42px;
        }
    </style>
</head>
<body style="height: 595px">
    <form id="form1" runat="server">
        WELCOME TO IMAGEHUB<table class="auto-style1">
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style15">
                </td>
                <td class="auto-style13">Login</td>
            </tr>
            <tr>
                <td class="auto-style10">Username:</td>
                <td class="auto-style15">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style10">Password:</td>
                <td class="auto-style15">
                    <input id="Password1" type="password" /></td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </td>
                <td class="auto-style15">
                </td>
                <td class="auto-style13"></td>
            </tr>
        </table>
        OR<table class="auto-style4" id="tableCreate">
            <tr>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style8">
                    Create New Account</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    :</td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtUsernameCreate" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    First Name:</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtFnameCreate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    Password:</td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtPWCreate" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    Surname:</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtLnameCreate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    Confirm Password:</td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtPWCreateConfirm" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    Email:</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtMailCreate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Button ID="btnFinishCreate" runat="server" OnClick="btnFinishCreate_Click" Text="Create" />
                </td>
                <td class="auto-style15">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project2picsdbConnectionString %>" SelectCommand="SELECT * FROM [USERDETAILS]"></asp:SqlDataSource>
                </td>
                <td class="auto-style12"></td>
                <td class="auto-style13"></td>
            </tr>
        </table>
    </form>
</body>
</html>
