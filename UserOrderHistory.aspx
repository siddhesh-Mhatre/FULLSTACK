<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="UserOrderHistory.aspx.cs" Inherits="Ecom2.UserOrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-pzjw8f+ua7Kw1TIqQUYkSUEpD0f7P5TzhX1Pqtm3xHfGzC+3hnZZ3G24H3PbH7" crossorigin="anonymous">
    <style>
        .order-history-header {
            background-color: #006699;
            color: white;
            text-align: center;
        }
        .order-history-footer {
            background-color: white;
            color: #000066;
        }
        .order-history-row {
            color: #000066;
        }
        .order-history-selected {
            background-color: #669999;
            color: white;
            font-weight: bold;
        }
        .order-history-sorted-asc {
            background-color: #F1F1F1;
        }
        .order-history-sorted-desc {
            background-color: #CAC9C9;
        }
        .product-image {
            height: 100px;
            width: 100px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" PageSize="5" DataKeyNames="pid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="pid" HeaderText="pid" SortExpression="pid" InsertVisible="False" ReadOnly="True">
                </asp:BoundField>
                <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname">
                </asp:BoundField>
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price">
                </asp:BoundField>
                <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty">
                </asp:BoundField>
                <asp:BoundField DataField="dt" HeaderText="dt" SortExpression="dt">
                </asp:BoundField>
                <asp:BoundField DataField="suser" HeaderText="suser" SortExpression="suser">
                </asp:BoundField>
                <asp:BoundField DataField="perprice" HeaderText="perprice" SortExpression="perprice" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:ImageField DataImageUrlField="pic" HeaderText="Image">
                    <ControlStyle Height="60px" Width="60px" />
                </asp:ImageField>
            </Columns>
            <FooterStyle CssClass="order-history-footer" />
            <HeaderStyle CssClass="order-history-header" />
            <PagerStyle CssClass="order-history-footer" HorizontalAlign="Left" />
            <RowStyle CssClass="order-history-row" />
            <SelectedRowStyle CssClass="order-history-selected" />
            <SortedAscendingCellStyle CssClass="order-history-sorted-asc" />
            <SortedDescendingCellStyle CssClass="order-history-sorted-desc" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBconn %>" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [placeorder] WHERE ([suser] = @suser)">
            <SelectParameters>
                <asp:SessionParameter Name="suser" SessionField="User" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
