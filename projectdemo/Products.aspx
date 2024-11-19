<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="projectdemo.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="product_section layout_padding">
    <div class="container">
    <table style="height=30px width=1150px">
        <tr >
            <td colspan="2" style="text-align:right">
                <div class="form-group">
                <asp:Label ID="Label4" class="email-bt" runat="server" style="text-align:left" Font-Bold="True" Font-Italic="True" Font-Names="Arial Black"></asp:Label>
                   
                <asp:HyperLink ID="HyperLink1" class="email-bt" runat="server" Font-Bold="True" Font-Names="Arial Rounded MT Bold" NavigateUrl="~/Login.aspx">click to Login</asp:HyperLink>
                     
                <asp:Button ID="Button1" runat="server" Text="Log Out" BackColor="#FFCC99" BorderColor="White" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="#66CCFF" Width="105px" OnClick="Button1_Click" />
                    </div>
            <%--</td>
            <td style="text-align:right">--%>
                <div class="form-group">
                <asp:TextBox ID="TextBox1" class="email-bt" placeholder="Search" runat="server" ></asp:TextBox>
                <asp:ImageButton ID="ImageButton2"  runat="server" Height="23px" ImageUrl="~/images/search-icon.png" OnClick="ImageButton2_Click" Width="25px"  />
    <%--            </div>
            </td>
        </tr>
  </table>--%>
        </div>
         </div>
        
     <div class="product_section layout_padding">
    <div class="container">
      <div class="product_text">Our <span style="color: #5ca0e9;">products</span></div>
      <p class="long_text"></p>
      <div class="product_section_2">
          <div class="row">
    
         <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" Height="493px" Width="1110px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
           <table>
               <tr>
                   <td style="text-align:center">
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>' Font-Bold="True" Font-Names="Arial Black" ForeColor="Black"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td style="text-align:center">
                       <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderWidth="2px" Height="279px" Width="278px" ImageUrl='<%# Eval("Image") %>' />
                   </td>
               </tr>
               <tr>
                   <td text-align="center">
                       <asp:Label ID="Label2" runat="server" Text="Price Rs" Font-Bold="True" Font-Names="Arial Black" ForeColor="Black" style="text-align:center"></asp:Label>
                       <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' Font-Bold="True" Font-Names="Arial Black" ForeColor="Black" style="text-align:center"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td text-align="center">
                       <asp:DropDownList ID="DropDownList1" runat="server">
                           <asp:ListItem>1</asp:ListItem>
                           <asp:ListItem>2</asp:ListItem>
                           <asp:ListItem>3</asp:ListItem>
                           <asp:ListItem>4</asp:ListItem>
                           <asp:ListItem>5</asp:ListItem>
                           <asp:ListItem></asp:ListItem>
                       </asp:DropDownList>
                   </td>
               </tr>
               <tr>
                   <td text-align="center">
                       <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/image/shopnow.png" Width="160px" CommandArgument='<%# Eval("ProductId") %>' CommandName="AddToCart" />
                   </td>
               </tr>
           </table>
           
        </ItemTemplate>
        
    </asp:DataList>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT * FROM [PDetail_tbl]"></asp:SqlDataSource>
               </div>
             </div>
      </div>
          </div>
  </div>
    <table>
      
    </table>
     </div>
     </div>
     </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
