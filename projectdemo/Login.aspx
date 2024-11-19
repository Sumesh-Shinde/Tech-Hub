<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="projectdemo.Login" %>

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
<title>Tech Hub</title>
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
                
               <%-- <li class="nav-item">
                  <a class="nav-link" href="product.html">OUR PRODUCTS</a>
                </li>
               
                <li class="nav-item">
                  <a class="nav-link" href="contact.html">CONTACT US</a>
                </li>--%>
                <li class="nav-item">
                  <a class="nav-link" href="#"><img src="images/search-icon.png"></a>
                </li>
               <%-- <li class="nav-item active">
                  <a class="nav-link" href="Login.aspx">LoG-In</a>
                </li>--%>
               
              </ul>
            </div>
        </nav>
	</div>
	<!-- header section end -->
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
            <table >
                <tr>
                    <td colspan="2" align="center">
                        <h2>Login Page</h2>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Email Id:</b>
                        <asp:TextBox ID="TextBox1" class="email-bt" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Password:</b>
                         <asp:TextBox ID="TextBox2" class="email-bt" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                         <div class="form-group">
                             <asp:Button ID="Button1" runat="server" Text="Login" Font-Bold="True" Font-Size="Large" OnClick="Button1_Click" />
                             <br />
                             <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                              </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>New Registration:</b>
                        <asp:HyperLink ID="HyperLink1" class="email-bt" runat="server" Font-Bold="True" NavigateUrl="~/reg.aspx">Register Here</asp:HyperLink>
                    </td>
                </tr>
            </table>
                               </form>   
                       </div>
                           </div>
                 </div>
        </div>
          <div class="col-md-4">
          <div class="image_6"><img src="images/login.png"></div>
        </div>
           </div>
    </div>
  </div>
        </div>
    </form>
</body>
</html>
