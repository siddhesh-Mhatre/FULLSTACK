<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="Ecom2.PlaceOrder" EnableEventValidation = "false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 500px;
            height: 161px;
        }
        .auto-style11 {
            text-decoration: underline;
        }
        .auto-style12 {
            width: 100%;
            height: 362px;
        }
        .auto-style14 {
            width: 494px;
            height: 137px;
        }
        .auto-style15 {
            width: 494px;
            height: 106px;
        }
        .auto-style17 {
            width: 555px;
            height: 137px;
        }
        .auto-style18 {
            width: 555px;
            height: 106px;
        }
        .auto-style19 {
            width: 555px;
        }
    </style>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header>
         <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    </header>

    <div class="container my-5">

        <asp:Panel ID="Panel1" runat="server">
            <table border="1" class="auto-style12" style="border-style: double">
                <tr>
                    <td class="auto-style17"><span class="auto-style11"><strong><em>Order ID:</em></strong></span>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style14"><span class="auto-style11"><strong><em>Email ID:</em></strong></span><asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />
                        <br />
                        <span class="auto-style11"><strong><em>Contact Details:</em></strong></span><asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18"><span class="auto-style11"><strong><em>Seller Address: </em></strong></span>
                        <br />
                        <br />
                        Amazon.Inc ,<br />
                        Thane West,<br />
                        Wagle Estate,400012</td>
                    <td class="auto-style15"><span class="auto-style11"><strong><em>Buyer Address: </em></strong></span>
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style6">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="pid" DataSourceID="SqlDataSource2" Height="212px" Width="1142px">
                            <Columns>
                                <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid">
                                </asp:BoundField>
                                <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname">
                                </asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price">
                                </asp:BoundField>
                                <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty">
                                </asp:BoundField>
                                <asp:BoundField DataField="suser" HeaderText="suser" SortExpression="suser">
                                </asp:BoundField>
                                <asp:BoundField DataField="perprice" HeaderText="perprice" SortExpression="perprice">
                                </asp:BoundField>
                                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact">
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="dt" HeaderText="dt" SortExpression="dt" />
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBconn %>" SelectCommand="SELECT [pid], [pname], [price], [qty], [suser], [perprice], [Contact], [Address], [dt] FROM [placeorder] WHERE ([suser] = @suser)">
                            <SelectParameters>
                                <asp:SessionParameter Name="suser" SessionField="User" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style19">Grand Total :<asp:Label ID="Label5" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>



    </div>

    <asp:Button ID="Button1" runat="server" Text="Download Invoice" class="btn btn-danger" OnClick="Button1_Click" />

&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Email Invoice" class="btn btn-info" OnClick="Button2_Click" />

&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server"  class="btn-success" Text="Pay now" OnClick="Button3_Click" />

    <br />
    <br />

</asp:Content>