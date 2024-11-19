<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdf.aspx.cs" Inherits="projectdemo.pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
      .container {
         position: fixed;
         top: 20%;
         left: 28%;
         border-radius: 7px;
      }
      .card {
         box-sizing: content-box;
         width: 1000px;
         height: 400px;
         padding: 30px;
         border: 1px solid black;
         font-style: sans-serif;
         background-color: #f0f0f0;
      }
      h2 {
         text-align: center;
         color: #24650b;
      }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="container">
      <button id="pdfButton"><b>Click here to Generate PDF</b></button>
                
      <div class="card" id="generatePDF">
    <asp:Panel ID="Panel1" runat="server">
        <table>
            <tr>
                <td style="text-align:center">
                    <h2 style="text-align:center">Retail Invoice</h2>
                </td>
            </tr>
             <tr>
                <td>
                    Order no:
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <br /><br />
                    Order date:
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                Buyer Address:<br />
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                Seller address:<br /><br />
                                Satara factory,Maharashtra..
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
             <tr>
                <td>
                    
                    <asp:GridView ID="GridView1" runat="server" Width="1000px" AlternatingRowStyle-Wrap="False" AutoGenerateColumns="False">
    <AlternatingRowStyle Wrap="False" />
    <Columns>
        <asp:BoundField DataField="sno" HeaderText="Sno">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="productid" HeaderText="Product Id">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="productname" HeaderText="Product Name">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="quantity" HeaderText="Quantity">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="price" HeaderText="Price">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="totalprice" HeaderText="Total Price">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
    </Columns>
</asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT * FROM [ODetail_tbl]"></asp:SqlDataSource>
                </td>
            </tr>
             <tr>
                <td>
                    Grand Total:
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
             <tr>
                <td align="center">
                    This is Computer Genetared invoice and does not require signature
                </td>
            </tr>

        </table>
    </asp:Panel>
  <%--</div>--%>
   </div>
   <script>
      var button = document.getElementById("pdfButton");
      var makepdf = document.getElementById("generatePDF");
      button.addEventListener("click", function () {
         var mywindow = window.open("", "PRINT", "height=600,width=600");
         mywindow.document.write(makepdf.innerHTML);
         mywindow.document.close();
         mywindow.focus();
         mywindow.print();
         return true;
      });
   </script>
        </div>
                 </div>
        
    </form>
</body>
</html>
