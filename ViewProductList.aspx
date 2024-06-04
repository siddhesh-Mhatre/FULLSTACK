<%@ Page Title="View Product List" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewProductList.aspx.cs" Inherits="Ecom2.AdminPanel.ViewProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-pzjw8f+ua7Kw1TIqQUYkSUEpD0f7P5TzhX1Pqtm3xHfGzC+3hnZZ3G24H3PbH7" crossorigin="anonymous">
    <style>


        .grid-container {
            margin-top: 2rem;
        }
        .grid-header {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
        }
        .grid-row {
            background-color: #f8f9fa;
        }
        .grid-row-alternate {
            background-color: #e9ecef;
        }
        .grid-footer {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
        }
        .grid-actions button {
            margin-right: 5px;
        }
        .grid-image {
            height: 50px;
            width: 50px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container grid-container">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" CellPadding="3" CssClass="table table-bordered table-hover" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" GridLines="None">
            <AlternatingRowStyle CssClass="grid-row-alternate" />
            <Columns>
                <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" ItemStyle-CssClass="text-center" >
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" ItemStyle-CssClass="text-center" >
                </asp:BoundField>
                <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" ItemStyle-CssClass="text-center" >
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="ProductImg" HeaderText="Image">
                </asp:ImageField>
            </Columns>
            <EditRowStyle CssClass="table-primary" />
            <FooterStyle CssClass="grid-footer" BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle CssClass="grid-header" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle CssClass="grid-footer" HorizontalAlign="Right" BackColor="#C6C3C6" ForeColor="Black" />
            <RowStyle CssClass="grid-row" BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle CssClass="table-info font-weight-bold" BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBconn %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Products] ([ProductName], [ProductPrice], [ProductImg]) VALUES (@ProductName, @ProductPrice, @ProductImg)" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [ProductPrice] = @ProductPrice, [ProductImg] = @ProductImg WHERE [ProductID] = @ProductID">
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductPrice" Type="Double" />
                <asp:Parameter Name="ProductImg" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductPrice" Type="Double" />
                <asp:Parameter Name="ProductImg" Type="String" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
