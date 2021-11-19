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
        .auto-style8 {
            margin-left: 18px;
        }
        .auto-style9 {
            margin-left: 7px;
        }
        .auto-style11 {
            width: 186px;
        }
        .auto-style12 {
            width: 167px;
        }
        .auto-style13 {
            width: 232px;
        }
        .auto-style14 {
            width: 158px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p aria-setsize="10" class="auto-style3">
            <table style="width:100%;">
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td>WELCOME TO IMAGEHUB!</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td>Please select an option below:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">
        <asp:Button ID="btnAll" runat="server" CssClass="auto-style2" Height="54px" OnClick="Button1_Click" Text="View All" Width="88px" />
                    </td>
                    <td>
        <asp:Button ID="btnDel" runat="server" CssClass="auto-style1" Height="54px" Text="Add or Delete" Width="88px" OnClick="btnDel_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </p>
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
            <asp:View ID="viewAddDel" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="Label2" runat="server" Text="Please Select Image to Upload:"></asp:Label>
                        </td>
                        <td class="auto-style13">
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="auto-style9" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">&nbsp;</td>
                        <td class="auto-style13">
                            <asp:Button ID="Button1" runat="server" CssClass="auto-style8" OnClick="Button1_Click1" Text="Add Image to Database" />
                        </td>
                        <td>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="FILENAME" HeaderText="FILENAME" SortExpression="FILENAME" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label runat="server" Text="Please Enter the Filename of the Image to be Deleted:"></asp:Label>
                        </td>
                        <td class="auto-style13">
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FILENAME" DataValueField="FILENAME" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="viewAll" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="Label1" runat="server" Text="Select Filename to Search for:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FILENAME" DataValueField="FILENAME" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project2picsdbConnectionString %>" SelectCommand="SELECT [ID], [FILENAME] FROM [PICS] ORDER BY [ID]"></asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="FILENAME" HeaderText="FILENAME" SortExpression="FILENAME" />
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
        <asp:Image ID="displayImage" runat="server" />
        <asp:SqlDataSource ID="DataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:project2picsdbConnectionString %>" SelectCommand="SELECT * FROM [PICS] ORDER BY [FILENAME]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:project2picsdbConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [PICS] WHERE ([FILENAME] LIKE '%' + @FILENAME + '%') ORDER BY [FILENAME]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="FILENAME" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
