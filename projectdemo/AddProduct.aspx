<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="projectdemo.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
         <tr>
                    <td colspan="2">
                        <h2>Add Products..</h2>
                        
                    </td>
                </tr>
         <tr>
                    <td>
                        <b>Category:</b>
                        <asp:DropDownList ID="DropDownList1" class="email-bt" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="CatagoryName" DataValueField="CatagoryName"></asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category Is Mandetory"
                            ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>product Id:</b>
                        <asp:TextBox ID="Txtid" class="email-bt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="ID Is Mandetory"
                            ControlToValidate="Txtid" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Product Name:</b>
                         <asp:TextBox ID="Txtpname" class="email-bt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Product Name Is Mandetory"
                            ControlToValidate="Txtpname" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <b>product Desc:</b>
                        <asp:TextBox ID="TxtDesc" class="email-bt" runat="server" TextMode="MultiLine"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Product Desc Is Mandetory"
                            ControlToValidate="TxtDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Product Price(Rs):</b>
                         <asp:TextBox ID="Txtprice" class="email-bt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Product Price Is Mandetory"
                            ControlToValidate="Txtprice" ForeColor="Red"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txtprice"
                            ErrorMessage="Price Is Invalid" ForeColor="Red" ValidationExpression="\d{1,5}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
        <tr>
                     <td>
                        <b>Quantity:</b>
                        <asp:TextBox ID="Txtqnt" class="email-bt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Product Quantity Is Mandetory"
                            ControlToValidate="Txtqnt" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txtqnt"
                            ErrorMessage="Quantity Is Inavlid" ForeColor="Red" ValidationExpression="\d{1,5}" ></asp:RegularExpressionValidator>
                    </td>
            </tr>
                 <tr>
                    <td>
                        <b>Product Image:</b>
                        <asp:FileUpload ID="FileUpload1" class="email-bt" runat="server" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Product Image Is Mandetory"
                            ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr>
                <td>
                    <br />
                </td>
            </tr>
         <tr>
                <td align="center">
                    <asp:Button ID="Button1" runat="server" Text="Add" Font-Bold="True" ForeColor="Red" Height="36px" Width="88px" OnClick="Button1_Click" />



                </td>
            </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </td>
        </tr>
         <tr>
                <td>
                    <br />
                </td>
            </tr>
         <tr>
                <td align="center">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fix the following Error" />
                    <br />
                    <br />
                </td>
            </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </td>
        </tr>
    </table>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT * FROM [catagory]"></asp:SqlDataSource>
    </div>
</asp:Content>
