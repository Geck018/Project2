<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 161px;
        }
        .auto-style2 {
            margin-left: 196px;
        }
        .auto-style3 {
            width: 806px;
            margin-left: 280px;
        }
        .auto-style4 {
            width: 813px;
            margin-left: 280px;
        }
        .auto-style5 {
            margin-left: 8px;
        }
        .auto-style6 {
            margin-left: 12px;
        }
        .auto-style7 {
            margin-left: 0px;
        }
        .auto-style8 {
            margin-left: 18px;
        }
        .auto-style9 {
            margin-left: 7px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p aria-setsize="10" class="auto-style3">
            Welcome to ImageHome!</p>
        <p class="auto-style4">
            Please Select an Option Below:</p>
        <asp:Button ID="btnAll" runat="server" CssClass="auto-style2" Height="54px" OnClick="Button1_Click" Text="View All" Width="88px" />
        <asp:Button ID="btnDel" runat="server" CssClass="auto-style1" Height="54px" Text="Add or Delete" Width="88px" OnClick="btnDel_Click" />
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
            <asp:View ID="viewAddDel" runat="server">
                <asp:Label ID="Label2" runat="server" Text="Please Select Image to Upload:"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style9" />
                <asp:Button ID="Button1" runat="server" CssClass="auto-style8" OnClick="Button1_Click1" Text="Add Image to Database" />
                <asp:Button ID="Button2" runat="server" CssClass="auto-style7" Text="Remove Image from Database" />
            </asp:View>
            <asp:View ID="viewAll" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DataSource">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="FILENAME" HeaderText="FILENAME" SortExpression="FILENAME" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:project2picsdbConnectionString %>" SelectCommand="SELECT * FROM [PICS]"></asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Text="Enter Filename to Search By:"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="auto-style5" Width="130px"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="auto-style6" Text="Search" />
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
