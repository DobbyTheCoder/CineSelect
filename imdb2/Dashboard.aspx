<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <!-- <link rel ="stylesheet" type ="text/css" href="./StyleSheet.css" />-->
   <style>
         .mygrdContent
        {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
        }
        .header
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }
        .rows
        {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px;
        }
        .rows:hover
        {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            text-align: left;
        }
        .selectedrow
        {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }
        .mydatagrid a /** FOR THE PAGING ICONS  **/
         {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .mygrdContent a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
        {
            background-color: #000;
            color: #fff;
        }
        .mygrdContent span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
         {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }
        .pager
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }
        .mygrdContent td
        {
            padding: 5px;
        }
        .mygrdContent th
        {
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="jumbotron">
            <h3 class ="text-center">Dashboard</h3>
        </div>
        <center>
        <asp:GridView ID="GridView1" runat="server" Height="204px" Width="249px"  AutoGenerateColumns="False" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" 
            AllowPaging="True" DataKeyNames="email" DataSourceID="users">

            <Columns>
                <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>
            <asp:SqlDataSource ID="users1" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:user1 %>" SelectCommand="SELECT [email], [fname], [lname] FROM [userInfo]" DeleteCommand="DELETE FROM [userInfo] WHERE [email] = ?" InsertCommand="INSERT INTO [userInfo] ([email], [fname], [lname]) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:user1.ProviderName %>" UpdateCommand="UPDATE [userInfo] SET [fname] = ?, [lname] = ? WHERE [email] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="fname" Type="String" />
                    <asp:Parameter Name="lname" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fname" Type="String" />
                    <asp:Parameter Name="lname" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </center>
    </form>
</body>
</html>
