<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Ecom2.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-pzjw8f+ua7Kw1TIqQUYkSUEpD0f7P5TzhX1Pqtm3xHfGzC+3hnZZ3G24H3PbH7" crossorigin="anonymous">
    <style>
        .card {
            margin-bottom: 30px;
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .list-group-item {
            font-size: 1rem;
        }
        .btn-info {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="row">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" CellPadding="10" CellSpacing="50">
                <ItemTemplate>
                    <div class="col mb-4">
                        <div class="card h-100">
                            <img class="card-img-top  img-fluid fixed-size" src='<%#Eval("ProductImg")%>' alt="Product image">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("ProductName")%></h5>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Product Price: $<%#Eval("ProductPrice")%></li>
                                <li class="list-group-item">Quantity:
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                            </ul>
                            <div class="card-body">
                                <asp:Button class="btn btn-info" CommandName="AddToCart" CommandArgument='<%#Eval("ProductID")%>' ID="Button1" runat="server" Text="ADD TO CART" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</asp:Content>
