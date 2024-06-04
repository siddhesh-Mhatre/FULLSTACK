<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Ecom2.AdminPanel.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-pzjw8f+ua7Kw1TIqQUYkSUEpD0f7P5TzhX1Pqtm3xHfGzC+3hnZZ3G24H3PbH7" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 2rem;
        }
        .grid-header,
        .grid-footer {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
        }
        .grid-actions button {
            margin-right: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container"> 
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="pass" HeaderText="Password" SortExpression="pass" />
                <asp:BoundField DataField="urole" HeaderText="Role" SortExpression="urole" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle CssClass="grid-footer" />
            <HeaderStyle CssClass="grid-header" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBconn%>" DeleteCommand="DELETE FROM [auth] WHERE [id] = @original_id AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([pass] = @original_pass) OR ([pass] IS NULL AND @original_pass IS NULL)) AND (([urole] = @original_urole) OR ([urole] IS NULL AND @original_urole IS NULL))" InsertCommand="INSERT INTO [auth] ([email], [username], [pass], [urole]) VALUES (@email, @username, @pass, @urole)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [auth]" UpdateCommand="UPDATE [auth] SET [email] = @email, [username] = @username, [pass] = @pass, [urole] = @urole WHERE [id] = @original_id AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([pass] = @original_pass) OR ([pass] IS NULL AND @original_pass IS NULL)) AND (([urole] = @original_urole) OR ([urole] IS NULL AND @original_urole IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_pass" Type="String" />
                <asp:Parameter Name="original_urole" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="pass" Type="String" />
                <asp:Parameter Name="urole" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="pass" Type="String" />
                <asp:Parameter Name="urole" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_pass" Type="String" />
                <asp:Parameter Name="original_urole" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
