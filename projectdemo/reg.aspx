<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg.aspx.cs" Inherits="projectdemo.reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Gamepad</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">	
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets --> 
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- header section start -->
	<div class="header_section">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
           <%-- <div class="logo"><a href="index.html"><img src="images/logo.png"></a></div>--%>
             <div class="logo">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/image/logo1.png" />
                </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <a class="nav-link" href="Products.aspx">HOME</a>
                </li>
                
             <%--   <li class="nav-item">
                  <a class="nav-link" href="product.html">OUR PRODUCTS</a>
                </li>
               
                <li class="nav-item">
                  <a class="nav-link" href="contact.html">CONTACT US</a>
                </li>--%>
                <li class="nav-item">
                  <a class="nav-link" href="#"><img src="images/search-icon.png"></a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="Login.aspx">LoG-In</a>
                </li>
               
              </ul>
            </div>
        </nav>
	</div>
	<!-- header section end -->
            <h1>Registration Page:</h1>
             <!-- contact section start -->
  <div class="contact_section layout_padding padding_top_0">
    <div class="container">
      <div class="row">
            <div class="col-md-2">
          <div></div></div>
        <div class="col-md-6">
          <div class="email_box">
                    <div class="input_main">
                       <div class="container">
                          <form action="/action_page.php">
                            <div class="form-group">
                              
                              <%--<input type="text" class="email-bt" id="txtfname" placeholder=" First Name" name="txtfName">--%>
                                <asp:TextBox  class="email-bt" id="txtfname" placeholder="Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="name required" ControlToValidate="txtfname">*</asp:RequiredFieldValidator>

                            </div>
                               <div class="form-group">
                             <%-- <input type="text" class="email-bt" id="txtlname" placeholder="Last Name" name="txtlname">--%>
                                   <asp:TextBox class="email-bt" id="txtlname" placeholder=" user Name" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtlname">*</asp:RequiredFieldValidator>

                            </div>
                              <div class="form-group">
                                  <asp:DropDownList ID="DropDownList1" class="email-bt"  runat="server">
                                      <asp:ListItem>Select Gender</asp:ListItem>
                                      <asp:ListItem>Male</asp:ListItem>
                                      <asp:ListItem>Female</asp:ListItem>
                                      <asp:ListItem>Other</asp:ListItem>
                                      <asp:ListItem></asp:ListItem>
                                  </asp:DropDownList>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="required field" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>


                            </div>
                              <div class="form-group">
                              <%--<input type="text" class="email-bt" id="txtmail" placeholder="Email" name="txtmail">--%>
                                  <asp:TextBox class="email-bt" id="txtmail" placeholder="Email" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredField" ControlToValidate="txtmail">*</asp:RequiredFieldValidator>
                            </div>
                              <div class="form-group">
                              <%--<input type="text" class="email-bt" id="txtmobile" placeholder="Phone Numbar" name="txtmobile">--%>
                                  <asp:TextBox class="email-bt" id="txtmobile" placeholder="Phone Numbar" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="txtmobile">*</asp:RequiredFieldValidator>
<%--                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="invalid mobile no" ControlToValidate="txtmobile" ValidationExpression="\d{1,5}"></asp:RegularExpressionValidator>--%>
                            </div>
                                <div class="form-group">
                                <%--<textarea class="massage-bt" placeholder="Address" rows="5" id="txtaddress" name="txtaddress"></textarea>--%>
                                    <asp:TextBox class="massage-bt" placeholder="Address" rows="5" id="txtaddress" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredField" ControlToValidate="txtaddress">*</asp:RequiredFieldValidator>
                            </div>
                             
                              <div class="form-group">
                              <%--<input type="text" class="email-bt" id="txtpass" placeholder="PassWord" name="txtpass">--%>
                                  <asp:TextBox class="email-bt" id="txtpass" placeholder="PassWord" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredField" Text="*" ControlToValidate="txtpass"></asp:RequiredFieldValidator>

                            </div>
                               <div class="form-group">
                             <%-- <input type="text" class="email-bt" id="txtcpass" placeholder="Confirm Password" name="txtcpass">--%>
                                   <asp:TextBox class="email-bt" id="txtcpass" placeholder="Confirm Password" runat="server"></asp:TextBox>
                            </div>
                            
                            
                            
                          
                            
                          </form>   
                       </div> 
                       
                            <asp:Button ID="btnReg" class="main_bt" runat="server" Text="Register" OnClick="btnReg_Click" Font-Bold="True"  />
                       
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
                 </div>
        </div>
        <div class="col-md-4">
          <div class="image_6"><img src="images/register.png"></div>
        </div>
      </div>
    </div>
  </div>
  <!-- contact section end -->
        </div>
    </form>
</body>
</html>
