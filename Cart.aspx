<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Ecom2.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-pzjw8f+ua7Kw1TIqQUYkSUEpD0f7P5TzhX1Pqtm3xHfGzC+3hnZZ3G24H3PbH7" crossorigin="anonymous">
    <style>
        .cart-image {
            height: 50px;
            width: 50px;
            object-fit: cover;
        }
        .cart-header {
            background-color: #336666;
            color: white;
            text-align: center;
        }
        .cart-footer {
            background-color: white;
            color: #333333;
        }
        .cart-row {
            background-color: white;
            color: #333333;
        }
        .cart-selected {
            background-color: #339966;
            color: white;
            font-weight: bold;
        }
        .cart-sorted-asc {
            background-color: #F7F7F7;
        }
        .cart-sorted-desc {
            background-color: #E5E5E5;
        }
        .btn-outline-danger {
            padding: 0.375rem 0.75rem;
        }
        .form-control {
            width: 50%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" GridLines="None" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image CssClass="cart-image" ImageUrl='<%# Eval("pic") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actual Price">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("perprice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("qty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("dt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("suser") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Id">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("pid") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Remove">
                    <ItemTemplate>
                        <asp:Button ID="Button3" runat="server" CommandName="Delete" CssClass="btn btn-outline-danger" Text="❌" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle CssClass="cart-footer" />
            <HeaderStyle CssClass="cart-header" />
            <PagerStyle CssClass="cart-header" HorizontalAlign="Center" />
            <RowStyle CssClass="cart-row" />
            <SelectedRowStyle CssClass="cart-selected" />
            <SortedAscendingCellStyle CssClass="cart-sorted-asc" />
            <SortedDescendingCellStyle CssClass="cart-sorted-desc" />
        </asp:GridView>
    </div>

    <div class="container mt-5">
        <div class="row">
            <div class="col-12 mb-3">
                <asp:Label ID="Label9" runat="server" Text="Grand Total: " CssClass="font-weight-bold"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text="" CssClass="font-weight-bold"></asp:Label>
            </div>
            <div class="col-12 mb-3">
                <div class="form-group">
                    <label for="TextBox1">Enter Delivery Address:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TextBox2">Contact Details:</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Contact Number"></asp:TextBox>
                </div>
            </div>
            <div class="col-12">
                <asp:Button ID="Button1" runat="server" Text="Continue Shopping" OnClick="Button1_Click" CssClass="btn btn-danger" />
                <asp:Button ID="Button2" runat="server" Text="Place Order" OnClick="Button2_Click" CssClass="btn btn-success ml-3" />
            </div>
        </div>
    </div>

</asp:Content>
