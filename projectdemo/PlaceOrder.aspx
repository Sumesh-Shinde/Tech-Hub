<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="projectdemo.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
        <table align="center" style="margin-top:50px; width:531px ; height:563px" >
            <tr>
                <td colspan="2" align="center" style="vertical-align:top">
                    <asp:Label ID="Label1" runat="server" Text="Card Details" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                </td>
            </tr>
             <tr>
                <td align="center" style="vertical-align:top">
                    <asp:TextBox ID="TextBox1" runat="server" class="email-bt" BorderColor="Black" BorderWidth="2px" Font-Bold="True" 
                        Font-Size="Medium"  placeholder="First Name"></asp:TextBox>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="email-bt" runat="server" ErrorMessage="First name is Empty"
                        ControlToValidate="TextBox1" ForeColor="#FF3300">*</asp:RequiredFieldValidator>


                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="email-bt" runat="server" ErrorMessage="First name must be in characters " 
                        ControlToValidate="TextBox1" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                </td>
                 <td align="center" style="vertical-align:top">
                     <asp:TextBox ID="TextBox2" class="email-bt" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" 
                        Font-Size="Medium"  placeholder="Last Name"></asp:TextBox>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="email-bt" runat="server" ErrorMessage="Last name is Empty"
                        ControlToValidate="TextBox2" ForeColor="#FF3300">*</asp:RequiredFieldValidator>


                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" class="email-bt" runat="server" ErrorMessage="Last name must be in characters " 
                        ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                 </td>
            </tr>
             <tr>
                <td colspan="2" align="center">
                    <asp:Image ID="Image1" class="email-bt" runat="server" BorderColor="Black" BorderWidth="2px" ImageUrl="~/image/Payments.png" Width="438px" />
                </td>
            </tr>
             <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="Label2" class="email-bt" runat="server" Text="Card Number" Font-Bold="True" Font-Size="Large" ForeColor="White"></asp:Label>
                </td>
            </tr>
             <tr>
                <td colspan="2" align="center" style="vertical-align:top">
                     <asp:TextBox ID="TextBox3" class="email-bt" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" 
                        Font-Size="Medium"  placeholder="16 digits"></asp:TextBox>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="email-bt" runat="server" ErrorMessage="card Number  is Empty"
                        ControlToValidate="TextBox3" ForeColor="Red">*</asp:RequiredFieldValidator>


                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" class="email-bt" runat="server" ErrorMessage="card number must be in 16 digits" 
                        ControlToValidate="TextBox3" ForeColor="Red" ValidationExpression="[0-9]{16}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr>
                <td align="center">
                    <asp:Label ID="Labeledate" class="email-bt" runat="server" Text="Expiry Date" Font-Bold="True"
                        Font-Size="Large" ForeColor="White"></asp:Label>
                     </td>
                 <td align="center">
                     <asp:Label ID="Labelcvv" class="email-bt" runat="server" Text="CVV" Font-Bold="True"
                        Font-Size="Large" ForeColor="White"></asp:Label>
               </td>
            </tr>
             <tr>
                <td align="center" style="vertical-align:top">
                    
                    <asp:TextBox ID="TextBox4" class="email-bt" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" 
                        Font-Size="Medium"  placeholder="Expiry Date:MM/YY(Eg:061996)"></asp:TextBox>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="email-bt" runat="server" ErrorMessage="Expiry date  is Empty"
                        ControlToValidate="TextBox4" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                  <td align="center" style="vertical-align:top">
                      
                     <asp:TextBox ID="TextBox5" class="email-bt" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" 
                        Font-Size="Medium" placeholder="CVV:3 digits"></asp:TextBox>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" class="email-bt" runat="server" ErrorMessage="CVV  is Empty"
                        ControlToValidate="TextBox5" ForeColor="Red">*</asp:RequiredFieldValidator>


                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" class="email-bt" runat="server" ErrorMessage="CVV number must be  3 digits" 
                        ControlToValidate="TextBox5" ForeColor="Red" ValidationExpression="[0-9]{3}">*</asp:RegularExpressionValidator>
                </td>
            
               
            </tr>
             <tr>
                <td  colspan="2" align="center" style="vertical-align:top">
                    <asp:TextBox ID="TextBox6" class="email-bt" runat="server" BorderColor="Black" BorderWidth="2px" Font-Bold="True" 
                        Font-Size="X-Large"  placeholder="Billing Address" TextMode="MultiLine"></asp:TextBox>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" class="email-bt" runat="server" ErrorMessage="Address is Empty"
                        ControlToValidate="TextBox6" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td colspan="2" align="center" >
                    <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="Black"
                        BorderColor="White" BorderWidth="2px" Font-Bold="True" Font-Size="Large" ForeColor="White" Width="188px" OnClick="Button1_Click" />
                </td>
            </tr>
             <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" class="email-bt" runat="server" Font-Bold="True" ForeColor="Red" HeaderText="fix the following errors" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="HyperLink1" class="email-bt" runat="server" Font-Bold="True" NavigateUrl="~/AddToCart.aspx">Previous page</asp:HyperLink>


                    &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;
                   
                    <asp:HyperLink ID="HyperLink2" class="email-bt" runat="server" Font-Bold="True" NavigateUrl="~/Products.aspx">Home Page</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
