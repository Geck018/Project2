<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl="~/LogoSample_ByTailorBrands.jpg" Width="160px" />
                    </td>
                    <td>
                        <strong>
                        <asp:Label ID="Label1" runat="server" Text="WELCOME TO IMAGEHUB!"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Please Enter your Login details below, or click Create Account to create a new account and start your ImageHub experience:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Username:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsrName" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPW" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
                        <asp:Label ID="lblErr" runat="server" ForeColor="Red" Text="Please Fill in All Information" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create Account" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:Panel ID="Panel1" runat="server">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project2picsdbConnectionString %>" SelectCommand="SELECT [Salt] FROM [USERPW]"></asp:SqlDataSource>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
