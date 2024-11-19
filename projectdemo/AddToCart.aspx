<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="projectdemo.AddToCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <div class="product_section layout_padding">
    <div class="container">
    <div align="center" style="margin:0 auto;">
        <br /><br /><br /><br />
    <h2 style="text-decoration:underline overline blink">You have Following Product In Your cart</h2>
    <br /><br />
    <asp:HyperLink runat="server" Font-Bold="True" 
        Font-Names="Colonna MT" Font-Size="X-Large" NavigateUrl="~/Products.aspx">Continue Shoping...</asp:HyperLink>
        <br /><br />
        <asp:GridView id="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderWidth="5px" EmptyDataText="No Product Avilable in shoppingcart" Font-Bold="True" Height="257px" ShowFooter="True" Width="1100px" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="Sr no">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pid" HeaderText="Product Id">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="pimage" HeaderText="Product image">
                    <ControlStyle Height="300px" Width="340px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:BoundField DataField="pname" HeaderText="Product Name">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pprice" HeaderText="Price">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pquantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Ptotalprice" HeaderText="Total Price">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" ForeColor="White" />
        </asp:GridView>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Place Order" BackColor="#0099FF" BorderColor="Blue" BorderStyle="Ridge" Font-Bold="True" Font-Size="Large" Height="46px" Width="135px" OnClick="Button1_Click" />
        </div>
        </div>
         </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
