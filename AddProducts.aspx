<%@ Page Title="Add Products" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="Ecom2.AdminPanel.Functionality.AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-pzjw8f+ua7Kw1TIqQUYkSUEpD0f7P5TzhX1Pqtm3xHfGzC+3hnZZ3G24H3PbH7" crossorigin="anonymous">
    <style>
        .product-form {
            max-width: 600px;
            margin: auto;
            padding: 2rem;
            background-color: #f7f7f7;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-form h2 {
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .product-form .form-group {
            margin-bottom: 1.5rem;
        }
        .product-form .btn-primary {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="product-form">
            <h2>Add Product</h2>
            <div class="form-group">
                <label for="TextBox1">Product Name</label>
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Enter product name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBox2">Product Price</label>
                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="Enter product price"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="FileUpload1">Product Image</label>
                <asp:FileUpload ID="FileUpload1" CssClass="form-control-file" runat="server" />
            </div>
            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Save" />
        </div>
    </div>

</asp:Content>
