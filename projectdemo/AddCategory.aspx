<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="projectdemo.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="product_section layout_padding">
    <div class="container">
    <center>
        <table>
            <tr>
                <td>
                    <h2>Add Category</h2>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                   <b style="font-size:21px;font-weight:bold">Category:</b>
                </td>
            </tr>
             <tr>
                <td>
                    <div class="form-group">
                         
                        <asp:TextBox ID="TextBox1" class="email-bt" runat="server" Width="230px" Height="44px" 
                            Font-Bold="True" BorderWidth="2" CausesValidation="True" Font-Size="Medium" ForeColor="Black"></asp:TextBox>
                        <br />
                   
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                            </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group">
                        <asp:Button ID="Button1" runat="server" Text="Add" BackColor="Aqua" BorderColor="Black" BorderWidth="2px" 
                            Font-Bold="True" Font-Size="Medium" Height="44px" Width="80px" OnClick="Button1_Click" />
                          </div>
                </td>
            </tr>
              <tr>
                <td colspan="2">
                     <div class="form-group">
                         <br />
                          </div>
                </td>
            </tr>
              <tr>
                <td colspan="2" align="center">
                    <div class="form-group">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="Black" BorderWidth="2px" DataKeyNames="CategoryId" EmptyDataText="No record to Display" Font-Bold="True" PageSize="4" Width="257px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated">
                            <Columns>
                                <asp:TemplateField HeaderText="Catagory">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Font-Bold="True" Text='<%# Eval("CatagoryName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CatagoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
                                <ItemStyle HorizontalAlign="Center" />
                               </asp:CommandField>
                            </Columns>
                            <HeaderStyle BorderColor="Silver" BorderWidth="3px" Font-Bold="True" Font-Size="Large" />
                        </asp:GridView>
                        <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="CatagoryName" HeaderText="Category" />
                            </Columns>
                        </asp:GridView>--%>
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT [CatagoryName] FROM [catagory]"></asp:SqlDataSource>
                          </div>
                </td>
            </tr>

        </table>
    </center>
        </div>
         </div>
</asp:Content>
