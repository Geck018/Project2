<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="Project2.Create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 417px;
        }
        .auto-style2 {
            width: 108px;
        }
        .auto-style3 {
            width: 130px;
        }
        .auto-style4 {
            width: 130px;
            height: 40px;
        }
        .auto-style5 {
            width: 417px;
            height: 40px;
        }
        .auto-style6 {
            width: 108px;
            height: 40px;
        }
        .auto-style7 {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="WELCOME TO IMAGEHUB!"></asp:Label>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5">Please Create your account below:</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Username:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtUsrName" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="First Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPW" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Last Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Confirm Password:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPWConfirm" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label7" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Button ID="btnFinalise" runat="server" Text="Create Account" OnClick="btnFinalise_Click" />
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go To Login Page" />
                    </td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project2picsdbConnectionString %>" SelectCommand="SELECT * FROM [USERDETAILS]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
        </div>
    </form>
</body>
</html>
