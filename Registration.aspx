<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Registration.aspx.cs" Inherits="EcommerceApp.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <form id="form1" runat="server">
            <h1 class="text-center mb-4">Registration Page</h1>
            <div class="card mx-auto" style="width: 30%;">
                <div class="card-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Enter Email ID" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Username</label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Enter Username" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block" Text="Submit" OnClick="Button1_Click" />
                </div>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
