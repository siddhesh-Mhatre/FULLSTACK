<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderHIstory.aspx.cs" Inherits="Ecom2.AdminPanel.OrderHIstory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBconn %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>





    <asp:GridView  ID="GridView2"  runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="GridView2_RowCommand1">
        <Columns>
            <asp:TemplateField HeaderText="image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" class="w-50" ImageUrl='<%#Eval("pic") %>'></asp:Image>
                </ItemTemplate>
                <ControlStyle Height="60px" Width="60px" />
            </asp:TemplateField>
          


            <asp:TemplateField HeaderText="ProductName">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("pname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

                        <asp:TemplateField HeaderText="Customer Name">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("suser") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" Text="Approve" CommandName="Status" CommandArgument='<%#Eval("pid") %>' />
                </ItemTemplate>
            </asp:TemplateField>

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


</asp:Content>
